/// Defines the ACSys API.
///
/// This class is used by other classes to implement the ACSys API. The class
/// that supports the actual API is [ACSysService]. For testing, it is
/// recommended to define a class that implements this interface using well-
/// known data responses.
library;

import 'dart:developer' as dev;

import 'package:http/http.dart' as http;
import 'package:graphql/client.dart';
import 'package:pure_dart_ui/pure_dart_ui.dart';

import 'package:dart_gql_acsys/src/schema/mutations.dart';
import 'package:dart_gql_acsys/src/schema/subscriptions.dart';

import 'device_values.dart';
import 'acsys_api.dart';
import 'status.dart';

export 'acsys_api.dart';

// Declare an exception type that's specific to the ACSys API.

abstract class ACSysException implements Exception {
  final String message;

  const ACSysException(this.message);

  @override
  String toString() => message;
}

class ACSysInvArgException extends ACSysException {
  const ACSysInvArgException(String message) : super("InvArg: $message");
}

class ACSysTypeException extends ACSysException {
  const ACSysTypeException(String message) : super("Type: $message");
}

class ACSysConfigurationException extends ACSysException {
  const ACSysConfigurationException(String message) : super("Config: $message");
}

class ACSysGraphQLException extends ACSysException {
  const ACSysGraphQLException(String message) : super("GraphQL: $message");
}

class ACSysStatusException extends ACSysException {
  final Status status;

  ACSysStatusException(String message, {required this.status})
    : super("ACNET status: [${status.facility} ${status.error}]");
}

final class ChannelSettingSnapshot {
  final Color? lineColor;
  final int? markerIndex;
  final double? yMin;
  final double? yMax;

  const ChannelSettingSnapshot({
    this.lineColor,
    this.markerIndex,
    this.yMin,
    this.yMax,
  });
}

/// Provides an interface to Fermi's data acquisition API.
///
/// An instance of this class could be used in an application to acquire data
/// from the control system. But a better way is to use the [ACSysProvider]
/// widget which manages an object of this class.

final class ACSysService implements ACSysServiceAPI {
  final GraphQLClient _q;
  final GraphQLClient _s;

  static Map<String, String> _buildAuthHeader(String? jwt) =>
      jwt != null ? {"Authorization": "Bearer $jwt"} : {};

  // Constructor. This creates the HTTP links needed to communicate with our
  // GraphQL endpoints.

  ACSysService({String? jwt})
    : _q = GraphQLClient(
        link: HttpLink(
          "https://ad-api.fnal.gov/acsys",
          defaultHeaders: _buildAuthHeader(jwt),
          httpClient: http.Client(),
        ),
        queryRequestTimeout: const Duration(seconds: 5),
        cache: GraphQLCache(store: InMemoryStore()),
      ),
      _s = GraphQLClient(
        link: WebSocketLink(
          "wss://ad-api.fnal.gov/acsys/s",
          config: SocketClientConfig(
            autoReconnect: true,
            headers: _buildAuthHeader(jwt),
            queryAndMutationTimeout: const Duration(seconds: 5),
            inactivityTimeout: const Duration(seconds: 30),
          ),
          subProtocol: "graphql-ws",
        ),
        cache: GraphQLCache(store: InMemoryStore()),
      );

  // Executes a GraphQL query with comprehensive error handling and validation.
  //
  // This method handles all common GraphQL error scenarios including:
  // - Network/connection errors (link exceptions)
  // - GraphQL query errors (syntax, validation, resolver errors)
  // - Null data responses
  // - Unknown exception states
  //
  // All errors are logged and thrown as [ACSysGraphQLException] with
  // meaningful error messages for easier debugging.
  Future<QueryResult> _doGraphQL({
    required String query,
    required Map<String, dynamic> withVariables,
    required FetchPolicy withPolicy,
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: withVariables,
      fetchPolicy: withPolicy,
    );

    final QueryResult result = await _q.query(options);

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

    // Verify we actually got data back (successful query should have data)
    if (result.data == null) {
      const errorMsg = 'Query succeeded but returned no data';

      dev.log(errorMsg, name: 'ACSYS.GraphQL');
      throw ACSysGraphQLException(errorMsg);
    }

    // All checks passed - return the successful result
    return result;
  }

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
      await _doGraphQL(
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
    return _s
        .subscribe(
          SubscriptionOptions(
            document: gql(devicesMonitor),
            variables: {'drfList': drfs},
            fetchPolicy: .networkOnly,
          ),
        )
        .handleError(
          (err) => dev.log("error: $err", name: "gql.monitorDevices"),
        )
        .where((event) => event.isNotLoading)
        .expand((element) => _convertMonitor(element));
  }

  static DateTime fromFloatTs(double ts) =>
      DateTime.fromMicrosecondsSinceEpoch((ts * 1000000.0).toInt());

  // Convert the incoming GraphQL messages into `Reading` objects.

  static Iterable<Reading> _convertMonitor(QueryResult queryResult) sync* {
    // If the packet doesn't have GraphQL errors, then we can process the
    // payload.
    if (queryResult.data?['acceleratorData'] case {
      "refId": int refId,
      "data": List<Object?> rawData,
    }) {
      final data = rawData.cast<Map<String, dynamic>>();

      for (final {"timestamp": double stamp, "result": dynamic result}
          in data) {
        yield (Reading(
          refId: refId,
          timestamp: fromFloatTs(stamp),
          value: devVal(result as Map<String, dynamic>),
        ));
      }
    }
  }

  // Performs a setting request. `forDRF` is the DRF string representing the
  // target device and property to receive the setting. `newSetting` is the
  // value of the setting. The future this function returns will resolve to the
  // status of the setting.

  @override
  Future<SettingStatus> submit({
    required String forDRF,
    required DeviceValue newSetting,
  }) {
    // Define a nested function which converts the GraphQL reply into a
    // SettingStatus.

    xlat(QueryResult e) => SettingStatus(
      facilityCode: e.data?['status'] ~/ 256,
      errorCode: e.data?['status'] & 255,
    );

    return _doGraphQL(
      query: deviceSet,
      withVariables: {'device': forDRF, 'value': newSetting},
      withPolicy: .networkOnly,
    ).then((res) => xlat(res));
  }

  @override
  Future<SettingStatus> sendCommand({
    required String toDRF,
    required String value,
  }) => submit(forDRF: toDRF, newSetting: DevText(value));

  //NEEDS ADJUSTMENT
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
  }) {
    return _s
        .subscribe(
          SubscriptionOptions(
            document: gql(plotStart),
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
            },
            fetchPolicy: .networkOnly,
          ),
        )
        .handleError((err) => dev.log("error: $err", name: "gql.startPlot"))
        .where((event) => event.isNotLoading)
        .map(
          (startPlot) =>
              _toPlotReply(startPlot.data!, drfs, xMin, xMax, windowSize),
        );
  }

  PlotReply _toPlotReply(
    Map<String, dynamic>? plotInfo,
    List<String> drfs,
    double? xMin,
    double? xMax,
    int? windowSize,
  ) => PlotReply(
    plotId: plotInfo?['plotId'],
    requestTime: plotInfo?['timestamp'],
    triggerTimestamp: plotInfo?['triggerTimestamp'],
    xAxisUnits: "Time",
    xAxisMin: xMin,
    xAxisMax: xMax,
    windowSize: windowSize, //name within map
    data: plotInfo?['data'].indexed
        .map(
          (indx) => indx.$2._toPlotChannelData(drfs[indx.$1], plotInfo['data']),
        )
        .toList(),
  );

  // Converts the map value to a DeviceValue type.
  //
  // The graphql client normalizes inline fragments into a flat map containing
  // only the fields that were actually selected, plus a "__typename" key. We
  // dispatch on "__typename" and then pull the single relevant field.

  static DeviceValue devVal(Map<String, dynamic> jsonMap) =>
      switch (jsonMap['__typename'] as String?) {
        'StatusReply' => DevStatusCode(
          Status.fromInt(jsonMap['status'] as int),
        ),
        'Scalar' => DevScalar((jsonMap['scalarValue'] as num).toDouble()),
        'ScalarArray' => DevScalarArray(
          (jsonMap['scalarArrayValue'] as List<Object?>)
              .cast<num>()
              .map((n) => n.toDouble())
              .toList(),
        ),
        'Raw' => DevRaw((jsonMap['rawValue'] as List<Object?>).cast<int>()),
        'Text' => DevText(jsonMap['textValue'] as String),
        'TextArray' => DevTextArray(
          (jsonMap['textArrayValue'] as List<Object?>).cast<String>(),
        ),
        _ => throw ACSysGraphQLException(
          "DeviceValue type not found: __typename=${jsonMap['__typename']}",
        ),
      };
}

DeviceValue? xlat(Map<String, dynamic> json) => switch (json) {
  {"status": int v, "scalarValue": null, "scalarArray": null} => DevStatusCode(
    Status.fromInt(v),
  ),
  _ => null,
};
