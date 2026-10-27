import 'package:test/test.dart';

import 'dart:typed_data';

import 'package:dart_gql_acsys/dart_gql_acsys.dart';

DeviceValue _makeScalar(double v) => DevScalar(v);

DeviceValue _makeScalarArray(List<double> s) =>
    DevScalarArray(Float64List.fromList(s));

DeviceValue _makeText(String s) => DevText(s);

DeviceValue _makeTextArray(List<String> s) => DevTextArray(s);

DeviceValue _makeRaw(List<int> v) => DevRaw(Uint8List.fromList(v));

void main() {
  // This test verifies the equality operator is working for `DeviceValue`
  // types.
  test("Test device value equality", () {
    const v = DevScalar(1.0);

    expect(v, equals(v));
    expect(_makeScalar(1.0), equals(_makeScalar(1.0)));
    expect(_makeScalar(2.0), isNot(equals(_makeScalar(1.0))));

    expect(_makeRaw([]), isNot(equals(_makeScalar(1.0))));
    expect(_makeRaw([]), equals(_makeRaw([])));
    expect(_makeRaw([]), isNot(equals(_makeText("Hi"))));
    expect(_makeRaw([1, 2, 3]), equals(_makeRaw([1, 2, 3])));
    expect(_makeRaw([1, 2, 3]), isNot(equals(_makeRaw([0, 2, 3]))));

    expect(_makeText("Hello"), isNot(equals(_makeScalar(1.0))));
    expect(_makeText("hello"), isNot(equals(_makeRaw([]))));
    expect(_makeText("Hello"), equals(_makeText("Hello")));
    expect(_makeText("Hello"), isNot(equals(_makeText("Hi"))));

    expect(_makeTextArray(["Hello", "there"]), isNot(equals(_makeScalar(1.0))));
    expect(_makeTextArray(["Hello", "there"]), isNot(equals(_makeRaw([]))));
    expect(_makeTextArray(["Hello", "there"]), isNot(equals(_makeText("Hi"))));
    expect(
      _makeTextArray(["Hello", "there"]),
      equals(_makeTextArray(["Hello", "there"])),
    );
    expect(
      _makeTextArray(["Hello", "there"]),
      isNot(equals(_makeTextArray(["Hi", "there"]))),
    );

    expect(_makeScalarArray([1.0, 2.0, 3.0]), isNot(equals(_makeScalar(1.0))));
    expect(_makeScalarArray([1.0, 2.0, 3.0]), isNot(equals(_makeRaw([]))));
    expect(_makeScalarArray([1.0, 2.0, 3.0]), isNot(equals(_makeText("Hi"))));
    expect(
      _makeScalarArray([1.0, 2.0, 3.0]),
      isNot(equals(_makeTextArray(["Hello", "there"]))),
    );
    expect(
      _makeScalarArray([1.0, 2.0, 3.0]),
      equals(_makeScalarArray([1.0, 2.0, 3.0])),
    );
    expect(
      _makeScalarArray([1.0, 2.0, 3.0]),
      isNot(equals(_makeScalarArray([1.0, 3.0]))),
    );
  });

  group("Device value equality (per-subclass)", () {
    test("comparing with a non-DeviceValue returns false, never throws", () {
      // Previously `==` took `covariant DeviceValue`, so this threw TypeError.
      final Object other = "x";

      expect(_makeScalar(1.0) == other, isFalse);
      expect(_makeRaw([1]) == other, isFalse);
      expect(<Object>[1, "a", _makeText("t")].contains(_makeText("t")), isTrue);
      expect(<Object>[1, "a"].contains(_makeScalar(1.0)), isFalse);
    });

    test("NaN readings are equal to each other", () {
      expect(_makeScalar(double.nan), equals(_makeScalar(double.nan)));
      expect(_makeScalar(double.nan), isNot(equals(_makeScalar(1.0))));
      expect(
        _makeScalarArray([1.0, double.nan]),
        equals(_makeScalarArray([1.0, double.nan])),
      );
      expect(
        DevTimeSeries([(1.0, double.nan)]),
        equals(DevTimeSeries([(1.0, double.nan)])),
      );
    });

    test("IntArray compares element-wise", () {
      DeviceValue ints(List<int> v) => DevIntArray(Int32List.fromList(v));

      expect(ints([1, 2, 3]), equals(ints([1, 2, 3])));
      expect(ints([1, 2, 3]), isNot(equals(ints([1, 2]))));
      expect(ints([1, 2, 3]), isNot(equals(ints([1, 2, 4]))));
      // Same contents, different type.
      expect(ints([1, 2]), isNot(equals(_makeRaw([1, 2]))));
    });

    test("TimeSeries compares element-wise", () {
      expect(
        DevTimeSeries([(1.0, 2.0), (3.0, 4.0)]),
        equals(DevTimeSeries([(1.0, 2.0), (3.0, 4.0)])),
      );
      expect(
        DevTimeSeries([(1.0, 2.0)]),
        isNot(equals(DevTimeSeries([(1.0, 2.5)]))),
      );
      expect(
        DevTimeSeries([(1.0, 2.0)]),
        isNot(equals(DevTimeSeries([(1.0, 2.0), (3.0, 4.0)]))),
      );
    });

    test("StatusCode compares the status", () {
      expect(
        const DevStatusCode(Status.SUCCESS),
        equals(const DevStatusCode(Status.SUCCESS)),
      );
      expect(
        const DevStatusCode(Status.SUCCESS),
        isNot(equals(const DevStatusCode(Status.ACNET_NO_SUCH))),
      );
    });

    test("equal values have equal hash codes", () {
      final pairs = <(DeviceValue, DeviceValue)>[
        (_makeScalar(1.5), _makeScalar(1.5)),
        (_makeScalar(0.0), _makeScalar(-0.0)),
        (_makeScalar(double.nan), _makeScalar(double.nan)),
        (_makeText("a"), _makeText("a")),
        (_makeRaw([1, 2]), _makeRaw([1, 2])),
        (
          _makeScalarArray([1.0, double.nan]),
          _makeScalarArray([1.0, double.nan]),
        ),
        (
          DevIntArray(Int32List.fromList([7, 8])),
          DevIntArray(Int32List.fromList([7, 8])),
        ),
        (_makeTextArray(["a", "b"]), _makeTextArray(["a", "b"])),
        (DevTimeSeries([(1.0, 2.0)]), DevTimeSeries([(1.0, 2.0)])),
        (
          const DevStatusCode(Status.ACNET_NO_SUCH),
          const DevStatusCode(Status.ACNET_NO_SUCH),
        ),
      ];

      for (final (a, b) in pairs) {
        expect(a, equals(b));
        expect(a.hashCode, equals(b.hashCode), reason: "$a vs $b");
      }
    });

    test("works as set elements / map keys", () {
      final s = <DeviceValue>{
        _makeScalarArray([1.0, 2.0]),
        _makeScalarArray([1.0, 2.0]),
        _makeRaw([1, 2]),
        _makeScalar(double.nan),
        _makeScalar(double.nan),
      };

      expect(s, hasLength(3));
      expect(s.contains(_makeRaw([1, 2])), isTrue);
    });
  });

  test("Test device value conversions", () {
    // Make sure the DeviceValue types all pass through unchanged.

    expect(_makeRaw([]).toDevVal(), equals(_makeRaw([])));
    expect(_makeRaw([1, 2]).toDevVal(), equals(_makeRaw([1, 2])));
    expect(Uint8List.fromList([1, 2]).toDevVal(), equals(_makeRaw([1, 2])));

    expect(_makeScalar(1.0).toDevVal(), equals(_makeScalar(1.0)));
    expect(1.0.toDevVal(), equals(_makeScalar(1.0)));

    expect(_makeScalarArray([1.0]).toDevVal(), equals(_makeScalarArray([1.0])));

    expect(_makeText("A").toDevVal(), equals(_makeText("A")));
    expect("Hello".toDevVal(), equals(_makeText("Hello")));

    expect(_makeTextArray(["A"]).toDevVal(), equals(_makeTextArray(["A"])));
  });
}
