/// Decoders that turn GraphQL response data (JSON-decoded maps and lists)
/// into this package's domain types.
///
/// Every function here is a pure function of its arguments, so it can be
/// unit-tested without a network connection. The GraphQL client normalizes
/// inline fragments into flat maps carrying a `__typename` key, which
/// [devVal] and [plotSeries] dispatch on.
///
/// This module is internal; it is not exported by the package.
library;

import 'dart:convert';
import 'dart:typed_data';

import 'acsys_api.dart';
import 'device_values.dart';
import 'exceptions.dart';
import 'status.dart';

// ---------------------------------------------------------------------------
// Timestamps
// ---------------------------------------------------------------------------

/// Converts a timestamp in (fractional) seconds since the Unix epoch into a
/// [DateTime].
DateTime fromTs(num ts) =>
    DateTime.fromMicrosecondsSinceEpoch((ts * 1000000.0).toInt());

/// Converts a [DateTime] into (fractional) seconds since the Unix epoch, the
/// format the API expects. `null` passes through.
double? toFloatTs(DateTime? dt) => switch (dt) {
  null => null,
  final d => d.microsecondsSinceEpoch / 1000000.0,
};

// ---------------------------------------------------------------------------
// Device values
// ---------------------------------------------------------------------------

// JSON has no NaN, so the gateway sends a NaN reading as null.
double _toDouble(Object? n) => (n as num?)?.toDouble() ?? double.nan;

// The following helpers decode a JSON array directly into a pre-sized typed
// list. This avoids building an intermediate growable List (of boxed values)
// only to copy it again into the typed list.

Float64List _toFloat64List(Object? src) {
  final list = src as List<Object?>;
  final out = Float64List(list.length);

  for (var ii = 0; ii < list.length; ii++) {
    out[ii] = _toDouble(list[ii]);
  }
  return out;
}

// Fills a pre-sized integer typed list (Int32List, Uint8List, ...) from a
// JSON array. [make] allocates the destination with the source's length.
T _toIntList<T extends List<int>>(Object? src, T Function(int) make) {
  final list = src as List<Object?>;
  final out = make(list.length);

  for (var ii = 0; ii < list.length; ii++) {
    out[ii] = list[ii] as int;
  }
  return out;
}

/// Converts a GraphQL `DataType` result map into a [DeviceValue].
///
/// Throws [ACSysGraphQLException] if `__typename` is missing or unknown.
DeviceValue devVal(Map<String, dynamic> jsonMap) =>
    switch (jsonMap['__typename'] as String?) {
      'StatusReply' => DevStatusCode(Status.fromInt(jsonMap['status'] as int)),
      'Scalar' => DevScalar(_toDouble(jsonMap['scalarValue'])),
      'ScalarArray' => DevScalarArray(
        _toFloat64List(jsonMap['scalarArrayValue']),
      ),
      'IntArray' => DevIntArray(
        _toIntList(jsonMap['intArrayValue'], Int32List.new),
      ),
      'Raw' => DevRaw(_toIntList(jsonMap['rawValue'], Uint8List.new)),
      'Text' => DevText(jsonMap['textValue'] as String),
      'TextArray' => DevTextArray(
        (jsonMap['textArrayValue'] as List<Object?>).cast<String>(),
      ),
      _ => throw ACSysGraphQLException(
        "DeviceValue type not found: __typename=${jsonMap['__typename']}",
      ),
    };

// ---------------------------------------------------------------------------
// Readings
// ---------------------------------------------------------------------------

/// Decodes the data of a ReadDevices query. Its `acceleratorData` field is a
/// list of `{refId, data: [row, ...]}` entries; the rows of all entries are
/// flattened into a single list.
List<Reading> readingsFromQuery(Map<String, dynamic> data) {
  final out = <Reading>[];

  for (final entry in data['acceleratorData'] as List<Object?>) {
    _addReadings(entry, out);
  }
  return out;
}

/// Decodes one StreamData subscription event. Its `acceleratorData` field is
/// a single `{refId, data: [row, ...]}` entry.
List<Reading> readingsFromSubscription(Map<String, dynamic> data) =>
    _addReadings(data['acceleratorData'], []);

// Appends the readings of one `{refId, data}` entry to [out]. The refId lives
// on the entry, so it is shared by all of the entry's rows.
List<Reading> _addReadings(Object? entry, List<Reading> out) {
  if (entry case {'refId': final int refId, 'data': final List<Object?> rows}) {
    for (final row in rows) {
      out.add(_reading(row, refId));
    }
    return out;
  }
  throw ACSysGraphQLException('Unexpected acceleratorData entry shape: $entry');
}

Reading _reading(Object? row, int refId) => switch (row) {
  {'timestamp': final num ts, 'result': final Map<String, dynamic> r} =>
    Reading(refId: refId, timestamp: fromTs(ts), value: devVal(r)),
  _ => throw ACSysGraphQLException(
    'Unexpected acceleratorData row shape: $row',
  ),
};

// ---------------------------------------------------------------------------
// Plots
// ---------------------------------------------------------------------------

/// Decodes one StartPlot subscription event.
///
/// Channels are reported in request order, so channel `i` is labelled with
/// `drfs[i]`. The x-axis settings aren't echoed by the server, so the
/// caller's request values are passed through.
PlotReply plotReply(
  Map<String, dynamic> data,
  List<String> drfs, {
  double? xMin,
  double? xMax,
  int? windowSize,
}) {
  // The GraphQL client wraps the response under the operation field name.
  final plotInfo = data['startPlot'] as Map<String, dynamic>;
  final rawChannels = plotInfo['data'] as List<Object?>;

  if (rawChannels.length > drfs.length) {
    throw ACSysGraphQLException(
      'startPlot returned ${rawChannels.length} channels for '
      '${drfs.length} requested devices',
    );
  }

  return PlotReply(
    plotId: plotInfo['plotId'] as String,
    requestTime: (plotInfo['timestamp'] as num).toDouble(),
    triggerTimestamp: (plotInfo['triggerTimestamp'] as num?)?.toDouble(),
    xAxisUnits: "Time",
    xAxisMin: xMin,
    xAxisMax: xMax,
    windowSize: windowSize,
    data: List<PlotChannelData>.generate(
      rawChannels.length,
      (ii) => _plotChannel(rawChannels[ii] as Map<String, dynamic>, drfs[ii]),
      growable: false,
    ),
  );
}

PlotChannelData _plotChannel(Map<String, dynamic> ch, String name) =>
    PlotChannelData(
      name: name,
      units: ch['channelUnits'] as String,
      rate: ch['channelRate'] as String,
      status: ch['channelStatus'] as int,
      series: plotSeries(ch['channelData'] as List<Object?>),
    );

/// Decodes a channel's `channelData` rows directly into column storage.
///
/// A channel carries a single data type, so the first row decides the
/// layout: [ArraySeries] for `ScalarArray`, otherwise [ScalarSeries] (which
/// is also what an empty channel produces). Any row of a different type, or
/// a malformed row, throws [ACSysGraphQLException].
PlotSeries plotSeries(List<Object?> rows) {
  final n = rows.length;
  final t = Float64List(n);
  final isArray = switch (rows.firstOrNull) {
    {'result': {'__typename': 'ScalarArray'}} => true,
    _ => false,
  };

  if (isArray) {
    return ArraySeries(
      t,
      List<Float64List>.generate(n, (ii) {
        final r = _plotRow(rows[ii], t, ii);

        return r['__typename'] == 'ScalarArray'
            ? _toFloat64List(r['scalarArrayValue'])
            : throw _mixedPlotRow(r);
      }, growable: false),
    );
  }

  final y = Float64List(n);

  for (var ii = 0; ii < n; ii++) {
    final r = _plotRow(rows[ii], t, ii);

    y[ii] = r['__typename'] == 'Scalar'
        ? _toDouble(r['scalarValue'])
        : throw _mixedPlotRow(r);
  }
  return ScalarSeries(t, y);
}

// Stores a channelData row's timestamp in `t[ii]` and returns the row's
// result map.
Map<String, dynamic> _plotRow(Object? row, Float64List t, int ii) {
  if (row case {
    'timestamp': final num ts,
    'result': final Map<String, dynamic> r,
  }) {
    t[ii] = ts.toDouble();
    return r;
  }
  throw ACSysGraphQLException('Unexpected channelData row shape: $row');
}

ACSysGraphQLException _mixedPlotRow(Map<String, dynamic> r) =>
    ACSysGraphQLException(
      'Plot channel mixes data types: unexpected '
      '__typename=${r['__typename']}',
    );

// ---------------------------------------------------------------------------
// Alarms
// ---------------------------------------------------------------------------

// Builds a fixed-length list by decoding each row map of a JSON array.
List<T> _mapRows<T>(Object? rows, T Function(Map<String, dynamic>) f) {
  final list = rows as List<Object?>;

  return List<T>.generate(
    list.length,
    (ii) => f(list[ii] as Map<String, dynamic>),
    growable: false,
  );
}

// Parses a timestamp field from an alarms row.
//
// The alarms backend has been observed to send timestamps either as a
// numeric epoch-seconds value (the same convention used by the acsys
// backend, see [fromTs]) or as an ISO-8601 string (e.g.
// "2026-08-21T17:53:33+00:00"). Some alarm rows also omit these fields
// entirely (e.g. `wake` for alarms that have never been acknowledged), in
// which case the field is `null`; that case falls back to the Unix epoch
// rather than crashing the client.
DateTime _alarmTimestamp(Object? value) => switch (value) {
  null => DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
  final num n => fromTs(n),
  final String s => DateTime.parse(s),
  _ => throw ACSysGraphQLException(
    'Unexpected timestamp format in alarm row: $value',
  ),
};

/// Converts a single alarm row map into an [Alarm].
///
/// The alarms backend sends `source`/`state`/`severity` as upper-case
/// strings (e.g. "ANALOG", "ALARMED", "LOW"); the incoming value is
/// upper-cased before matching to be resilient to any casing the backend
/// might use. Unrecognized values map to the `unknown` member.
Alarm alarmFromRow(Map<String, dynamic> row) {
  final AlarmSource source = switch ((row['source'] as String?)
      ?.toUpperCase()) {
    'ANALOG' => .analog,
    'DIGITAL' => .digital,
    'EPICS' => .epics,
    _ => .unknown,
  };

  final AlarmState state = switch ((row['state'] as String?)?.toUpperCase()) {
    'OK' => .ok,
    'ALARMED' => .alarmed,
    'BYPASSED' => .bypassed,
    'LATCHED' => .latched,
    'ACKNOWLEDGED' => .acknowledged,
    'UNBYPASSED' => .unbypassed,
    _ => .unknown,
  };

  final AlarmSeverity severity = switch ((row['severity'] as String?)
      ?.toUpperCase()) {
    'LOW' => .low,
    'HIGH' => .high,
    _ => .unknown,
  };

  return Alarm(
    device: row['device'] as String,
    source: source,
    state: state,
    severity: severity,
    acknowledgeable: row['acknowledgeable'] as bool,
    time: _alarmTimestamp(row['time']),
    epicsType: row['epicsType'] as String,
    user: row['user'] as String,
    wake: _alarmTimestamp(row['wake']),
  );
}

/// Decodes the `alarmsSnapshot` list into [Alarm]s.
List<Alarm> alarmsFromList(Object? rows) => _mapRows(rows, alarmFromRow);

// ---------------------------------------------------------------------------
// Plot configurations
// ---------------------------------------------------------------------------

// The `config` column holds the snapshot as a JSON-encoded string.
PlotConfigurationSnapshot _plotConfig(Map<String, dynamic> row) =>
    PlotConfigurationSnapshot.fromJson(
      PlotConfigId.fromInt(row['configId'] as int),
      row['configName'] as String,
      jsonDecode(row['config'] as String) as Map<String, dynamic>,
    );

/// Decodes the first row of a `plotConfiguration` result, or returns `null`
/// if the result is empty.
PlotConfigurationSnapshot? firstPlotConfig(Object? rows) {
  final list = rows as List<Object?>;

  return list.isEmpty ? null : _plotConfig(list.first as Map<String, dynamic>);
}

/// Decodes `plotConfiguration` rows into listings (ID and name only).
List<PlotConfigurationListing> plotListings(Object? rows) => _mapRows(
  rows,
  (row) => PlotConfigurationListing(
    configurationId: PlotConfigId.fromInt(row['configId'] as int),
    configurationName: row['configName'] as String,
  ),
);

/// Decodes the `usersLastConfiguration` field, a JSON-encoded string or
/// `null` if the user never saved one.
///
/// There is no persisted ID for a user's last configuration, so a transient
/// one is generated; the name is empty since the server doesn't store one.
PlotConfigurationSnapshot? lastUserConfig(Object? raw) => switch (raw) {
  null => null,
  final String s => PlotConfigurationSnapshot.fromJson(
    PlotConfigId.generate(),
    '',
    jsonDecode(s) as Map<String, dynamic>,
  ),
  _ => throw ACSysGraphQLException(
    'Unexpected usersLastConfiguration value: $raw',
  ),
};
