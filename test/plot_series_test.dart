import 'dart:typed_data';

import 'package:dart_gql_acsys/dart_gql_acsys.dart';
import 'package:test/test.dart';

Float64List _f(List<double> v) => Float64List.fromList(v);

void main() {
  group('PlotSeries.addAll', () {
    test('ScalarSeries accepts DevScalar points', () {
      final s = ScalarSeries.build(_f([1]), _f([10]));

      s.addAll([
        PlotPoint(t: 2, value: DevScalar(20)),
        PlotPoint(t: 3, value: DevScalar(30)),
      ]);

      expect(s.timestamps, equals([1, 2, 3]));
      expect(s.data, equals([10, 20, 30]));
    });

    test('ArraySeries accepts DevScalarArray points', () {
      final s = ArraySeries.empty();

      s.addAll([
        PlotPoint(t: 1, value: DevScalarArray(_f([1, 2]))),
        PlotPoint(t: 2, value: DevScalarArray(_f([3, 4]))),
      ]);

      expect(s.timestamps, equals([1, 2]));
      expect(
        s.data,
        equals([
          _f([1, 2]),
          _f([3, 4]),
        ]),
      );
    });

    test('TimeSeriesSeries accepts DevTimeSeries points', () {
      final s = TimeSeriesSeries.empty();
      final ts = DevTimeSeries.columns(_f([0.5]), _f([5]));

      s.addAll([PlotPoint(t: 1, value: ts)]);

      expect(s.timestamps, equals([1]));
      expect(s.data, equals([ts]));
    });

    test('a mismatched payload throws and leaves the series untouched', () {
      final s = ScalarSeries.build(_f([1]), _f([10]));

      expect(
        () => s.addAll([
          PlotPoint(t: 2, value: DevScalar(20)),
          PlotPoint(t: 3, value: DevText('nope')),
        ]),
        throwsArgumentError,
      );
      expect(s.length, equals(1));
      expect(s.data.length, equals(1));
    });

    test('an empty list is a no-op', () {
      final s = ArraySeries.empty()..addAll([]);

      expect(s.isEmpty, isTrue);
    });
  });
}
