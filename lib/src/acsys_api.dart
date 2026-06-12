import 'device_values.dart';
import 'status.dart';

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
  Future<Status> submit({
    required String forDRF,
    required DeviceValue newSetting,
  });

  /// Takes a device name and a value and sends a request to apply the value to
  /// the device's digital control property.
  Future<Status> sendCommand({required String toDRF, required String value});
}
