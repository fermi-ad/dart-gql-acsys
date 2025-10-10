/// Defines the ACSys API.
///
/// This class is used by other classes to implement the ACSys API. The class
/// that supports the actual API is [ACSysService]. For testing, it is
/// recommended to define a class that implements this interface using well-
/// known data responses.
library;

import 'dart:developer' as dev;

import 'package:built_collection/built_collection.dart';
import 'package:pure_dart_ui/pure_dart_ui.dart';

import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import "package:gql_websocket_link/gql_websocket_link.dart";
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:dart_gql_acsys/src/schema/__generated__/DPM.schema.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/set_device.req.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/stream_data.data.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/stream_data.req.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/stream_data.var.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/start_plot.data.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/start_plot.req.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/plot_configs.data.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/plot_configs.req.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/read_devices.data.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/read_devices.req.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/remove_plot_config.data.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/remove_plot_config.req.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/update_plot_config.data.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/update_plot_config.req.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/users_last_config.data.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/users_last_config.req.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/set_users_config.data.gql.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/set_users_config.req.gql.dart';

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

final class Reading {
  final int refId;
  final Status status;
  final DateTime timestamp;
  final DeviceValue? value;

  const Reading({
    required this.refId,
    this.status = Status.okay,
    required this.timestamp,
    this.value,
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

class PlotConfigurationListing {
  PlotConfigId? configurationId;
  String configurationName;

  PlotConfigurationListing({
    this.configurationId,
    required this.configurationName,
  });
}

final class PlotConfigurationSnapshot extends PlotConfigurationListing {
  Map<String, ChannelSettingSnapshot> channels;
  double? xMin;
  double? xMax;
  double? timeDelta;
  double? startTime;
  double? endTime;
  bool isShowLabels;
  bool isScalar;
  bool isOneShot;
  bool isPersistent;
  int? updateDelay;
  int? nAcquisitions;
  int? tclkEvent;
  int dataLimit;

  PlotConfigurationSnapshot({
    super.configurationId,
    required super.configurationName,
    required this.channels,
    this.xMin,
    this.xMax,
    this.startTime,
    this.endTime,
    this.timeDelta,
    required this.isShowLabels,
    required this.isScalar,
    required this.isOneShot,
    this.isPersistent = false,
    this.updateDelay,
    this.nAcquisitions,
    this.tclkEvent,
    required this.dataLimit,
  });
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
  final Client _q;
  final Client _s;

  static Map<String, String> _buildAuthHeader(String? jwt) =>
      jwt != null ? {"Authorization": "Bearer $jwt"} : {};

  // Constructor. This creates the HTTP links needed to communicate with our
  // GraphQL endpoints.

  ACSysService({String? jwt, int? port})
    : _q = Client(
        link: HttpLink(
          "https://acsys-proxy.fnal.gov:${port ?? 8000}/acsys",
          defaultHeaders: _buildAuthHeader(jwt),
        ),
        cache: Cache(),
      ),
      _s = Client(
        link: WebSocketLink(
          null,
          channelGenerator:
              () => WebSocketChannel.connect(
                Uri(
                  scheme: "wss",
                  host: "acsys-proxy.fnal.gov",
                  port: port ?? 8000,
                  path: "/acsys/s",
                ),
                protocols: ["graphql-ws"],
              ),
          reconnectInterval: const Duration(seconds: 1),
        ),
        cache: Cache(),
      );

  // Common code needed to do RPCs. The caller sends in a protobuf request and,
  // optionally, a function to translate the protobuf reply into some other data
  // type.

  Future<Result> _rpc<TData, TVars, Result>(
    OperationRequest<TData, TVars> req, {
    Result Function(TData)? xlat,
  }) =>
      _q.request(req).firstWhere((response) => !response.loading).then((value) {
        if (value.hasErrors) {
          if (value.linkException != null) {
            throw value.linkException!;
          } else if (value.graphqlErrors != null) {
            throw Exception(value.graphqlErrors);
          } else {
            throw Exception("unknown error");
          }
        } else {
          final data = value.data;

          if (data != null) {
            return xlat != null ? xlat(data) : data as Result;
          } else {
            throw Exception("no data was returned from request");
          }
        }
      });

  @override
  Future<List<Reading>> readDevices(List<String> devices) {
    final req = GReadDevicesReq(
      (b) =>
          b
            ..vars.devList = ListBuilder(devices)
            ..fetchPolicy = FetchPolicy.NetworkOnly,
    );

    return _rpc(req, xlat: _convertReading);
  }

  // Returns a stream of readings for the devices specified in the parameter
  // list. The `Reading` class has a `refId` field which indicates to which
  // device in the passed array the current reading belongs. If `value` is null,
  // the `status` field will hold the ACNET error status. No more readings will
  // be sent for a device in error.
  @override
  Stream<Reading> monitorDevices(List<String> drfs) {
    final req = GStreamDataReq(
      (b) =>
          b
            ..vars.drfs = ListBuilder(drfs)
            ..fetchPolicy = FetchPolicy.NetworkOnly,
    );

    return _s
        .request(req)
        .handleError(
          (error) => dev.log("error: $error", name: "gql.monitorDevices"),
        )
        .where((event) => !event.loading)
        .expand(_convertMonitor);
  }

  static DateTime fromFloatTs(double ts) =>
      DateTime.fromMicrosecondsSinceEpoch((ts * 1000000.0) as int);

  // Convert the incoming GraphQL messages into `Reading` objects.

  static Iterable<Reading> _convertMonitor(
    OperationResponse<GStreamDataData, GStreamDataVars> e,
  ) sync* {
    // If the packet doesn't have GraphQL errors, then we can process the
    // payload.

    if (!e.hasErrors) {
      final GStreamDataData_acceleratorData data = e.data!.acceleratorData;

      for (final entry in data.data) {
        yield Reading(
          refId: data.refId,
          timestamp: fromFloatTs(entry.timestamp),
          value: entry.result.toDevValue(),
        );
      }
    } else {
      throw ACSysGraphQLException(e.graphqlErrors.toString());
    }
  }

  static List<Reading> _convertReading(GReadDevicesData e) =>
      e.acceleratorData.expand((v) sync* {
        for (final data in v.data) {
          yield Reading(
            refId: v.refId,
            timestamp: fromFloatTs(data.timestamp),
            value: data.result.toDevValue(),
          );
        }
      }).toList();

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

    xlat(e) => SettingStatus(
      facilityCode: e.setDevice.status ~/ 256,
      errorCode: e.setDevice.status & 255,
    );

    // Build the request.

    final req = GSetDeviceReq(
      (b) =>
          b
            ..vars.device = forDRF
            ..vars.value = newSetting._toGDevValue(),
    );

    return _rpc(req, xlat: xlat);
  }

  @override
  Future<SettingStatus> sendCommand({
    required String toDRF,
    required String value,
  }) => submit(forDRF: toDRF, newSetting: DevText(value));
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
    final req = GStartPlotReq(
      (b) =>
          b
            ..fetchPolicy = FetchPolicy.NetworkOnly
            ..vars.drfList = ListBuilder(drfs)
            ..vars.xMin = xMin
            ..vars.xMax = xMax
            ..vars.windowSize = windowSize
            ..vars.nAcquisitions = nAcquisitions
            ..vars.updateDelay = updateRate
            ..vars.triggerEvent = triggerEvent
            ..vars.startTime = startTime
            ..vars.endTime = endTime,
    );

    return _s
        .request(req)
        .handleError((error) => dev.log("error: $error", name: "gql.startPlot"))
        .where((event) => !event.loading)
        .map((e) => e.data!.startPlot.toPlotReply(req));
  }

  @override
  Future<List<PlotConfigurationListing>> listPlotConfigurations() {
    final req = GPlotConfigsReq(
      (b) => b..fetchPolicy = FetchPolicy.NetworkOnly,
    );

    return _rpc(
      req,
      xlat:
          (GPlotConfigsData data) =>
              data.plotConfiguration
                  .map(
                    (e) => PlotConfigurationListing(
                      configurationId:
                          e.configurationId != null
                              ? PlotConfigId._fromInt(e.configurationId!)
                              : null,
                      configurationName: e.configurationName,
                    ),
                  )
                  .toList(),
    );
  }

  @override
  Future<void> removePlotConfiguration({
    required PlotConfigId configurationId,
  }) {
    final req = GDeletePlotConfigReq(
      (b) => b..vars.id = configurationId._value,
    );

    return _rpc(req, xlat: (GDeletePlotConfigData data) => ());
  }

  @override
  Future<PlotConfigurationSnapshot?> retrieveLastUserConfiguration() {
    final req = GUsersLastConfigReq();

    return _rpc(
      req,
      xlat: (GUsersLastConfigData data) {
        final e = data.usersLastConfiguration;

        return e == null
            ? null
            : PlotConfigurationSnapshot(
              configurationId:
                  e.configurationId != null
                      ? PlotConfigId._fromInt(e.configurationId!)
                      : null,
              configurationName: e.configurationName,
              channels: Map.fromEntries(
                e.channels.map(
                  (e) => MapEntry(
                    e.device,
                    ChannelSettingSnapshot(
                      lineColor:
                          e.lineColor != null ? Color(e.lineColor!) : null,
                      markerIndex: e.markerIndex,
                      yMin: e.yMin,
                      yMax: e.yMax,
                    ),
                  ),
                ),
              ),
              xMin: e.xMin,
              xMax: e.xMax,
              startTime: e.startTime,
              endTime: e.endTime,
              timeDelta: e.timeDelta,
              isOneShot: e.isOneShot,
              isScalar: e.isScalar,
              isShowLabels: e.isShowLabels,
              updateDelay: e.updateDelay,
              nAcquisitions: e.nAcquisitions,
              tclkEvent: e.tclkEvent,
              dataLimit: e.dataLimit,
              isPersistent: e.isPersistent,
            );
      },
    );
  }

  @override
  Future<void> saveUserConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) {
    final req = GSetUsersConfigReq(
      (b) => b..vars.cfg = _plotConfigurationSnapshotIn(snapshot),
    );

    return _rpc(req, xlat: (GSetUsersConfigData data) => ());
  }

  @override
  Future<PlotConfigurationSnapshot?> retrievePlotConfiguration({
    required PlotConfigId configurationId,
  }) {
    final req = GPlotConfigsReq((b) => b..vars.id = configurationId._value);

    return _rpc(
      req,
      xlat:
          (GPlotConfigsData data) =>
              data.plotConfiguration
                  .map(
                    (e) => PlotConfigurationSnapshot(
                      configurationId:
                          e.configurationId != null
                              ? PlotConfigId._fromInt(e.configurationId!)
                              : null,
                      configurationName: e.configurationName,
                      channels: Map.fromEntries(
                        e.channels.map(
                          (e) => MapEntry(
                            e.device,
                            ChannelSettingSnapshot(
                              lineColor:
                                  e.lineColor != null
                                      ? Color(e.lineColor!)
                                      : null,
                              markerIndex: e.markerIndex,
                              yMin: e.yMin,
                              yMax: e.yMax,
                            ),
                          ),
                        ),
                      ),
                      xMin: e.xMin,
                      xMax: e.xMax,
                      startTime: e.startTime,
                      endTime: e.endTime,
                      timeDelta: e.timeDelta,
                      isOneShot: e.isOneShot,
                      isScalar: e.isScalar,
                      isShowLabels: e.isShowLabels,
                      updateDelay: e.updateDelay,
                      nAcquisitions: e.nAcquisitions,
                      tclkEvent: e.tclkEvent,
                      dataLimit: e.dataLimit,
                      isPersistent: e.isPersistent,
                    ),
                  )
                  .toList(),
    ).then((value) {
      switch (value) {
        case []:
          return null;
        case [PlotConfigurationSnapshot e]:
          return e;
        default:
          throw const ACSysConfigurationException(
            "multiple configurations found",
          );
      }
    });
  }

  GPlotConfigurationSnapshotInBuilder _plotConfigurationSnapshotIn(
    PlotConfigurationSnapshot cfg,
  ) =>
      GPlotConfigurationSnapshotInBuilder()
        ..configurationId = cfg.configurationId?._value
        ..configurationName = cfg.configurationName
        ..channels = ListBuilder(
          cfg.channels.entries.map(
            (e) => GChannelSettingSnapshotIn(
              (b) =>
                  b
                    ..device = e.key
                    ..lineColor = e.value.lineColor?.value
                    ..markerIndex = e.value.markerIndex
                    ..yMin = e.value.yMin
                    ..yMax = e.value.yMax,
            ),
          ),
        )
        ..xMin = cfg.xMin
        ..xMax = cfg.xMax
        ..startTime = cfg.startTime
        ..endTime = cfg.endTime
        ..timeDelta = cfg.timeDelta
        ..isOneShot = cfg.isOneShot
        ..isScalar = cfg.isScalar
        ..isShowLabels = cfg.isShowLabels
        ..isPersistent = cfg.isPersistent
        ..dataLimit = cfg.dataLimit
        ..updateDelay = cfg.updateDelay
        ..nAcquisitions = cfg.nAcquisitions
        ..tclkEvent = cfg.tclkEvent;

  @override
  Future<PlotConfigurationSnapshot> savePlotConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) {
    final req = GUpdatePlotConfigReq(
      (b) => b..vars.cfg = _plotConfigurationSnapshotIn(snapshot),
    );

    return _rpc(
      req,
      xlat: (GUpdatePlotConfigData data) => data.updatePlotConfiguration,
    ).then(
      (id) =>
          snapshot
            ..configurationId = id == null ? null : PlotConfigId._fromInt(id),
    );
  }
}

extension on GStartPlotData_startPlot_data_channelData_result {
  DeviceValue toDevValue() => switch (this) {
    GStartPlotData_startPlot_data_channelData_result__asScalar val => DevScalar(
      val.scalarValue,
    ),
    GStartPlotData_startPlot_data_channelData_result__asScalarArray val =>
      DevScalarArray(val.scalarArrayValue.toList()),
    _ => throw ACSysTypeException("unexpected data type, $runtimeType"),
  };
}

extension on GStreamDataData_acceleratorData_data_result {
  DeviceValue toDevValue() => switch (this) {
    GStreamDataData_acceleratorData_data_result__asScalar val => DevScalar(
      val.scalarValue,
    ),
    GStreamDataData_acceleratorData_data_result__asScalarArray val =>
      DevScalarArray(val.scalarArrayValue.toList()),
    GStreamDataData_acceleratorData_data_result__asText val => DevText(
      val.textValue,
    ),
    GStreamDataData_acceleratorData_data_result__asTextArray val =>
      DevTextArray(val.textArrayValue.toList()),
    _ => throw ACSysTypeException("unexpected data type, $runtimeType"),
  };
}

extension on GReadDevicesData_acceleratorData_data_result {
  DeviceValue toDevValue() => switch (this) {
    GReadDevicesData_acceleratorData_data_result__asScalar val => DevScalar(
      val.scalarValue,
    ),
    GReadDevicesData_acceleratorData_data_result__asScalarArray val =>
      DevScalarArray(val.scalarArrayValue.toList()),
    GReadDevicesData_acceleratorData_data_result__asText val => DevText(
      val.textValue,
    ),
    GReadDevicesData_acceleratorData_data_result__asTextArray val =>
      DevTextArray(val.textArrayValue.toList()),
    _ => throw ACSysTypeException("unexpected data type, $runtimeType"),
  };
}

extension on GStartPlotData_startPlot_data {
  PlotChannelData toPlotChannelData(int idx, GStartPlotReq req) =>
      PlotChannelData(
        name: req.vars.drfList[idx],
        units: channelUnits,
        rate: channelRate,
        status: channelStatus,
        points: [
          ...channelData.map(
            (e) => PlotPoint(t: e.timestamp, value: e.result.toDevValue()),
          ),
        ],
      );
}

extension on GStartPlotData_startPlot {
  PlotReply toPlotReply(GStartPlotReq req) => PlotReply(
    plotId: plotId,
    requestTime: timestamp,
    triggerTimestamp: triggerTimestamp,
    xAxisUnits: "Time",
    xAxisMin: req.vars.xMin?.toDouble(),
    xAxisMax: req.vars.xMax?.toDouble(),
    windowSize: req.vars.windowSize,
    data: data.indexed.map((e) => e.$2.toPlotChannelData(e.$1, req)).toList(),
  );
}

// And an extension to the DevValue hierarchy which translates a value into a
// GraphQL `GDevValue` type. No other code needs to be exposed to this
// interface, so we only make the extension visible in this module.

extension on DeviceValue {
  GDevValueBuilder _toGDevValue() => switch (this) {
    DevRaw(value: var v) => GDevValueBuilder()..rawVal = ListBuilder(v),
    DevScalar(value: var v) => GDevValueBuilder()..scalarVal = v,
    DevScalarArray(value: var v) =>
      GDevValueBuilder()..scalarArrayVal = ListBuilder(v),
    DevText(value: var v) => GDevValueBuilder()..textVal = v,
    DevTextArray(value: var v) =>
      GDevValueBuilder()..textArrayVal = ListBuilder(v),
    DevTimeSeries(values: var v) =>
      GDevValueBuilder()..timeSeriesVal = ListBuilder(v),
  };
}
