/// Public models and service contract for the BLM GraphQL API.
///
/// The field names mirror the GraphQL schema exposed by extapi-acsys. This
/// file intentionally contains no transport or GraphQL client implementation.
library;

/// Beamlines accepted by the BLM GraphQL API.
enum BlmBeamLine {
  unspecified,
  linac,
  linac2,
  beamLine400mev,
  btl,
  booster,
  beamLine8gev,
  mainInjector,
  recycler,
  p1,
  p2,
  p3,
  m1,
  m2,
  m3,
  m4,
  m5,
  deliveryRing,
}

extension BlmBeamLineGraphQL on BlmBeamLine {
  /// The exact enum literal required by the BLM GraphQL schema.
  String get graphqlName => switch (this) {
    BlmBeamLine.unspecified => 'BEAM_LINE_UNSPECIFIED',
    BlmBeamLine.linac => 'BEAM_LINE_LINAC',
    BlmBeamLine.linac2 => 'BEAM_LINE_LINAC2',
    BlmBeamLine.beamLine400mev => 'BEAM_LINE_400MEV',
    BlmBeamLine.btl => 'BEAM_LINE_BTL',
    BlmBeamLine.booster => 'BEAM_LINE_BOOSTER',
    BlmBeamLine.beamLine8gev => 'BEAM_LINE_8GEV',
    BlmBeamLine.mainInjector => 'BEAM_LINE_MAIN_INJECTOR',
    BlmBeamLine.recycler => 'BEAM_LINE_RECYCLER',
    BlmBeamLine.p1 => 'BEAM_LINE_P1',
    BlmBeamLine.p2 => 'BEAM_LINE_P2',
    BlmBeamLine.p3 => 'BEAM_LINE_P3',
    BlmBeamLine.m1 => 'BEAM_LINE_M1',
    BlmBeamLine.m2 => 'BEAM_LINE_M2',
    BlmBeamLine.m3 => 'BEAM_LINE_M3',
    BlmBeamLine.m4 => 'BEAM_LINE_M4',
    BlmBeamLine.m5 => 'BEAM_LINE_M5',
    BlmBeamLine.deliveryRing => 'BEAM_LINE_DELIVERY_RING',
  };
}

/// Converts a GraphQL enum literal to its Dart representation.
BlmBeamLine blmBeamLineFromGraphQL(String value) => switch (value) {
  'BEAM_LINE_UNSPECIFIED' => BlmBeamLine.unspecified,
  'BEAM_LINE_LINAC' => BlmBeamLine.linac,
  'BEAM_LINE_LINAC2' => BlmBeamLine.linac2,
  'BEAM_LINE_400MEV' => BlmBeamLine.beamLine400mev,
  'BEAM_LINE_BTL' => BlmBeamLine.btl,
  'BEAM_LINE_BOOSTER' => BlmBeamLine.booster,
  'BEAM_LINE_8GEV' => BlmBeamLine.beamLine8gev,
  'BEAM_LINE_MAIN_INJECTOR' => BlmBeamLine.mainInjector,
  'BEAM_LINE_RECYCLER' => BlmBeamLine.recycler,
  'BEAM_LINE_P1' => BlmBeamLine.p1,
  'BEAM_LINE_P2' => BlmBeamLine.p2,
  'BEAM_LINE_P3' => BlmBeamLine.p3,
  'BEAM_LINE_M1' => BlmBeamLine.m1,
  'BEAM_LINE_M2' => BlmBeamLine.m2,
  'BEAM_LINE_M3' => BlmBeamLine.m3,
  'BEAM_LINE_M4' => BlmBeamLine.m4,
  'BEAM_LINE_M5' => BlmBeamLine.m5,
  'BEAM_LINE_DELIVERY_RING' => BlmBeamLine.deliveryRing,
  _ => throw FormatException('Unknown BLM beam-line enum literal: $value'),
};

/// Metadata associated with an integrated-loss device.
final class BlmDeviceMetadata {
  final String devicePlotLabel;

  const BlmDeviceMetadata({required this.devicePlotLabel});

  factory BlmDeviceMetadata.fromJson(Map<String, dynamic> json) =>
      BlmDeviceMetadata(devicePlotLabel: _requiredString(json, 'devicePlotLabel'));
}

/// A BLM device returned by the integrated-loss device query.
final class BlmDevice {
  final String device;
  final BlmDeviceMetadata? metadata;

  const BlmDevice({required this.device, this.metadata});

  factory BlmDevice.fromJson(Map<String, dynamic> json) => BlmDevice(
    device: _requiredString(json, 'device'),
    metadata: _nullableObject(json['metadata'], BlmDeviceMetadata.fromJson),
  );
}

/// An ACNET status returned alongside a BLM loss-ratio value.
final class BlmStatus {
  final int facilityCode;
  final int statusCode;
  final String message;

  const BlmStatus({
    required this.facilityCode,
    required this.statusCode,
    required this.message,
  });

  factory BlmStatus.fromJson(Map<String, dynamic> json) => BlmStatus(
    facilityCode: _requiredInt(json, 'facilityCode'),
    statusCode: _requiredInt(json, 'statusCode'),
    message: _requiredString(json, 'message'),
  );
}

/// Loss-ratio data for one BLM device at one sample time.
final class BlmDeviceLossRatio {
  final BlmDevice? deviceData;
  final int integratedLoss;
  final int lossLimit;
  final double ratio;
  final DateTime? timestamp;
  final BlmStatus? status;

  const BlmDeviceLossRatio({
    this.deviceData,
    required this.integratedLoss,
    required this.lossLimit,
    required this.ratio,
    this.timestamp,
    this.status,
  });

  factory BlmDeviceLossRatio.fromJson(Map<String, dynamic> json) =>
      BlmDeviceLossRatio(
        deviceData: _nullableObject(json['deviceData'], BlmDevice.fromJson),
        integratedLoss: _requiredInt(json, 'integratedLoss'),
        lossLimit: _requiredInt(json, 'lossLimit'),
        ratio: _requiredDouble(json, 'ratio'),
        timestamp: _nullableDateTime(json['timestamp'], 'timestamp'),
        status: _nullableObject(json['status'], BlmStatus.fromJson),
      );
}

/// One event emitted by the BLM loss-ratio subscription.
final class BlmLossRatioSample {
  final List<BlmDeviceLossRatio> ratios;

  const BlmLossRatioSample({required this.ratios});

  factory BlmLossRatioSample.fromJson(Map<String, dynamic> json) {
    final rawRatios = _requiredList(json, 'ratios');
    return BlmLossRatioSample(
      ratios: rawRatios
          .map((value) => BlmDeviceLossRatio.fromJson(_object(value, 'ratios')))
          .toList(growable: false),
    );
  }
}

/// Efficiency information for one TCLK event.
final class BlmBeamEfficiency {
  final int tclkEvent;
  final int efficiency;
  final int protonsPerHour;

  const BlmBeamEfficiency({
    required this.tclkEvent,
    required this.efficiency,
    required this.protonsPerHour,
  });

  factory BlmBeamEfficiency.fromJson(Map<String, dynamic> json) =>
      BlmBeamEfficiency(
        tclkEvent: _requiredInt(json, 'tclkEvent'),
        efficiency: _requiredInt(json, 'efficiency'),
        protonsPerHour: _requiredInt(json, 'protonsPerHour'),
      );
}

/// One event emitted by the BLM beam-throughput subscription.
final class BlmBeamThroughputSample {
  final BlmBeamLine? beamLine;
  final int protonsPerPulse;
  final int protonsPerHour;
  final int protonsPerHourLimit;
  final List<BlmBeamEfficiency> efficiencies;

  const BlmBeamThroughputSample({
    this.beamLine,
    required this.protonsPerPulse,
    required this.protonsPerHour,
    required this.protonsPerHourLimit,
    required this.efficiencies,
  });

  factory BlmBeamThroughputSample.fromJson(Map<String, dynamic> json) {
    final rawEfficiencies = _requiredList(json, 'efficiencies');
    return BlmBeamThroughputSample(
      beamLine: _nullableBeamLine(json['beamLine']),
      protonsPerPulse: _requiredInt(json, 'protonsPerPulse'),
      protonsPerHour: _requiredInt(json, 'protonsPerHour'),
      protonsPerHourLimit: _requiredInt(json, 'protonsPerHourLimit'),
      efficiencies: rawEfficiencies
          .map((value) => BlmBeamEfficiency.fromJson(
                _object(value, 'efficiencies'),
              ))
          .toList(growable: false),
    );
  }
}

/// Public contract for the BLM GraphQL service.
abstract interface class BlmServiceAPI {
  /// Returns integrated-loss devices for a beamline and TCLK event.
  Future<List<BlmDevice>> integratedLossDevices({
    required BlmBeamLine beamLine,
    required int tclkEvent,
  });

  /// Streams loss-ratio samples for a beamline and TCLK event.
  Stream<BlmLossRatioSample> lossRatios({
    required BlmBeamLine beamLine,
    required int tclkEvent,
    required int sampleRateMs,
  });

  /// Streams beam-throughput samples for a beamline.
  Stream<BlmBeamThroughputSample> beamThroughput({
    required BlmBeamLine beamLine,
    required int sampleRateMs,
  });

  /// Releases resources held by this service.
  ///
  /// After calling [dispose], the service must not be used again.
  Future<void> dispose();
}

String _requiredString(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is String) return value;
  throw FormatException('BLM field "$key" must be a String');
}

int _requiredInt(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is int) return value;
  if (value is num && value == value.roundToDouble()) return value.toInt();
  throw FormatException('BLM field "$key" must be an integer');
}

double _requiredDouble(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is num) return value.toDouble();
  throw FormatException('BLM field "$key" must be a number');
}

List<Object?> _requiredList(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is List<Object?>) return value;
  throw FormatException('BLM field "$key" must be a list');
}

Map<String, dynamic> _object(Object? value, String key) {
  if (value is Map<String, dynamic>) return value;
  throw FormatException('BLM list field "$key" contains a non-object value');
}

T? _nullableObject<T>(
  Object? value,
  T Function(Map<String, dynamic>) parse,
) {
  if (value == null) return null;
  if (value is Map<String, dynamic>) return parse(value);
  throw FormatException('BLM nullable object has an invalid value');
}

DateTime? _nullableDateTime(Object? value, String key) {
  if (value == null) return null;
  if (value is String) return DateTime.parse(value);
  throw FormatException('BLM field "$key" must be an ISO-8601 String or null');
}

BlmBeamLine? _nullableBeamLine(Object? value) {
  if (value == null) return null;
  if (value is String) return blmBeamLineFromGraphQL(value);
  throw FormatException('BLM field "beamLine" must be a GraphQL enum or null');
}
