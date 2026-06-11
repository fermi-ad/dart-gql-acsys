/// Defines the ACSys API.
///
/// This class is used by other classes to implement the ACSys API. The class
/// that supports the actual API is [ACSysService]. For testing, it is
/// recommended to define a class that implements this interface using well-
/// known data responses.
library;

import 'dart:developer' as dev;

import 'package:dart_gql_acsys/src/schema/mutations.dart';
import 'package:dart_gql_acsys/src/schema/queries.dart';
import 'package:dart_gql_acsys/src/schema/subscriptions.dart';

import 'package:pure_dart_ui/pure_dart_ui.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide WebSocketLink;
import 'package:flutter/material.dart';
import "package:gql_websocket_link/gql_websocket_link.dart";
import 'package:web_socket_channel/web_socket_channel.dart';

import 'device_values.dart';
import 'status.dart';

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

final class Reading {
  final int refId;
  final DateTime timestamp;
  final DeviceValue value;

  const Reading({
    required this.refId,
    required this.timestamp,
    required this.value,
  });
}

final class SettingStatus {
  final int facilityCode;
  final int errorCode;

  const SettingStatus({required this.facilityCode, required this.errorCode});
}

final class PlotPoint {
  final double t;
  final DeviceValue value;

  const PlotPoint({required this.t, required this.value});
}

final class PlotChannelData {
  final String name;
  final String units;
  final String rate;
  final int status;
  final List<PlotPoint> points;

  const PlotChannelData({
    required this.name,
    required this.units,
    required this.rate,
    this.status = 0,
    this.points = const [],
  });
}

final class PlotReply {
  final String plotId;
  final double requestTime;
  final double? triggerTimestamp;
  final String xAxisUnits;
  final double? xAxisMin;
  final double? xAxisMax;
  final int? windowSize;
  final List<PlotChannelData> data;

  const PlotReply({
    required this.plotId,
    required this.requestTime,
    this.triggerTimestamp,
    required this.xAxisUnits,
    this.xAxisMin,
    this.xAxisMax,
    this.windowSize,
    required this.data,
  });
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

// Only used by the plot ID class to generate IDs for testing.

int _genPlotId = 1000000;

/// Wrap an integer with the semantics of a plot configuration ID. An ID
/// is only an identifer and can't be manipulated as an integer. It only
/// supports comparisons.

extension type PlotConfigId._(int raw) implements Comparable {
  PlotConfigId._fromInt(this.raw);
  PlotConfigId.generate() : raw = _genPlotId++;
  int get _value => raw;
  int compareTo(PlotConfigId other) => raw.compareTo(other.raw);
}

abstract interface class ACSysServiceAPI {
  /// Takes a list of data acquisition strings and returns a stream that
  /// provides readings for the requests.

  Stream<Reading> monitorDevices(List<String> drfs);

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
  });

  /// Takes a device name and a value and sends a request to apply the value to
  /// the device.
  Future<SettingStatus> submit({
    required String forDRF,
    required DeviceValue newSetting,
  });

  /// Takes a device name and a value and sends a request to apply the value to
  /// the device's digital control property.
  Future<SettingStatus> sendCommand({
    required String toDRF,
    required String value,
  });
}

/// Provides an interface to Fermi's data acquisition API.
///
/// An instance of this class could be used in an application to acquire data
/// from the control system. But a better way is to use the [ACSysProvider]
/// widget which manages an object of this class.

final class ACSysService implements ACSysServiceAPI {
  final ValueNotifier<GraphQLClient> _cl;
  final ValueNotifier<GraphQLClient> _srv;

  static Map<String, String> _buildAuthHeader(String? jwt) =>
      jwt != null ? {"Authorization": "Bearer $jwt"} : {};

  // Constructor. This creates the HTTP links needed to communicate with our
  // GraphQL endpoints.

  ACSysService({String? jwt})
    : _cl = ValueNotifier<GraphQLClient>(
        GraphQLClient(
          link: HttpLink(
            "https://ad-api.fnal.gov/acsys",
            defaultHeaders: _buildAuthHeader(jwt),
          ),
          cache: GraphQLCache(store: InMemoryStore()),
        ),
      ),
      _srv = ValueNotifier<GraphQLClient>(
        GraphQLClient(
          link: WebSocketLink(
            null,
            channelGenerator: () => WebSocketChannel.connect(
              Uri(scheme: "wss", host: "ad-api.fnal.gov", path: "/acsys/s"),
              protocols: ["graphql-ws"],
            ),
            reconnectInterval: const Duration(seconds: 1),
          ),
          cache: GraphQLCache(store: InMemoryStore()),
        ),
      );

  // Common code needed to do RPCs. The caller sends in a protobuf request and,
  // optionally, a function to translate the protobuf reply into some other data
  // type.
  //ask Rich about this
  Map<String, dynamic> listConvert(List<String> inputList) {
    Map<String, dynamic> maps = {};
    for (final ent in inputList) {
      maps.putIfAbsent(ent, () => ent);
    }
    return maps;
  }

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

    final QueryResult result = await _cl.value.query(options);

    if (result.hasException) {
      if (result.exception?.linkException != null) {
        throw Exception(result.exception?.linkException);
      } else if (result.exception?.graphqlErrors != null) {
        throw Exception(result.exception?.graphqlErrors);
      } else {
        return Future.error(
          "The request to $result returned an exception.  Please refer to the developer console for more detail.",
        );
      }
    } else {
      return result;
    }
  }

  @override
  Future<List<Reading>> readDevices(List<String> devices) async => _doGraphQL(
    query: devicesRead,
    withVariables: listConvert(devices),
    withPolicy: FetchPolicy.networkOnly,
  ).then((result) => _convertReading(result));

  // Returns a stream of readings for the devices specified in the parameter
  // list. The `Reading` class has a `refId` field which indicates to which
  // device in the passed array the current reading belongs. If `value` is null,
  // the `status` field will hold the ACNET error status. No more readings will
  // be sent for a device in error.
  @override
  Stream<Reading> monitorDevices(List<String> drfs) {
    return _srv.value
        .subscribe(
          SubscriptionOptions(
            document: gql(devicesMonitor),
            variables: listConvert(drfs),
            fetchPolicy: FetchPolicy.networkOnly,
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
      "data": List<Map<String, dynamic>> data,
    }) {
      for (final {"timestamp": double stamp, "result": dynamic result}
          in data) {
        yield (Reading(
          refId: refId,
          timestamp: fromFloatTs(stamp),
          value: devVal(result),
        ));
      }
    }
  }

  static List<Reading> _convertReading(QueryResult queryResult) {
    List<Reading> readings = List.empty();
    List<Map<String, dynamic>> acceleratorData =
        queryResult.data?['acceleratorData'];

    for (final {"refId": int refId, "data": List<Map<String, dynamic>> data}
        in acceleratorData) {
      for (final {"timestamp": double stamp, "result": dynamic result}
          in data) {
        readings.add(
          Reading(
            refId: refId,
            timestamp: fromFloatTs(stamp),
            value: devVal(result),
          ),
        );
      }
    }

    return readings;
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
      withPolicy: FetchPolicy.networkOnly,
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
    return _srv.value
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
            fetchPolicy: FetchPolicy.networkOnly,
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

  PlotChannelData _toPlotChannelData(
    String name,
    Map<String, dynamic>? plotData,
  ) => PlotChannelData(
    name: name,
    units: plotData?['channelUnits'],
    rate: plotData?['channelRate'],
    status: plotData?['channelStatus'],
    points: [
      ...plotData?['channelData'].map(
        (e) => PlotPoint(t: e?['timestamp'], value: devVal(e['result'])),
      ),
    ],
  );

  // Converts the map value to a DeviceValue type

  static DeviceValue devVal(Map<String, dynamic> jsonMap) => switch (jsonMap) {
    {
      "StatusReply": int v,
      "Scalar": null,
      "ScalarArray": null,
      "Raw": null,
      "Text": null,
      "TextArray": null,
    } =>
      DevStatusCode(Status.fromInt(v)),
    {
      "StatusReply": null,
      "Scalar": double v,
      "ScalarArray": null,
      "Raw": null,
      "Text": null,
      "TextArray": null,
    } =>
      DevScalar(v),
    {
      "StatusReply": null,
      "Scalar": null,
      "ScalarArray": List<double> v,
      "Raw": null,
      "Text": null,
      "TextArray": null,
    } =>
      DevScalarArray(v),
    {
      "StatusReply": null,
      "Scalar": null,
      "ScalarArray": null,
      "Raw": List<int> v,
      "Text": null,
      "TextArray": null,
    } =>
      DevRaw((v)),
    {
      "StatusReply": null,
      "Scalar": null,
      "ScalarArray": null,
      "Raw": null,
      "Text": String v,
      "TextArray": null,
    } =>
      DevText(v),
    {
      "StatusReply": null,
      "Scalar": null,
      "ScalarArray": null,
      "Raw": null,
      "Text": null,
      "TextArray": List<String> v,
    } =>
      DevTextArray(v),
    _ => throw ACSysGraphQLException("DeviceValue type not found"),
  };
}

DeviceValue? xlat(Map<String, dynamic> json) => switch (json) {
  {"status": int v, "scalarValue": null, "scalarArray": null} => DevStatusCode(
    Status.fromInt(v),
  ),
  _ => null,
};
