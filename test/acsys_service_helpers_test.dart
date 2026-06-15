/// Tests for the pure static helper methods on [ACSysService].
///
/// These methods contain non-trivial logic (type dispatch, timestamp
/// conversion) and can be exercised without a network connection.
library;

import 'package:test/test.dart';
import 'package:dart_gql_acsys/dart_gql_acsys.dart';

void main() {
  // ---------------------------------------------------------------------------
  // ACSysService.fromFloatTs
  // ---------------------------------------------------------------------------

  group('ACSysService.fromFloatTs', () {
    test('converts Unix epoch zero to 1970-01-01 UTC', () {
      final dt = ACSysService.fromFloatTs(0.0);

      expect(dt.microsecondsSinceEpoch, equals(0));
    });

    test('converts a whole-second timestamp correctly', () {
      // 1_000_000 seconds after epoch
      final dt = ACSysService.fromFloatTs(1_000_000.0);

      expect(
        dt,
        equals(DateTime.fromMicrosecondsSinceEpoch(1_000_000 * 1_000_000)),
      );
    });

    test('preserves sub-second precision', () {
      // 1.5 seconds → 1_500_000 microseconds
      final dt = ACSysService.fromFloatTs(1.5);

      expect(dt.microsecondsSinceEpoch, equals(1_500_000));
    });
  });

  // ---------------------------------------------------------------------------
  // ACSysService.devVal — happy-path dispatch
  // ---------------------------------------------------------------------------

  group('ACSysService.devVal — known types', () {
    test('dispatches StatusReply', () {
      final v = ACSysService.devVal({'__typename': 'StatusReply', 'status': 0});

      expect(v, isA<DevStatusCode>());
      expect((v as DevStatusCode).status, equals(Status.SUCCESS));
    });

    test('dispatches Scalar', () {
      final v = ACSysService.devVal({
        '__typename': 'Scalar',
        'scalarValue': 3.14,
      });

      expect(v, isA<DevScalar>());
      expect((v as DevScalar).value, closeTo(3.14, 1e-9));
    });

    test('dispatches ScalarArray', () {
      final v = ACSysService.devVal({
        '__typename': 'ScalarArray',
        'scalarArrayValue': [1.0, 2.0, 3.0],
      });

      expect(v, isA<DevScalarArray>());
      expect((v as DevScalarArray).value, equals([1.0, 2.0, 3.0]));
    });

    test('dispatches Raw', () {
      final v = ACSysService.devVal({
        '__typename': 'Raw',
        'rawValue': [0xDE, 0xAD, 0xBE, 0xEF],
      });

      expect(v, isA<DevRaw>());
      expect((v as DevRaw).value, equals([0xDE, 0xAD, 0xBE, 0xEF]));
    });

    test('dispatches Text', () {
      final v = ACSysService.devVal({
        '__typename': 'Text',
        'textValue': 'hello',
      });

      expect(v, isA<DevText>());
      expect((v as DevText).value, equals('hello'));
    });

    test('dispatches TextArray', () {
      final v = ACSysService.devVal({
        '__typename': 'TextArray',
        'textArrayValue': ['a', 'b', 'c'],
      });

      expect(v, isA<DevTextArray>());
      expect((v as DevTextArray).value, equals(['a', 'b', 'c']));
    });

    test('Scalar coerces int to double', () {
      // The GraphQL client may return an int for a Float field.
      final v = ACSysService.devVal({
        '__typename': 'Scalar',
        'scalarValue': 42, // int, not double
      });

      expect(v, isA<DevScalar>());
      expect((v as DevScalar).value, equals(42.0));
    });
  });

  // ---------------------------------------------------------------------------
  // ACSysService.devVal — error path
  // ---------------------------------------------------------------------------

  group('ACSysService.devVal — unknown type', () {
    test('throws ACSysGraphQLException for null __typename', () {
      expect(
        () => ACSysService.devVal({'__typename': null}),
        throwsA(
          isA<ACSysGraphQLException>().having(
            (e) => e.toString(),
            'message',
            contains('__typename=null'),
          ),
        ),
      );
    });

    test('throws ACSysGraphQLException for unrecognised __typename', () {
      expect(
        () => ACSysService.devVal({'__typename': 'Bogus'}),
        throwsA(isA<ACSysGraphQLException>()),
      );
    });
  });
}
