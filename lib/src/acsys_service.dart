/// Defines the ACSys API.
///
/// This class is used by other classes to implement the ACSys API. The class
/// that supports the actual API is [ACSysService]. For testing, it is
/// recommended to define a class that implements this interface using well-
/// known data responses.
library;

import 'dart:convert';
import 'dart:typed_data';
import 'dart:developer' as dev;

import 'package:gql/ast.dart' show DocumentNode;
import 'package:http/http.dart' as http;
import 'package:graphql/client.dart';

import 'exceptions.dart';
import 'device_values.dart';
import 'acsys_api.dart';
import 'status.dart';

export 'acsys_api.dart';
export 'exceptions.dart';

/// Provides an interface to Fermi's data acquisition API.
///
/// An instance of this class could be used in an application to acquire data
/// from the control system. But a better way is to use the [ACSysProvider]
/// widget which manages an object of this class.

final class ACSysService implements ACSysServiceAPI {
  // Endpoint hosts for the two GraphQL backends this service talks to.
  static const String _acsysWsUrl = "wss://ad-api.fnal.gov/acsys/s";
  static const String _acsysHttpUrl = "https://ad-api.fnal.gov/acsys";
  static const String _alarmsWsUrl = "wss://ad-api-dev.fnal.gov/alarms/s";
  static const String _alarmsHttpUrl = "https://ad-api-dev.fnal.gov/alarms";

  final GraphQLClient _client;
  final GraphQLClient _alarmsClient;

  // Pre-parsed GraphQL documents. Parsing is done once at class initialisation
  // rather than on every method call, avoiding repeated AST allocation on hot
  // paths like monitorDevices and startPlot.

  static final _docReadDevices = gql(r"""
      query ReadDevices($devList: [String!]!) {
        acceleratorData(deviceList: $devList) {
          refId
          data {
            timestamp
            result {
              ... on StatusReply {
                status
              }
              ... on Scalar {
                scalarValue
              }
              ... on ScalarArray {
                scalarArrayValue
              }
              ... on Raw {
                rawValue
              }
              ... on Text {
                textValue
              }
              ... on TextArray {
                textArrayValue
              }
            }
          }
        }
      }""");

  static final _docMonitorDevices = gql(r"""
      subscription StreamData($drfs: [String!]!, $startTime: Float, $endTime: Float) {
        acceleratorData(drfs: $drfs, startTime: $startTime, endTime: $endTime) {
          refId
          data {
            timestamp
            result {
              ... on StatusReply {
                status
              }
              ... on Scalar {
                scalarValue
              }
              ... on ScalarArray {
                scalarArrayValue
              }
              ... on Raw {
                rawValue
              }
              ... on Text {
                textValue
              }
              ... on TextArray {
                textArrayValue
              }
            }
          }
        }
      }""");

  static final _docSetDevice = gql(r"""
      mutation SetDevice($device: String!, $value: DevValue!) {
        setDevice(device: $device, value: $value) {
          status
        }
      }""");

  static final _docUpdatePlotConfig = gql(r"""
      mutation UpdatePlotConfig($id: Int, $name: String!, $config: String!) {
        updatePlotConfiguration(id: $id, name: $name, config: $config)
      }""");

  static final _docPlotConfig = gql(r"""
      query PlotConfigs($id: Int) {
        plotConfiguration(id: $id) {
          configId
          configName
          config
        }
      }""");

  static final _docDeletePlotConfig = gql(r"""
      mutation DeletePlotConfig($id: Int!) {
        deletePlotConfiguration(configurationId: $id) {
          status
        }
      }""");

  static final _docUsersLastConfig = gql(r"""
      query UsersLastConfig {
        usersLastConfiguration
      }""");

  static final _docSetUsersConfig = gql(r"""
      mutation SetUsersConfig($cfg: String!) {
        usersConfiguration(config: $cfg) {
          status
        }
      }""");

  static final _docStartPlot = gql(r"""
      subscription StartPlot($drfList: [String!]!, $xMin: Float, $xMax: Float,
                             $windowSize: Int, $updateDelay: Int,
                             $nAcquisitions: Int, $triggerEvent: Int,
                             $startTime: Float, $endTime: Float,
                             $sampleOnEvent: Int, $chXAxis: String) {
        startPlot(drfList: $drfList, xMin: $xMin, xMax: $xMax,
                  windowSize: $windowSize, updateDelay: $updateDelay,
                  nAcquisitions: $nAcquisitions, triggerEvent: $triggerEvent,
                  startTime: $startTime, endTime: $endTime,
                  sampleOnEvent: $sampleOnEvent, chXAxis: $chXAxis) {
          plotId
          timestamp
          triggerTimestamp
          data {
            channelRate
            channelUnits
            channelStatus
            channelData {
              timestamp
              result {
                ... on Scalar {
                  scalarValue
                }
                ... on ScalarArray {
                  scalarArrayValue
                }
              }
            }
          }
        }
      }""");

  static final _docAlarmsSnapshot = gql(r"""
    query AlarmsSnapshot {
      alarmsSnapshot {
        device
        source
        state
        severity
        acknowledgeable
        time
        epicsType
        user
        wake
      }
    }""");

  static final _docMonitorAlarms = gql(r"""
    subscription StreamAlarms {
      alarms {
        device
        source
        state
        severity
        acknowledgeable
        time
        epicsType
        user
        wake
      }
    }""");

  static Map<String, String> _buildAuthHeader(String? jwt) =>
      jwt != null ? {"Authorization": "Bearer $jwt"} : {};

  // Builds a GraphQLClient for a single GraphQL backend, given its
  // WebSocket and HTTP URLs. Splits the link so that subscriptions go over
  // WebSocket and everything else (queries/mutations) goes over HTTP. Shared
  // by the constructor so both the acsys and alarms backends are configured
  // identically (auth handling, timeouts, etc.).
  static GraphQLClient _buildClient({
    required String wsUrl,
    required String httpUrl,
    required String? jwt,
  }) => GraphQLClient(
    link: Link.split(
      (request) => request.isSubscription,
      WebSocketLink(
        wsUrl,
        config: SocketClientConfig(
          autoReconnect: true,
          // Browser WebSockets cannot send custom headers; pass the JWT
          // via the graphql-ws connection_init payload instead so the
          // server can authenticate the subscription connection.
          initialPayload: jwt != null ? {"Authorization": "Bearer $jwt"} : null,
          queryAndMutationTimeout: const Duration(seconds: 5),
          inactivityTimeout: null,
        ),
        subProtocol: "graphql-ws",
      ),
      HttpLink(
        httpUrl,
        defaultHeaders: _buildAuthHeader(jwt),
        httpClient: http.Client(),
      ),
    ),
    queryRequestTimeout: const Duration(seconds: 5),
    cache: GraphQLCache(store: InMemoryStore()),
  );

  // Constructor. This creates the HTTP and WebSocket links needed to
  // communicate with our GraphQL endpoints, then splits them so that
  // subscriptions go over WebSocket and everything else goes over HTTP.
  //
  // Two separate clients are built: `_client` talks to the "acsys" backend
  // (device data, plot configuration, settings) and `_alarmsClient` talks to
  // the separate "alarms" backend.

  ACSysService({String? jwt})
    : _client = _buildClient(
        wsUrl: _acsysWsUrl,
        httpUrl: _acsysHttpUrl,
        jwt: jwt,
      ),
      _alarmsClient = _buildClient(
        wsUrl: _alarmsWsUrl,
        httpUrl: _alarmsHttpUrl,
        jwt: jwt,
      );

  // Validates a [QueryResult] for all common GraphQL error scenarios and
  // returns it unchanged if healthy. Throws [ACSysGraphQLException] on any
  // error. [nullDataMsg] is the message used when the result carries no data,
  // allowing callers to provide context-specific wording.
  static QueryResult _checkResult(QueryResult result, String nullDataMsg) {
    // Handle link-level errors (network, connection, timeout, etc.)
    if (result.exception?.linkException != null) {
      final linkEx = result.exception!.linkException!;
      final errorMsg =
          'Network error: ${linkEx.originalException ?? linkEx.toString()}';

      dev.log(
        errorMsg,
        name: 'ACSYS.GraphQL',
        error: linkEx,
        stackTrace: StackTrace.current,
      );

      throw ACSysGraphQLException(errorMsg);
    }

    // Handle GraphQL-level errors (query syntax, validation, resolver errors)
    if (result.exception?.graphqlErrors.isNotEmpty ?? false) {
      final errors = result.exception!.graphqlErrors;
      final errorMessages = errors
          .map(
            (e) => '${e.message}${e.path != null ? " at path: ${e.path}" : ""}',
          )
          .join('; ');
      final errorMsg = 'GraphQL errors: $errorMessages';

      dev.log(errorMsg, name: 'ACSYS.GraphQL', error: errors);

      throw ACSysGraphQLException(errorMsg);
    }

    // Handle unexpected exception state (shouldn't happen, but be defensive)
    if (result.hasException) {
      final errorMsg =
          'Unknown GraphQL exception: ${result.exception.toString()}';

      dev.log(errorMsg, name: 'ACSYS.GraphQL', error: result.exception);

      throw ACSysGraphQLException(errorMsg);
    }

    // Verify we actually got data back
    if (result.data == null) {
      dev.log(nullDataMsg, name: 'ACSYS.GraphQL');
      throw ACSysGraphQLException(nullDataMsg);
    }

    return result;
  }

  // Executes a GraphQL query with comprehensive error handling and validation.
  // [client] defaults to the "acsys" client; pass [_alarmsClient] to target
  // the alarms backend instead.
  Future<QueryResult> _doQuery({
    required DocumentNode document,
    Map<String, dynamic> variables = const {},
    required FetchPolicy fetchPolicy,
    GraphQLClient? client,
  }) async {
    final QueryResult result = await (client ?? _client).query(
      QueryOptions(
        document: document,
        variables: variables,
        fetchPolicy: fetchPolicy,
      ),
    );

    return _checkResult(result, 'Query succeeded but returned no data');
  }

  // Executes a GraphQL mutation with comprehensive error handling and
  // validation. Mutations must go through [GraphQLClient.mutate] so that the
  // underlying link receives a request whose [isSubscription] flag is false
  // *and* whose operation type is correctly identified as a mutation — which
  // ensures the Authorization header is forwarded by HttpLink. [client]
  // defaults to the "acsys" client; pass [_alarmsClient] to target the
  // alarms backend instead.
  Future<QueryResult> _doMutation({
    required DocumentNode document,
    Map<String, dynamic> variables = const {},
    GraphQLClient? client,
  }) async {
    final QueryResult result = await (client ?? _client).mutate(
      MutationOptions(
        document: document,
        variables: variables,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    return _checkResult(result, 'Mutation succeeded but returned no data');
  }

  // Executes a GraphQL subscription with per-event error handling and
  // validation. Each event emitted by the underlying WebSocket stream is
  // inspected for link-level and GraphQL-level errors before being forwarded.
  // Errors are logged and re-thrown as [ACSysGraphQLException] so that stream
  // consumers receive them via the stream's error channel rather than having
  // them silently swallowed. [client] defaults to the "acsys" client; pass
  // [_alarmsClient] to target the alarms backend instead.
  Stream<QueryResult> _doSubscription({
    required DocumentNode document,
    Map<String, dynamic> variables = const {},
    required FetchPolicy fetchPolicy,
    GraphQLClient? client,
  }) => (client ?? _client)
      .subscribe(
        SubscriptionOptions(
          document: document,
          variables: variables,
          fetchPolicy: fetchPolicy,
        ),
      )
      .where((event) => event.isNotLoading)
      .map(
        (result) => _checkResult(result, 'Subscription event returned no data'),
      );

  // Converts a single acceleratorData row map into a [Reading]. The [refId]
  // is passed in from the enclosing entry because it lives one level up in the
  // response structure.
  static Reading _rowToReading(Map<String, dynamic> row, int refId) =>
      switch (row) {
        {"timestamp": double stamp, "result": Map<String, dynamic> result} =>
          Reading(
            refId: refId,
            timestamp: fromFloatTs(stamp),
            value: devVal(result),
          ),
        _ => throw ACSysGraphQLException(
          'Unexpected acceleratorData row shape: $row',
        ),
      };

  static List<Reading> _convertReading(QueryResult queryResult) =>
      (queryResult.data?['acceleratorData'] as List<Object?>)
          .cast<Map<String, dynamic>>()
          .expand((entry) {
            final refId = entry['refId'] as int;

            return (entry['data'] as List<Object?>)
                .cast<Map<String, dynamic>>()
                .map((row) => _rowToReading(row, refId));
          })
          .toList();

  @override
  Future<List<Reading>> readDevices(List<String> devices) async =>
      _convertReading(
        await _doQuery(
          document: _docReadDevices,
          variables: {'devList': devices},
          fetchPolicy: .networkOnly,
        ),
      );

  static double? toFloatTs(DateTime? dt) => switch (dt) {
    null => null,
    final d => d.microsecondsSinceEpoch.toDouble() / 1000000.0,
  };

  // Returns a stream of readings for the devices specified in the parameter
  // list. The `Reading` class has a `refId` field which indicates to which
  // device in the passed array the current reading belongs. If `value` is null,
  // the `status` field will hold the ACNET error status. No more readings will
  // be sent for a device in error.
  @override
  Stream<Reading> monitorDevices(
    List<String> drfs, {
    DateTime? startTime,
    DateTime? endTime,
  }) => _doSubscription(
    document: _docMonitorDevices,
    variables: {
      'drfs': drfs,
      'startTime': toFloatTs(startTime),
      'endTime': toFloatTs(endTime),
    },
    fetchPolicy: .networkOnly,
  ).expand(_convertMonitor);

  static DateTime fromFloatTs(double ts) =>
      DateTime.fromMicrosecondsSinceEpoch((ts * 1000000.0).toInt());

  // Convert the incoming GraphQL subscription event into [Reading] objects.
  static Iterable<Reading> _convertMonitor(QueryResult queryResult) {
    final {"refId": int refId, "data": List<Object?> rawData} =
        queryResult.data!['acceleratorData'] as Map<String, dynamic>;

    return rawData.cast<Map<String, dynamic>>().map(
      (row) => _rowToReading(row, refId),
    );
  }

  // Performs a setting request. `forDRF` is the DRF string representing the
  // target device and property to receive the setting. `newSetting` is the
  // value of the setting. The future this function returns will resolve to the
  // status of the setting.

  @override
  Future<Status> submit({
    required String forDRF,
    required DeviceValue newSetting,
  }) =>
      _doMutation(
        document: _docSetDevice,
        variables: {'device': forDRF, 'value': newSetting.toDevValIn()},
      ).then(
        (QueryResult e) =>
            Status.fromInt(e.data!['setDevice']!['status'] as int),
      );

  @override
  Future<Status> sendCommand({required String toDRF, required String value}) =>
      submit(forDRF: toDRF, newSetting: value.toDevVal());

  @override
  Future<PlotConfigurationSnapshot> savePlotConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) async {
    final result = await _doMutation(
      document: _docUpdatePlotConfig,
      variables: {
        'id': snapshot.configurationId?.value,
        'name': snapshot.configurationName,
        'config': jsonEncode(snapshot.toJson()),
      },
    );

    // The mutation returns the confirmed ID (Int!) — return a copy of the
    // snapshot with the ID stamped in. This handles the new-config case where
    // the caller didn't have an ID yet, without mutating the caller's object.
    return snapshot.withId(
      PlotConfigId.fromInt(result.data!['updatePlotConfiguration'] as int),
    );
  }

  // Decodes a single PlotConfig row from the GraphQL response into a
  // PlotConfigurationSnapshot.
  static PlotConfigurationSnapshot _snapshotFromRow(Map<String, dynamic> row) {
    final id = PlotConfigId.fromInt(row['configId'] as int);
    final name = row['configName'] as String;
    final configJson =
        jsonDecode(row['config'] as String) as Map<String, dynamic>;

    return PlotConfigurationSnapshot.fromJson(id, name, configJson);
  }

  @override
  Future<PlotConfigurationSnapshot?> retrievePlotConfiguration({
    required PlotConfigId configurationId,
  }) async {
    final result = await _doQuery(
      document: _docPlotConfig,
      variables: {'id': configurationId.value},
      fetchPolicy: .networkOnly,
    );

    final rows = (result.data!['plotConfiguration'] as List<Object?>)
        .cast<Map<String, dynamic>>();

    return rows.isEmpty ? null : _snapshotFromRow(rows.first);
  }

  @override
  Future<List<PlotConfigurationListing>> listPlotConfigurations() async {
    final result = await _doQuery(
      document: _docPlotConfig,
      fetchPolicy: .networkOnly,
    );

    return (result.data!['plotConfiguration'] as List<Object?>)
        .cast<Map<String, dynamic>>()
        .map(
          (row) => PlotConfigurationListing(
            configurationId: PlotConfigId.fromInt(row['configId'] as int),
            configurationName: row['configName'] as String,
          ),
        )
        .toList();
  }

  @override
  Future<void> removePlotConfiguration({
    required PlotConfigId configurationId,
  }) => _doMutation(
    document: _docDeletePlotConfig,
    variables: {'id': configurationId.value},
  ).then((_) => ());

  @override
  Future<PlotConfigurationSnapshot?> retrieveLastUserConfiguration() async {
    final result = await _doQuery(
      document: _docUsersLastConfig,
      fetchPolicy: .networkOnly,
    );

    final raw = result.data!['usersLastConfiguration'];

    if (raw == null) return null;

    // The server returns the configuration as a raw JSON string. Decode it and
    // reconstruct the snapshot. There is no persisted ID for a user's last
    // config, so we generate a transient one; the name is left empty since the
    // server doesn't store one for this record.
    final configJson = jsonDecode(raw as String) as Map<String, dynamic>;

    return PlotConfigurationSnapshot.fromJson(
      PlotConfigId.generate(),
      '',
      configJson,
    );
  }

  @override
  Future<void> saveUserConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) => _doMutation(
    document: _docSetUsersConfig,
    variables: {'cfg': jsonEncode(snapshot.toJson())},
  ).then((_) => ());

  @override
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
  }) => _doSubscription(
    document: _docStartPlot,
    variables: {
      'drfList': drfs,
      'xMin': xMin,
      'xMax': xMax,
      'windowSize': windowSize,
      'nAcquisitions': nAcquisitions,
      'updateDelay': updateRate,
      'triggerEvent': triggerEvent,
      'startTime': startTime,
      'endTime': endTime,
      'sampleOnEvent': sampleOnEvent,
      'chXAxis': chXAxis,
    },
    fetchPolicy: .networkOnly,
  ).map((result) => _toPlotReply(result.data!, drfs, xMin, xMax, windowSize));

  static PlotReply _toPlotReply(
    Map<String, dynamic> eventData,
    List<String> drfs,
    double? xMin,
    double? xMax,
    int? windowSize,
  ) {
    // The GraphQL client wraps the response under the operation field name.
    final plotInfo = eventData['startPlot'] as Map<String, dynamic>;

    final rawChannels = (plotInfo['data'] as List<Object?>)
        .cast<Map<String, dynamic>>();

    final channels = rawChannels.indexed
        .map((entry) => _toPlotChannelData(entry.$2, drfs[entry.$1]))
        .toList();

    return PlotReply(
      plotId: plotInfo['plotId'] as String,
      requestTime: (plotInfo['timestamp'] as num).toDouble(),
      triggerTimestamp: (plotInfo['triggerTimestamp'] as num?)?.toDouble(),
      xAxisUnits: "Time",
      xAxisMin: xMin,
      xAxisMax: xMax,
      windowSize: windowSize,
      data: channels,
    );
  }

  static PlotChannelData _toPlotChannelData(
    Map<String, dynamic> ch,
    String deviceName,
  ) {
    final rawPoints = (ch['channelData'] as List<Object?>)
        .cast<Map<String, dynamic>>();

    final points = rawPoints.map((row) {
      final t = (row['timestamp'] as num).toDouble();
      final result = row['result'] as Map<String, dynamic>;

      return PlotPoint(t: t, value: devVal(result));
    }).toList();

    return PlotChannelData(
      name: deviceName,
      units: ch['channelUnits'] as String,
      rate: ch['channelRate'] as String,
      status: ch['channelStatus'] as int,
      points: points,
    );
  }

  // Parses a timestamp field from an alarms row.
  //
  // The alarms backend has been observed to send timestamps either as a
  // numeric epoch-seconds value (the same convention used by the acsys
  // backend, see [fromFloatTs]) or as an ISO-8601 string (e.g.
  // "2026-08-21T17:53:33+00:00"). Some alarm rows also omit these fields
  // entirely (e.g. `wake` for alarms that have never been acknowledged), in
  // which case the field is `null`; that case falls back to the Unix epoch
  // rather than crashing the client.
  static DateTime _parseAlarmTimestamp(Object? value) => switch (value) {
    null => DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
    final num n => fromFloatTs(n.toDouble()),
    final String s => DateTime.parse(s),
    _ => throw ACSysGraphQLException(
      'Unexpected timestamp format in alarm row: $value',
    ),
  };

  // Converts a single alarmsSnapshot row map into an [Alarm].
  //
  // The alarms backend sends `source`/`state`/`severity` as upper-case
  // strings (e.g. "ANALOG", "ALARMED", "LOW"), so the incoming value is
  // upper-cased before matching to be resilient to any casing the backend
  // might use.
  static Alarm _rowToAlarm(Map<String, dynamic> row) {
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
      time: _parseAlarmTimestamp(row['time']),
      epicsType: row['epicsType'] as String,
      user: row['user'] as String,
      wake: _parseAlarmTimestamp(row['wake']),
    );
  }

  @override
  Stream<Alarm> monitorAlarms() =>
      _doSubscription(
        document: _docMonitorAlarms,
        fetchPolicy: .networkOnly,
        client: _alarmsClient,
      ).map(
        // Each subscription event carries a single changed alarm (not a
        // list of all alarms), so the "alarms" field in the response is a
        // single row object.
        (result) => _rowToAlarm(result.data!['alarms'] as Map<String, dynamic>),
      );

  @override
  Future<List<Alarm>> getAlarmsSnapshot() async {
    final result = await _doQuery(
      document: _docAlarmsSnapshot,
      fetchPolicy: .networkOnly,
      client: _alarmsClient,
    );

    return (result.data!['alarmsSnapshot'] as List<Object?>)
        .cast<Map<String, dynamic>>()
        .map(_rowToAlarm)
        .toList();
  }

  @override
  Stream<AnalogAlarmStatus> monitorAnalogAlarmProperty(List<String> drfs) =>
      Stream.error(
        UnimplementedError('monitorAnalogAlarmProperty is not implemented yet'),
      );

  // Converts the map value to a DeviceValue type.
  //
  // The graphql client normalizes inline fragments into a flat map containing
  // only the fields that were actually selected, plus a "__typename" key. We
  // dispatch on "__typename" and then pull the single relevant field.

  static DeviceValue devVal(
    Map<String, dynamic> jsonMap,
  ) => switch (jsonMap['__typename'] as String?) {
    'StatusReply' => DevStatusCode(Status.fromInt(jsonMap['status'] as int)),
    'Scalar' => DevScalar((jsonMap['scalarValue'] as num).toDouble()),
    'ScalarArray' => DevScalarArray(
      Float64List.fromList(
        (jsonMap['scalarArrayValue'] as List<Object?>)
            .cast<num>()
            .map((n) => n.toDouble())
            .toList(),
      ),
    ),
    'Raw' => DevRaw(
      Uint8List.fromList((jsonMap['rawValue'] as List<Object?>).cast<int>()),
    ),
    'Text' => DevText(jsonMap['textValue'] as String),
    'TextArray' => DevTextArray(
      (jsonMap['textArrayValue'] as List<Object?>).cast<String>(),
    ),
    _ => throw ACSysGraphQLException(
      "DeviceValue type not found: __typename=${jsonMap['__typename']}",
    ),
  };

  /// Releases resources held by this service.
  ///
  /// After calling [dispose] the service must not be used again.
  @override
  Future<void> dispose() async {
    _client.link.dispose();
    _alarmsClient.link.dispose();
  }
}

extension on DeviceValue {
  Map<String, dynamic> toDevValIn() => switch (this) {
    DevScalar(value: var s) => {'scalarVal': s},
    DevScalarArray(value: var arr) => {'scalarArrayVal': arr},
    DevRaw(value: var raw) => {'rawVal': raw},
    DevText(value: var t) => {'textVal': t},
    DevTextArray(value: var arr) => {'textArrayVal': arr},
    DevTimeSeries(value: var ts) => {
      'timeSeriesVal': ts.map((e) => {'stamp': e.$1, 'value': e.$2}).toList(),
    },
    DevStatusCode() => throw ACSysGraphQLException(
      'Status codes cannot be used as input values',
    ),
  };
}
