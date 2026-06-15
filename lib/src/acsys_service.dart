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
  final GraphQLClient _client;

  static Map<String, String> _buildAuthHeader(String? jwt) =>
      jwt != null ? {"Authorization": "Bearer $jwt"} : {};

  // Constructor. This creates the HTTP and WebSocket links needed to
  // communicate with our GraphQL endpoints, then splits them so that
  // subscriptions go over WebSocket and everything else goes over HTTP.

  ACSysService({String? jwt})
    : _client = GraphQLClient(
        link: Link.split(
          (request) => request.isSubscription,
          WebSocketLink(
            "wss://ad-api.fnal.gov/acsys/s",
            config: SocketClientConfig(
              autoReconnect: true,
              headers: _buildAuthHeader(jwt),
              queryAndMutationTimeout: const Duration(seconds: 5),
              inactivityTimeout: null,
            ),
            subProtocol: "graphql-ws",
          ),
          HttpLink(
            "https://ad-api.fnal.gov/acsys",
            defaultHeaders: _buildAuthHeader(jwt),
            httpClient: http.Client(),
          ),
        ),
        queryRequestTimeout: const Duration(seconds: 5),
        cache: GraphQLCache(store: InMemoryStore()),
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
  Future<QueryResult> _doQuery({
    required String query,
    required Map<String, dynamic> withVariables,
    required FetchPolicy withPolicy,
  }) async {
    final QueryResult result = await _client.query(
      QueryOptions(
        document: gql(query),
        variables: withVariables,
        fetchPolicy: withPolicy,
      ),
    );

    return _checkResult(result, 'Query succeeded but returned no data');
  }

  // Executes a GraphQL subscription with per-event error handling and
  // validation. Each event emitted by the underlying WebSocket stream is
  // inspected for link-level and GraphQL-level errors before being forwarded.
  // Errors are logged and re-thrown as [ACSysGraphQLException] so that stream
  // consumers receive them via the stream's error channel rather than having
  // them silently swallowed.
  Stream<QueryResult> _doSubscription({
    required String query,
    required Map<String, dynamic> withVariables,
    required FetchPolicy withPolicy,
  }) => _client
      .subscribe(
        SubscriptionOptions(
          document: gql(query),
          variables: withVariables,
          fetchPolicy: withPolicy,
        ),
      )
      .where((event) => event.isNotLoading)
      .map(
        (result) => _checkResult(result, 'Subscription event returned no data'),
      );

  static List<Reading> _convertReading(QueryResult queryResult) =>
      (queryResult.data?['acceleratorData'] as List<Object?>)
          .cast<Map<String, dynamic>>()
          .expand((entry) {
            final refId = entry['refId'] as int;

            return (entry['data'] as List<Object?>)
                .cast<Map<String, dynamic>>()
                .map(
                  (row) => Reading(
                    refId: refId,
                    timestamp: fromFloatTs(row['timestamp'] as double),
                    value: devVal(row['result'] as Map<String, dynamic>),
                  ),
                );
          })
          .toList();

  @override
  Future<List<Reading>> readDevices(List<String> devices) async {
    const devicesRead = r"""
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
      }""";

    return _convertReading(
      await _doQuery(
        query: devicesRead,
        withVariables: {'devList': devices},
        withPolicy: .networkOnly,
      ),
    );
  }

  // Returns a stream of readings for the devices specified in the parameter
  // list. The `Reading` class has a `refId` field which indicates to which
  // device in the passed array the current reading belongs. If `value` is null,
  // the `status` field will hold the ACNET error status. No more readings will
  // be sent for a device in error.
  @override
  Stream<Reading> monitorDevices(List<String> drfs) {
    const subscription = r"""
      subscription StreamData($drfs: [String!]!) {
        acceleratorData(drfs: $drfs) {
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
      }""";

    return _doSubscription(
      query: subscription,
      withVariables: {'drfs': drfs},
      withPolicy: .networkOnly,
    ).expand(_convertMonitor);
  }

  static DateTime fromFloatTs(double ts) =>
      DateTime.fromMicrosecondsSinceEpoch((ts * 1000000.0).toInt());

  // Convert the incoming GraphQL messages into `Reading` objects.

  static Iterable<Reading> _convertMonitor(QueryResult queryResult) {
    final {"refId": int refId, "data": List<Object?> rawData} =
        queryResult.data!['acceleratorData'] as Map<String, dynamic>;

    return rawData.cast<Map<String, dynamic>>().map(
      (row) => switch (row) {
        {"timestamp": double stamp, "result": Map<String, dynamic> result} =>
          Reading(
            refId: refId,
            timestamp: fromFloatTs(stamp),
            value: devVal(result),
          ),
        _ => throw ACSysGraphQLException(
          'Unexpected acceleratorData row shape: $row',
        ),
      },
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
  }) {
    const deviceSet = r"""
      mutation SetDevice($device: String!, $value: DevValue!) {
        setDevice(device: $device, value: $value) {
          status
        }
      }""";

    return _doQuery(
      query: deviceSet,
      withVariables: {'device': forDRF, 'value': newSetting.toDevValIn()},
      withPolicy: .networkOnly,
    ).then(
      (QueryResult e) => Status.fromInt(e.data!['setDevice']!['status'] as int),
    );
  }

  @override
  Future<Status> sendCommand({required String toDRF, required String value}) =>
      submit(forDRF: toDRF, newSetting: value.toDevVal());

  @override
  Future<PlotConfigurationSnapshot> savePlotConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) async {
    const updatePlotConfig = r"""
      mutation UpdatePlotConfig($id: Int, $name: String!, $config: String!) {
        updatePlotConfiguration(id: $id, name: $name, config: $config)
      }""";

    final result = await _doQuery(
      query: updatePlotConfig,
      withVariables: {
        'id': snapshot.configurationId?.value,
        'name': snapshot.configurationName,
        'config': jsonEncode(snapshot.toJson()),
      },
      withPolicy: .networkOnly,
    );

    // The mutation returns the confirmed ID (Int!) — stamp it onto the snapshot
    // and return the same object. This handles the new-config case where the
    // caller didn't have an ID yet.
    snapshot.configurationId = PlotConfigId.fromInt(
      result.data!['updatePlotConfiguration'] as int,
    );

    return snapshot;
  }

  // Shared query for both retrievePlotConfiguration and listPlotConfigurations.
  // Passing null for $id returns all configurations; passing an Int returns the
  // matching one (0 or 1 element). The server stores the full configuration as
  // a JSON string in the `config` field, which we decode client-side.
  static const _plotConfigQuery = r"""
    query PlotConfigs($id: Int) {
      plotConfiguration(id: $id) {
        configId
        configName
        config
      }
    }""";

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
      query: _plotConfigQuery,
      withVariables: {'id': configurationId.value},
      withPolicy: .networkOnly,
    );

    final rows = (result.data!['plotConfiguration'] as List<Object?>)
        .cast<Map<String, dynamic>>();

    return rows.isEmpty ? null : _snapshotFromRow(rows.first);
  }

  @override
  Future<List<PlotConfigurationListing>> listPlotConfigurations() async {
    final result = await _doQuery(
      query: _plotConfigQuery,
      withVariables: {'id': null},
      withPolicy: .networkOnly,
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
  }) async {
    const deletePlotConfig = r"""
      mutation DeletePlotConfig($id: Int!) {
        deletePlotConfiguration(configurationId: $id) {
          status
        }
      }""";

    await _doQuery(
      query: deletePlotConfig,
      withVariables: {'id': configurationId.value},
      withPolicy: .networkOnly,
    );
  }

  @override
  Future<PlotConfigurationSnapshot?> retrieveLastUserConfiguration() async {
    const usersLastConfig = r"""
      query UsersLastConfig {
        usersLastConfiguration
      }""";

    final result = await _doQuery(
      query: usersLastConfig,
      withVariables: {},
      withPolicy: .networkOnly,
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
  }) async {
    const setUsersConfig = r"""
      mutation SetUsersConfig($cfg: String!) {
        usersConfiguration(config: $cfg) {
          status
        }
      }""";

    await _doQuery(
      query: setUsersConfig,
      withVariables: {'cfg': jsonEncode(snapshot.toJson())},
      withPolicy: .networkOnly,
    );
  }

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
  }) {
    const plotStart = r"""
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
      }""";

    return _doSubscription(
      query: plotStart,
      withVariables: {
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
      withPolicy: .networkOnly,
    ).map((result) => _toPlotReply(result.data!, drfs, xMin, xMax, windowSize));
  }

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
