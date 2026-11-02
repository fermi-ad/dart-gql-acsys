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

import 'dart:collection';
import 'dart:core';
import 'dart:typed_data';

import 'status.dart';

// ---------------------------------------------------------------------------
// Equality helpers
//
// Each `DeviceValue` subclass defines its own `==`/`hashCode`. These helpers
// compare element-wise with typed loops, so typed lists aren't walked through
// boxed, dynamically-dispatched `==` calls.
//
// A device value is data, not arithmetic, so two NaN readings compare equal
// (IEEE `==` would say NaN != NaN, making a NaN reading unequal to itself).
// ---------------------------------------------------------------------------

bool _dEq(double a, double b) => a == b || (a.isNaN && b.isNaN);

bool _f64Eq(Float64List a, Float64List b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (var ii = 0; ii < a.length; ii++) {
    if (!_dEq(a[ii], b[ii])) return false;
  }
  return true;
}

// For element types whose `==` is already a value comparison (int, String).
bool _listEq<T>(List<T> a, List<T> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (var ii = 0; ii < a.length; ii++) {
    if (a[ii] != b[ii]) return false;
  }
  return true;
}

// Order-sensitive hash of a list's elements. Consistent with the equalities
// above: equal doubles (including 0.0/-0.0 and the canonical NaN) have equal
// `hashCode`s.
int _listHash<T>(List<T> l) {
  var h = l.length;

  for (var ii = 0; ii < l.length; ii++) {
    h = 0x1fffffff & (h * 31 + l[ii].hashCode);
  }
  return h;
}

/// Use this type to indicate any device type is allowed.
///
/// Functions that use this as a parameter will accept any of the derived
/// classes. Functions that return this type can, actually, return any of the
/// derived types.
///
/// Every subclass has value equality: two instances are `==` if they are the
/// same subclass and hold equal data (array types compare element-wise).
/// Array-holding values hash their contents, so don't mutate the array of a
/// value that's being used as a map key or set element.

sealed class DeviceValue {
  const DeviceValue();
}

final class const DevStatusCode(final Status status) extends DeviceValue {
  @override
  bool operator ==(Object other) =>
      other is DevStatusCode && other.status == status;

  @override
  int get hashCode => status.hashCode;

  @override
  String toString() => "[${status.facility} ${status.error}]";
}

/// Represents a raw, byte array.
///
/// If you ask for "raw" data from a device, you'll get an instance of this
/// type. Your application will have to interpret the data and determine how to
/// scale it. This type is mostly useful for diagnostics or for actual, binary
/// data buffers (i.e. image data.)

final class const DevRaw(final Uint8List value) extends DeviceValue {
  @override
  bool operator ==(Object other) =>
      other is DevRaw && _listEq(other.value, value);

  @override
  int get hashCode => _listHash(value);
}

/// Represents a single, floating point number.
///
/// Most devices deal with floating point values. This is the type to send to
/// a device and what would be returned when reading it.

final class const DevScalar(final double value) extends DeviceValue {
  @override
  bool operator ==(Object other) =>
      other is DevScalar && _dEq(other.value, value);

  @override
  int get hashCode => value.hashCode;
}

/// Represents an array of floating point values.
///
/// Some devices are "array devices" and will return an array of floating point
/// values. This type is also used by EPICS "waveform" devices.

final class const DevScalarArray(final Float64List value) extends DeviceValue {
  @override
  bool operator ==(Object other) =>
      other is DevScalarArray && _f64Eq(other.value, value);

  @override
  int get hashCode => _listHash(value);
}

/// Represents an array of 32-bit integers.
final class const DevIntArray(final Int32List value) extends DeviceValue {
  @override
  bool operator ==(Object other) =>
      other is DevIntArray && _listEq(other.value, value);

  @override
  int get hashCode => _listHash(value);
}

/// Represents a single string of characters.

final class const DevText(final String value) extends DeviceValue {
  @override
  bool operator ==(Object other) => other is DevText && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

/// Represents an array of strings.

final class const DevTextArray(final List<String> value) extends DeviceValue {
  @override
  bool operator ==(Object other) =>
      other is DevTextArray && _listEq(other.value, value);

  @override
  int get hashCode => _listHash(value);
}

/// Represents time-series data (i.e. a list of timestamp/value pairs.)
///
/// Samples are stored column-wise: `timestamps[i]` (seconds since the Unix
/// epoch) is the time of `values[i]`. This costs two allocations per series
/// instead of one boxed record per sample.

final class const DevTimeSeries._(
  final Float64List timestamps,
  final Float64List values,
) extends DeviceValue {
  /// Builds a series directly from its columns (no copying.) Both lists must
  /// have the same length.
  factory columns(Float64List timestamps, Float64List values) {
    if (timestamps.length != values.length) {
      throw ArgumentError(
        'timestamps (${timestamps.length}) and values (${values.length}) '
        'must have the same length',
      );
    } else {
      return DevTimeSeries._(timestamps, values);
    }
  }

  /// Builds a series from `(timestamp, value)` pairs. Kept for compatibility;
  /// prefer [DevTimeSeries.columns] which doesn't copy.
  factory DevTimeSeries(Iterable<(double, double)> value) {
    final list = value is List<(double, double)> ? value : value.toList();
    final n = list.length;
    final t = Float64List(n);
    final v = Float64List(n);

    for (var ii = 0; ii < n; ii++) {
      t[ii] = list[ii].$1;
      v[ii] = list[ii].$2;
    }
    return DevTimeSeries.columns(t, v);
  }

  /// Number of samples in the series.
  int get length => timestamps.length;

  /// A fixed-length `(timestamp, value)` view of the series, for compatibility
  /// with the old API. Nothing is copied: records are created on element
  /// access and writes go through to [timestamps] and [values].
  List<(double, double)> get value => _TimeSeriesView(timestamps, values);

  @override
  bool operator ==(Object other) =>
      other is DevTimeSeries &&
      _f64Eq(other.timestamps, timestamps) &&
      _f64Eq(other.values, values);

  @override
  int get hashCode => Object.hash(_listHash(timestamps), _listHash(values));
}

// Fixed-length list view pairing up the columns of a `DevTimeSeries`.
final class const _TimeSeriesView(final Float64List _t, final Float64List _v)
    extends ListBase<(double, double)> {
  @override
  int get length => _t.length;

  @override
  set length(int _) =>
      throw UnsupportedError('Cannot change the length of a time series');

  @override
  (double, double) operator [](int index) => (_t[index], _v[index]);

  @override
  void operator []=(int index, (double, double) e) {
    _t[index] = e.$1;
    _v[index] = e.$2;
  }
}

// The `*ToDeviceValue` extension allows us to convert primitive types into a
// `DeviceValue`. A function which sends a value to the GraphQL API can accept
// a specific type and try to call `.toDevVal()` on it. If the type is
// supported, it will be converted. If the type doesn't have a conversion,
// there will be a compile-time error.

extension ToDeviceValue on DeviceValue {
  DeviceValue toDevVal() => this;
}

extension DoubleToDeviceValue on double {
  DevScalar toDevVal() => DevScalar(this);
}

extension TextToDeviceValue on String {
  DevText toDevVal() => DevText(this);
}

extension RawToDeviceValue on Uint8List {
  DevRaw toDevVal() => DevRaw(this);
}

extension DoubleArrayToDeviceValue on Float64List {
  DevScalarArray toDevVal() => DevScalarArray(this);
}

extension IntArrayToDeviceValue on Int32List {
  DevIntArray toDevVal() => DevIntArray(this);
}

extension TextArrayToDeviceValue on List<String> {
  DevTextArray toDevVal() => DevTextArray(this);
}

extension RawTimeSeriesToDeviceValue on Iterable<(double, double)> {
  DevTimeSeries toDevVal() => DevTimeSeries(this);
}

extension TimeSeriesToDeviceValue on Iterable<(DateTime, double)> {
  DevTimeSeries toDevVal() =>
      DevTimeSeries(map((e) => (e.$1.millisecondsSinceEpoch / 1000.0, e.$2)));
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

  Int32List? toIntArray() => switch (this) {
    DevIntArray(value: final v) => v,
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

  Iterable<(DateTime, double)>? toTimeSeriesWithDates() => switch (this) {
    DevTimeSeries(:final timestamps, :final values) => Iterable.generate(
      timestamps.length,
      (ii) => (
        DateTime.fromMillisecondsSinceEpoch((timestamps[ii] * 1000).toInt()),
        values[ii],
      ),
    ),
    _ => null,
  };
}
