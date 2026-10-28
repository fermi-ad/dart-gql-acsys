import 'dart:typed_data';

import 'package:pure_dart_ui/pure_dart_ui.dart';

import 'exceptions.dart';
import 'device_values.dart';
import 'status.dart';

final class const Alarm({
  required final String device,
  required final AlarmSource source,
  required final AlarmState state,
  required final AlarmSeverity severity,
  required final bool acknowledgeable,
  required final DateTime time,
  required final String epicsType,
  required final String user,
  required final DateTime wake,
});

/// Enumeration representing the Alarm Source
enum AlarmSource { unknown, analog, digital, epics }

/// Enumeration representing the alarm state
enum AlarmState {
  unknown,
  ok,
  alarmed,
  bypassed,
  latched,
  acknowledged,
  unbypassed,
}

/// Enumeration representing Alarm Severity
enum AlarmSeverity { unknown, low, high }

enum AnalogAlarmState { notAlarming, alarming, bypassed }

final class const AnalogAlarmStatus({
  required final int refId,
  required final int status,
  required final int cycle,
  required final DateTime timestamp,
  required final AnalogAlarmState state,
});

enum AcquisitionMode {
  oneShot,
  oneShotTriggeredOnEvent,
  repetitivePeriodic,
  repetitiveTriggeredOnEvent,
  sampleOnEvent,
}

extension on AcquisitionMode {
  // Serializes to the short string stored in the Dart-side database/JSON.
  String _stringize() => switch (this) {
    .oneShot => "os",
    .oneShotTriggeredOnEvent => "os_on_event",
    .repetitivePeriodic => "rep_periodic",
    .repetitiveTriggeredOnEvent => "rep_on_event",
    .sampleOnEvent => "smp_on_event",
  };
}

AcquisitionMode _amFromString(String? val) => switch (val) {
  "os_on_event" => .oneShotTriggeredOnEvent,
  "rep_periodic" => .repetitivePeriodic,
  "rep_on_event" => .repetitiveTriggeredOnEvent,
  "smp_on_event" => .sampleOnEvent,
  _ => .oneShot,
};

enum ReadingMode { array, scalar, arrayAsTimeSeries }

extension on ReadingMode {
  String _stringize() => switch (this) {
    .array => "array",
    .scalar => "scalar",
    .arrayAsTimeSeries => "array_as_time_series",
  };
}

ReadingMode _rmFromString(String? val) => switch (val) {
  "array_as_time_series" => .arrayAsTimeSeries,
  "scalar" => .scalar,
  _ => .array,
};

final class const Reading({
  required final int refId,
  required final DateTime timestamp,
  required final DeviceValue value,
});

int _genPlotId = 1000000;

/// Wrap an integer with the semantics of a plot configuration ID. An ID
/// is only an identifer and can't be manipulated as an integer. It only
/// supports comparisons.

extension type PlotConfigId._(int raw) implements Comparable {
  PlotConfigId.fromInt(this.raw);
  PlotConfigId.generate() : raw = _genPlotId++;
  int get value => raw;
  int compareTo(PlotConfigId other) => raw.compareTo(other.raw);
}

/// The samples of one plot channel, stored column-wise.
///
/// `t[i]` is the timestamp (seconds since the Unix epoch) of sample `i`. The
/// subclass determines what kind of value accompanies each timestamp. Storing
/// columns in typed lists means a channel costs a couple of allocations
/// rather than several objects per sample.
sealed class const PlotSeries(final Float64List _t) {
  Float64List get timestamps => _t;
  int get length => _t.length;
}

/// A channel whose samples are single floating point values; `y[i]` is the
/// value at `t[i]`. A NaN reading is stored as `double.nan`.
final class const ScalarSeries(super.t, final Float64List _data)
    extends PlotSeries {
  Float64List get data => _data;

  /// Access sample by index.
  ({double t, double y}) operator [](int i) => (t: _t[i], y: _data[i]);

  /// Lazily iterate over samples.
  Iterable<({double t, double y})> get samples =>
      Iterable.generate(length, (i) => this[i]);

  /// Iterate over samples. Usable in for loops.
  Iterator<({double t, double y})> get iterator => samples.iterator;
}

/// A channel whose samples are arrays (e.g. waveforms); `y[i]` is the array
/// acquired at `t[i]`.
final class const ArraySeries(super.t, final List<Float64List> _data)
    extends PlotSeries {
  List<Float64List> get data => _data;

  /// Access sample by index.
  ({double t, Float64List y}) operator [](int i) => (t: _t[i], y: _data[i]);

  /// Lazily iterate over samples.
  Iterable<({double t, Float64List y})> get samples =>
      Iterable.generate(length, (i) => this[i]);

  /// Iterate over samples. Usable in for loops.
  Iterator<({double t, Float64List y})> get iterator => samples.iterator;
}

final class const PlotChannelData({
  required final String name,
  required final String units,
  required final String rate,
  required final int status,
  required final PlotSeries series,
});

final class const PlotReply({
  required final String plotId,
  required final double requestTime,
  final double? triggerTimestamp,
  required final String xAxisUnits,
  final double? xAxisMin,
  final double? xAxisMax,
  final int? windowSize,
  required final List<PlotChannelData> data,
});

final class const PlotConfigurationListing({
  final PlotConfigId? configurationId,
  required final String configurationName,
}) {
  factory fromJson(Map<String, dynamic> json) {
    if (json case {"id": int id, "name": String name}) {
      return PlotConfigurationListing(
        configurationId: PlotConfigId.fromInt(id),
        configurationName: name,
      );
    } else {
      throw ACSysConfigurationException("plot listing had incorrect format");
    }
  }
}

final class const ChannelSettingSnapshot({
  final Color? lineColor,
  final int? markerIndex,
  final double? yMin,
  final double? yMax,
}) {
  factory fromJson(Map<String, dynamic> json) {
    final lineColorVal = json['lineColor'];
    final markerIndexVal = json['markerIndex'];
    final yMinVal = json['yMin'];
    final yMaxVal = json['yMax'];

    // This is intentionally robust. If fields are missing or have the wrong
    // type, they will be set to null. Extra fields are ignored.
    return ChannelSettingSnapshot(
      lineColor: lineColorVal is int ? Color(lineColorVal) : null,
      markerIndex: markerIndexVal is int ? markerIndexVal : null,
      yMin: yMinVal is num ? yMinVal.toDouble() : null,
      yMax: yMaxVal is num ? yMaxVal.toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "lineColor": lineColor?.value,
    "markerIndex": markerIndex,
    "yMin": yMin,
    "yMax": yMax,
  };
}

final class PlotConfigurationSnapshot({
  super.configurationId,
  required super.configurationName,
  required final Map<String, ChannelSettingSnapshot> channels,
  final double? xMin,
  final double? xMax,
  final double? timeDelta,
  final double? startTime,
  final double? endTime,
  required final bool isShowLabels,
  required final bool isScalar,
  required final bool isOneShot,
  required final bool isPersistent,
  required final bool isBlink,
  final int? updateDelay,
  final int? nAcquisitions,
  final int? tclkEvent,
  final int? sampleOnEvent,
  final AcquisitionMode? acquisitionMode,
  final ReadingMode? readingMode,
  final String? xAxis,
  required final int dataLimit,
  final double? waveformDuration,
}) extends PlotConfigurationListing {
  /// Returns a copy of this snapshot with [id] stamped in as the
  /// [configurationId]. All other fields are shared by reference (they are
  /// either immutable value types or collections that callers are expected not
  /// to mutate after saving).
  PlotConfigurationSnapshot withId(PlotConfigId id) =>
      PlotConfigurationSnapshot(
        configurationId: id,
        configurationName: configurationName,
        channels: channels,
        xMin: xMin,
        xMax: xMax,
        startTime: startTime,
        endTime: endTime,
        timeDelta: timeDelta,
        isShowLabels: isShowLabels,
        isScalar: isScalar,
        isOneShot: isOneShot,
        isPersistent: isPersistent,
        isBlink: isBlink,
        updateDelay: updateDelay,
        nAcquisitions: nAcquisitions,
        tclkEvent: tclkEvent,
        sampleOnEvent: sampleOnEvent,
        acquisitionMode: acquisitionMode,
        xAxis: xAxis,
        dataLimit: dataLimit,
        readingMode: readingMode,
        waveformDuration: waveformDuration,
      );

  factory fromJson(PlotConfigId id, String name, Map<String, dynamic> json) {
    // This is intentionally robust. If fields are missing or have the wrong
    // type, they will be set to null or a default value. Extra fields in the
    // JSON will be ignored.

    final channelsRaw = json['channels'];
    final channels = channelsRaw is Map
        ? Map<String, ChannelSettingSnapshot>.fromEntries(
            channelsRaw.entries
                .where(
                  (e) => e.key is String && e.value is Map<String, dynamic>,
                )
                .map(
                  (e) => MapEntry(
                    e.key as String,
                    ChannelSettingSnapshot.fromJson(
                      e.value as Map<String, dynamic>,
                    ),
                  ),
                ),
          )
        : <String, ChannelSettingSnapshot>{};

    // By reading the values from the map into local variables, we can leverage
    // Dart's type promotion for cleaner and safer type checking.
    final xMin = json['xMin'];
    final xMax = json['xMax'];
    final timeDelta = json['timeDelta'];
    final startTime = json['startTime'];
    final endTime = json['endTime'];
    final isShowLabels = json['isShowLabels'];
    final isScalar = json['isScalar'];
    final isOneShot = json['isOneShot'];
    final isPersistent = json['isPersistent'];
    final isBlink = json['isBlink'];
    final updateDelay = json['updateDelay'];
    final nAcquisitions = json['nAcquisitions'];
    final tclkEvent = json['tclkEvent'];
    final sampleOnEvent = json['sampleOnEvent'];
    final acquisitionMode = json['acquisitionMode'];
    final readingMode = json['readingMode'];
    final waveformDuration = json['waveformDuration'];
    final xAxis = json['xAxis'];
    final dataLimit = json['dataLimit'];

    return PlotConfigurationSnapshot(
      configurationId: id,
      configurationName: name,
      channels: channels,
      xMin: xMin is num ? xMin.toDouble() : null,
      xMax: xMax is num ? xMax.toDouble() : null,
      timeDelta: timeDelta is num ? timeDelta.toDouble() : null,
      startTime: startTime is num ? startTime.toDouble() : null,
      endTime: endTime is num ? endTime.toDouble() : null,
      isShowLabels: isShowLabels is bool ? isShowLabels : true,
      isScalar: isScalar is bool ? isScalar : true,
      isOneShot: isOneShot is bool ? isOneShot : false,
      isPersistent: isPersistent is bool ? isPersistent : false,
      isBlink: isBlink is bool ? isBlink : false,
      updateDelay: updateDelay is int ? updateDelay : null,
      nAcquisitions: nAcquisitions is int ? nAcquisitions : null,
      tclkEvent: tclkEvent is int ? tclkEvent : null,
      sampleOnEvent: sampleOnEvent is int ? sampleOnEvent : null,
      acquisitionMode: acquisitionMode is String
          ? _amFromString(acquisitionMode)
          : null,
      readingMode: readingMode is String ? _rmFromString(readingMode) : null,
      waveformDuration: waveformDuration is num
          ? waveformDuration.toDouble()
          : null,
      xAxis: xAxis is String ? xAxis : null,
      dataLimit: dataLimit is int ? dataLimit : 32768,
    );
  }

  Map<String, dynamic> toJson() => {
    "channels": channels.map((key, value) => MapEntry(key, value.toJson())),
    "xMin": xMin,
    "xMax": xMax,
    "timeDelta": timeDelta,
    "startTime": startTime,
    "endTime": endTime,
    "isShowLabels": isShowLabels,
    "isScalar": isScalar,
    "isOneShot": isOneShot,
    "isPersistent": isPersistent,
    "isBlink": isBlink,
    "updateDelay": updateDelay,
    "nAcquisitions": nAcquisitions,
    "tclkEvent": tclkEvent,
    "sampleOnEvent": sampleOnEvent,
    "xAxis": xAxis,
    "dataLimit": dataLimit,
    "acquisitionMode": acquisitionMode?._stringize(),
    "readingMode": readingMode?._stringize(),
    "waveformDuration": waveformDuration,
  };
}

abstract interface class ACSysServiceAPI {
  /// Takes a list of data acquisition strings and returns a stream that
  /// provides readings for the requests.

  Stream<Reading> monitorDevices(
    List<String> drfs, {
    DateTime? startTime,
    DateTime? endTime,
  });

  /// Takes a list of device names and returns their current reading.

  Future<List<Reading>> readDevices(List<String> devices);

  /// Returns a stream which provides plot data for the devices specified in
  /// the parameter list.
  Stream<PlotReply> startPlot(
    List<String> drfs, {
    double? xMin,
    double? xMax,
    double? startTime,
    double? endTime,
    int? windowSize,
    int? updateRate,
    int? nAcquisitions,
    int? triggerEvent,
    int? sampleOnEvent,
    String? chXAxis,
  });

  /// Takes a device name and a value and sends a request to apply the value to
  /// the device.
  Future<Status> setDevice({
    required String forDRF,
    required DeviceValue newSetting,
  });

  @Deprecated('Use setDevice() instead')
  Future<Status> submit({
    required String forDRF,
    required DeviceValue newSetting,
  });

  /// Takes a device name and a value and sends a request to apply the value to
  /// the device's digital control property.
  Future<Status> sendCommand({required String toDRF, required String value});

  /// Saves the plot configuration to the database.
  Future<PlotConfigurationSnapshot> savePlotConfiguration({
    required PlotConfigurationSnapshot snapshot,
  });

  /// Queries the database for a plot configuration.
  Future<PlotConfigurationSnapshot?> retrievePlotConfiguration({
    required PlotConfigId configurationId,
  });

  /// Returns every plot configuration in the database.
  Future<List<PlotConfigurationListing>> listPlotConfigurations();

  /// Removes a plot configuration from the database.
  Future<void> removePlotConfiguration({required PlotConfigId configurationId});

  /// Returns the last plot configuration that the user saved.
  Future<PlotConfigurationSnapshot?> retrieveLastUserConfiguration();

  /// Sets the provided plot configuration as the last one the user saved.
  Future<void> saveUserConfiguration({
    required PlotConfigurationSnapshot snapshot,
  });

  /// Gets a snapshot of the current alarms.
  Future<List<Alarm>> getAlarmsSnapshot();

  /// Takes no parameters and returns a stream that provides the current
  /// alarm info for all alarms.
  Stream<Alarm> monitorAlarms();

  /// Takes a list of data acquisition strings and returns a stream that
  /// provides a sample of the analog alarm property.
  Stream<AnalogAlarmStatus> monitorAnalogAlarmProperty(List<String> drfs);

  /// Releases resources held by this service.
  ///
  /// After calling [dispose] the service must not be used again.
  Future<void> dispose();
}
