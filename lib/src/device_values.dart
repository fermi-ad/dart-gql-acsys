/// Defines all types used by devices in Fermilab's control system.
///
/// This module providess a sealed class hierarchy which defines all the types
/// of values that can be found in Fermilab's control system. If a new type is
/// added, it needs to be defined in this module and a new release of this
/// package needs to be made.
///
/// Functions that deal with devices will specify `DeviceValue` as a parameter
/// or return a `DeviceValue` value. For instance, if a hypothetical `setDevice`
/// function takes a devices name and a device value, we could set it to `10.0`
/// by making the call
///
/// ```
/// setDevice("DEVICE", DevScalar(10.0));
/// ```
///
/// If one were receiving a value from a function, you can use pattern-matching
/// to get the value. For instance, reading (hypothetically) outdoor temperature
/// returns a floating point number:
///
/// ```
/// if (readDevice("M:OUTTMP") case DevScalar(value: deg)) {
///     print("It is $deg degrees outside.");
/// } else {
///     print("M:OUTTMP didn't return a floating point number!");
/// }
/// ```
library;

import 'dart:typed_data';

import 'package:collection/collection.dart';

import 'status.dart';

/// Use this type to indicate any device type is allowed.
///
/// Functions that use this as a parameter will accept any of the derived
/// classes. Functions that return this type can, actually, return any of the
/// derived types.

sealed class DeviceValue {
  static const _listEq = ListEquality<dynamic>();

  const DeviceValue();

  @override
  bool operator ==(covariant DeviceValue other) {
    if (identical(this, other)) return true;

    switch ((this, other)) {
      case ((DevRaw(value: final v), DevRaw(value: final o))):
        return _listEq.equals(v, o);
      case ((DevScalar(value: final v), DevScalar(value: final o))):
        return v == o;
      case ((DevScalarArray(value: final v), DevScalarArray(value: final o))):
        return _listEq.equals(v, o);
      case ((DevText(value: final v), DevText(value: final o))):
        return v == o;
      case ((DevTextArray(value: final v), DevTextArray(value: final o))):
        return _listEq.equals(v, o);
      case ((DevTimeSeries(value: final v), DevTimeSeries(value: final o))):
        return _listEq.equals(v, o);
      case ((DevStatusCode(status: final v), DevStatusCode(status: final o))):
        return v == o;
      default:
        return false;
    }
  }

  @override
  int get hashCode => switch (this) {
    DevRaw(value: final v) => _listEq.hash(v),
    DevScalar(value: final v) => v.hashCode,
    DevText(value: final v) => v.hashCode,
    DevScalarArray(value: final v) => _listEq.hash(v),
    DevTextArray(value: final v) => _listEq.hash(v),
    DevTimeSeries(value: final v) => _listEq.hash(v),
    DevStatusCode(status: final v) => v.hashCode,
  };
}

final class const DevStatusCode(final Status status) extends DeviceValue {
  @override
  String toString() => "[${status.facility} ${status.error}]";
}

/// Represents a raw, byte array.
///
/// If you ask for "raw" data from a device, you'll get an instance of this
/// type. Your application will have to interpret the data and determine how to
/// scale it. This type is mostly useful for diagnostics or for actual, binary
/// data buffers (i.e. image data.)

final class const DevRaw(final Uint8List value) extends DeviceValue;

/// Represents a single, floating point number.
///
/// Most devices deal with floating point values. This is the type to send to
/// a device and what would be returned when reading it.

final class const DevScalar(final double value) extends DeviceValue;

/// Represents an array of floating point values.
///
/// Some devices are "array devices" and will return an array of floating point
/// values. This type is also used by EPICS "waveform" devices.

final class const DevScalarArray(final Float64List value) extends DeviceValue;

/// Represents a single string of characters.

final class const DevText(final String value) extends DeviceValue;

/// Represents an array of strings.

final class const DevTextArray(final List<String> value) extends DeviceValue;

/// Represents time-series data (i.e. a list of timestamp/value pairs.)

final class const DevTimeSeries(final List<(double, double)> value)
    extends DeviceValue;

// The `ToDeviceValue` extension allows us to convert primitive types into a
// `DeviceValue`.

extension ToDeviceValue on DeviceValue {
  DeviceValue toDevVal() => this;
}

extension DoubleToDeviceValue on double {
  DeviceValue toDevVal() => DevScalar(this);
}

extension TextToDeviceValue on String {
  DeviceValue toDevVal() => DevText(this);
}

extension RawToDeviceValue on Uint8List {
  DeviceValue toDevVal() => DevRaw(this);
}

extension DoubleArrayToDeviceValue on Float64List {
  DeviceValue toDevVal() => DevScalarArray(this);
}

extension TextArrayToDeviceValue on List<String> {
  DeviceValue toDevVal() => DevTextArray(this);
}

extension RawTimeSeriesToDeviceValue on List<(double, double)> {
  DeviceValue toDevVal() => DevTimeSeries(this);
}

extension TimeSeriesToDeviceValue on List<(DateTime, double)> {
  DeviceValue toDevVal() => DevTimeSeries(
    map((e) => (e.$1.millisecondsSinceEpoch / 1000.0, e.$2)).toList(),
  );
}

// The `FromDeviceValue` extension allows us to convert a `DeviceValue` into a
// primitive type.

extension FromDeviceValue on DeviceValue {
  Status? toStatus() => switch (this) {
    DevStatusCode(status: final v) => v,
    _ => null,
  };

  double? toDouble() => switch (this) {
    DevScalar(value: final v) => v,
    _ => null,
  };

  String? toText() => switch (this) {
    DevText(value: final v) => v,
    _ => null,
  };

  Uint8List? toRaw() => switch (this) {
    DevRaw(value: final v) => v,
    _ => null,
  };

  Float64List? toDoubleArray() => switch (this) {
    DevScalarArray(value: final v) => v,
    _ => null,
  };

  List<String>? toTextArray() => switch (this) {
    DevTextArray(value: final v) => v,
    _ => null,
  };

  List<(double, double)>? toTimeSeries() => switch (this) {
    DevTimeSeries(value: final v) => v,
    _ => null,
  };

  List<(DateTime, double)>? toTimeSeriesWithDates() => switch (this) {
    DevTimeSeries(value: final v) =>
      v
          .map(
            (e) => (
              DateTime.fromMillisecondsSinceEpoch((e.$1 * 1000).toInt()),
              e.$2,
            ),
          )
          .toList(),
    _ => null,
  };
}
