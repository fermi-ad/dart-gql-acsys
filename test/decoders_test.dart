/// Unit tests for the GraphQL response decoders in `lib/src/decoders.dart`.
///
/// The decoders are pure functions of JSON-shaped data, so every test feeds
/// in maps/lists shaped like a GraphQL client response and checks the
/// resulting domain objects. No network is involved.
library;

import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_gql_acsys/dart_gql_acsys.dart';
import 'package:dart_gql_acsys/src/decoders.dart' as decode;
import 'package:test/test.dart';

// Matches an [ACSysGraphQLException] whose message contains [text].
Matcher _gqlError(String text) => throwsA(
  isA<ACSysGraphQLException>().having(
    (e) => e.toString(),
    'message',
    contains(text),
  ),
);

// Builds a `{timestamp, result}` row as found in acceleratorData and
// channelData lists.
Map<String, dynamic> _row(num ts, Map<String, dynamic> result) => {
  'timestamp': ts,
  'result': result,
};

Map<String, dynamic> _scalar(Object? v) => {
  '__typename': 'Scalar',
  'scalarValue': v,
};

Map<String, dynamic> _array(List<Object?> v) => {
  '__typename': 'ScalarArray',
  'scalarArrayValue': v,
};

void main() {
  // -------------------------------------------------------------------------
  // Timestamps
  // -------------------------------------------------------------------------

  group('fromTs', () {
    test('converts Unix epoch zero', () {
      expect(decode.fromTs(0.0).microsecondsSinceEpoch, equals(0));
    });

    test('converts a whole-second timestamp', () {
      expect(
        decode.fromTs(1_000_000.0),
        equals(DateTime.fromMicrosecondsSinceEpoch(1_000_000 * 1_000_000)),
      );
    });

    test('preserves sub-second precision', () {
      expect(decode.fromTs(1.5).microsecondsSinceEpoch, equals(1_500_000));
    });

    test('accepts an int (JSON whole number)', () {
      expect(decode.fromTs(2).microsecondsSinceEpoch, equals(2_000_000));
    });
  });

  group('toFloatTs', () {
    test('passes null through', () {
      expect(decode.toFloatTs(null), isNull);
    });

    test('converts to fractional seconds', () {
      final dt = DateTime.fromMicrosecondsSinceEpoch(1_500_000);

      expect(decode.toFloatTs(dt), equals(1.5));
    });

    test('round-trips through fromTs', () {
      final dt = DateTime.fromMicrosecondsSinceEpoch(1_234_567_000);

      expect(decode.fromTs(decode.toFloatTs(dt)!), equals(dt));
    });
  });

  // -------------------------------------------------------------------------
  // devVal
  // -------------------------------------------------------------------------

  group('devVal — known types', () {
    test('StatusReply', () {
      final v = decode.devVal({'__typename': 'StatusReply', 'status': 0});

      expect(v, isA<DevStatusCode>());
      expect((v as DevStatusCode).status, equals(Status.SUCCESS));
    });

    test('Scalar', () {
      final v = decode.devVal(_scalar(3.14));

      expect((v as DevScalar).value, closeTo(3.14, 1e-9));
    });

    test('Scalar coerces int to double', () {
      expect((decode.devVal(_scalar(42)) as DevScalar).value, equals(42.0));
    });

    // JSON has no NaN: the gateway sends a NaN reading as null.
    test('Scalar decodes null as NaN', () {
      expect((decode.devVal(_scalar(null)) as DevScalar).value.isNaN, isTrue);
    });

    test('ScalarArray decodes into a Float64List', () {
      final v = decode.devVal(_array([1.0, 2, 3.5]));

      expect(v, isA<DevScalarArray>());
      final a = (v as DevScalarArray).value;
      expect(a, isA<Float64List>());
      expect(a, equals([1.0, 2.0, 3.5]));
    });

    test('ScalarArray decodes a null element as NaN', () {
      final a = (decode.devVal(_array([1.0, null, 3])) as DevScalarArray).value;

      expect(a.length, equals(3));
      expect(a[0], equals(1.0));
      expect(a[1].isNaN, isTrue);
      expect(a[2], equals(3.0));
    });

    test('ScalarArray decodes an empty array', () {
      expect((decode.devVal(_array([])) as DevScalarArray).value, isEmpty);
    });

    test('IntArray decodes into an Int32List', () {
      final v = decode.devVal({
        '__typename': 'IntArray',
        'intArrayValue': [1, -2, 2147483647],
      });

      expect(v, isA<DevIntArray>());
      final a = (v as DevIntArray).value;
      expect(a, isA<Int32List>());
      expect(a, equals([1, -2, 2147483647]));
    });

    test('Raw decodes into a Uint8List', () {
      final v = decode.devVal({
        '__typename': 'Raw',
        'rawValue': [0xDE, 0xAD, 0xBE, 0xEF],
      });

      expect(v, isA<DevRaw>());
      final a = (v as DevRaw).value;
      expect(a, isA<Uint8List>());
      expect(a, equals([0xDE, 0xAD, 0xBE, 0xEF]));
    });

    test('Text', () {
      final v = decode.devVal({'__typename': 'Text', 'textValue': 'hello'});

      expect((v as DevText).value, equals('hello'));
    });

    test('TextArray', () {
      final v = decode.devVal({
        '__typename': 'TextArray',
        'textArrayValue': ['a', 'b', 'c'],
      });

      expect((v as DevTextArray).value, equals(['a', 'b', 'c']));
    });

    test('TextArray is a copy, independent of the JSON list', () {
      final src = <Object?>['a', 'b'];
      final v = decode.devVal({
        '__typename': 'TextArray',
        'textArrayValue': src,
      });

      src[0] = 'changed';
      expect((v as DevTextArray).value, equals(['a', 'b']));
    });
  });

  group('devVal — errors', () {
    test('null __typename', () {
      expect(
        () => decode.devVal({'__typename': null}),
        _gqlError('__typename=null'),
      );
    });

    test('unrecognised __typename', () {
      expect(
        () => decode.devVal({'__typename': 'Bogus'}),
        _gqlError('__typename=Bogus'),
      );
    });

    test('non-numeric element in ScalarArray', () {
      expect(
        () => decode.devVal(_array([1.0, 'x'])),
        throwsA(isA<TypeError>()),
      );
    });

    // A non-string element must fail while decoding, not later when the
    // caller first reads that element.
    test('non-string element in TextArray fails at decode time', () {
      expect(
        () => decode.devVal({
          '__typename': 'TextArray',
          'textArrayValue': ['a', 1],
        }),
        throwsA(isA<TypeError>()),
      );
    });

    test('non-int element in IntArray', () {
      expect(
        () => decode.devVal({
          '__typename': 'IntArray',
          'intArrayValue': [1, 2.5],
        }),
        throwsA(isA<TypeError>()),
      );
    });

    test('missing array field', () {
      expect(
        () => decode.devVal({'__typename': 'Raw'}),
        throwsA(isA<TypeError>()),
      );
    });
  });

  // -------------------------------------------------------------------------
  // Readings
  // -------------------------------------------------------------------------

  group('readingsFromQuery', () {
    test('flattens every entry and tags rows with their refId', () {
      final readings = decode.readingsFromQuery({
        'acceleratorData': [
          {
            'refId': 0,
            'data': [_row(1.0, _scalar(10.0)), _row(2.0, _scalar(20.0))],
          },
          {
            'refId': 1,
            'data': [
              _row(3, {'__typename': 'Text', 'textValue': 'on'}),
            ],
          },
        ],
      });

      expect(readings.map((r) => r.refId), equals([0, 0, 1]));
      expect(
        readings.map((r) => r.timestamp.microsecondsSinceEpoch),
        equals([1_000_000, 2_000_000, 3_000_000]),
      );
      expect(readings[0].value, equals(const DevScalar(10.0)));
      expect(readings[1].value, equals(const DevScalar(20.0)));
      expect(readings[2].value, equals(const DevText('on')));
    });

    test('returns an empty list for no entries', () {
      expect(decode.readingsFromQuery({'acceleratorData': []}), isEmpty);
    });

    test('rejects a malformed entry', () {
      expect(
        () => decode.readingsFromQuery({
          'acceleratorData': [
            {'data': []},
          ],
        }),
        _gqlError('acceleratorData entry shape'),
      );
    });

    test('rejects a malformed row', () {
      expect(
        () => decode.readingsFromQuery({
          'acceleratorData': [
            {
              'refId': 0,
              'data': [
                {'timestamp': 'yesterday', 'result': _scalar(1.0)},
              ],
            },
          ],
        }),
        _gqlError('acceleratorData row shape'),
      );
    });
  });

  group('readingsFromSubscription', () {
    test('decodes a single entry', () {
      final readings = decode.readingsFromSubscription({
        'acceleratorData': {
          'refId': 7,
          'data': [
            _row(1.5, {'__typename': 'StatusReply', 'status': -6143}),
          ],
        },
      });

      expect(readings, hasLength(1));
      expect(readings.single.refId, equals(7));
      expect(
        readings.single.timestamp.microsecondsSinceEpoch,
        equals(1_500_000),
      );
      expect(readings.single.value.toStatus(), equals(Status.ACNET_NO_SUCH));
    });

    test('rejects a missing entry', () {
      expect(
        () => decode.readingsFromSubscription({'acceleratorData': null}),
        _gqlError('acceleratorData entry shape'),
      );
    });
  });

  // -------------------------------------------------------------------------
  // Plots
  // -------------------------------------------------------------------------

  group('plotSeries', () {
    test('decodes scalar rows into column storage', () {
      final s = decode.plotSeries([
        _row(1.0, _scalar(10.0)),
        _row(2, _scalar(20)),
        _row(3.5, _scalar(null)),
      ]);

      expect(s, isA<ScalarSeries>());
      final ScalarSeries(:t, :y) = s as ScalarSeries;

      expect(s.length, equals(3));
      expect(t, equals([1.0, 2.0, 3.5]));
      expect(y[0], equals(10.0));
      expect(y[1], equals(20.0));
      expect(y[2].isNaN, isTrue);
    });

    test('decodes array rows into an ArraySeries', () {
      final s = decode.plotSeries([
        _row(1.0, _array([1.0, 2.0])),
        _row(2.0, _array([3, null, 5])),
      ]);

      expect(s, isA<ArraySeries>());
      final ArraySeries(:t, :y) = s as ArraySeries;

      expect(t, equals([1.0, 2.0]));
      expect(y, hasLength(2));
      expect(y[0], equals([1.0, 2.0]));
      expect(y[1][0], equals(3.0));
      expect(y[1][1].isNaN, isTrue);
      expect(y[1][2], equals(5.0));
    });

    test('an empty channel is an empty ScalarSeries', () {
      final s = decode.plotSeries([]);

      expect(s, isA<ScalarSeries>());
      expect(s.length, equals(0));
      expect((s as ScalarSeries).y, isEmpty);
    });

    test('rejects an array row in a scalar channel', () {
      expect(
        () => decode.plotSeries([
          _row(1.0, _scalar(1.0)),
          _row(2.0, _array([1.0])),
        ]),
        _gqlError('__typename=ScalarArray'),
      );
    });

    test('rejects a scalar row in an array channel', () {
      expect(
        () => decode.plotSeries([
          _row(1.0, _array([1.0])),
          _row(2.0, _scalar(1.0)),
        ]),
        _gqlError('__typename=Scalar'),
      );
    });

    test('rejects a non-plottable type', () {
      expect(
        () => decode.plotSeries([
          _row(1.0, {'__typename': 'StatusReply', 'status': 0}),
        ]),
        _gqlError('__typename=StatusReply'),
      );
    });

    test('rejects a malformed row', () {
      expect(
        () => decode.plotSeries([
          _row(1.0, _scalar(1.0)),
          {'timestamp': 2.0},
        ]),
        _gqlError('channelData row shape'),
      );
    });
  });

  group('plotReply', () {
    Map<String, dynamic> channel(List<Object?> rows) => {
      'channelRate': '1 Hz',
      'channelUnits': 'degF',
      'channelStatus': 0,
      'channelData': rows,
    };

    Map<String, dynamic> event(List<Object?> channels, {num? trigger}) => {
      'startPlot': {
        'plotId': 'plot-1',
        'timestamp': 100,
        'triggerTimestamp': trigger,
        'data': channels,
      },
    };

    test('decodes channels and labels them with the requested DRFs', () {
      final reply = decode.plotReply(
        event([
          channel([_row(1.0, _scalar(1.0))]),
          channel([
            _row(1.0, _array([1.0, 2.0])),
          ]),
        ], trigger: 99.5),
        ['M:OUTTMP', 'G:HUMID'],
        xMin: -1.0,
        xMax: 1.0,
        windowSize: 30,
      );

      expect(reply.plotId, equals('plot-1'));
      expect(reply.requestTime, equals(100.0));
      expect(reply.triggerTimestamp, equals(99.5));
      expect(reply.xAxisUnits, equals('Time'));
      expect(reply.xAxisMin, equals(-1.0));
      expect(reply.xAxisMax, equals(1.0));
      expect(reply.windowSize, equals(30));

      expect(reply.data.map((c) => c.name), equals(['M:OUTTMP', 'G:HUMID']));
      expect(reply.data[0].units, equals('degF'));
      expect(reply.data[0].rate, equals('1 Hz'));
      expect(reply.data[0].status, equals(0));
      expect(reply.data[0].series, isA<ScalarSeries>());
      expect(reply.data[1].series, isA<ArraySeries>());
    });

    test('a missing trigger timestamp decodes as null', () {
      final reply = decode.plotReply(event([]), ['M:OUTTMP']);

      expect(reply.triggerTimestamp, isNull);
      expect(reply.data, isEmpty);
    });

    test('rejects more channels than requested devices', () {
      expect(
        () => decode.plotReply(event([channel([]), channel([])]), ['M:OUTTMP']),
        _gqlError('2 channels for 1 requested'),
      );
    });
  });

  // -------------------------------------------------------------------------
  // Alarms
  // -------------------------------------------------------------------------

  group('alarmFromRow', () {
    Map<String, dynamic> alarmRow({
      Object? source = 'ANALOG',
      Object? state = 'ALARMED',
      Object? severity = 'HIGH',
      Object? time = 1.5,
      Object? wake = '2026-08-21T17:53:33+00:00',
    }) => {
      'device': 'M:OUTTMP',
      'source': source,
      'state': state,
      'severity': severity,
      'acknowledgeable': true,
      'time': time,
      'epicsType': '',
      'user': 'operator',
      'wake': wake,
    };

    test('decodes every field', () {
      final a = decode.alarmFromRow(alarmRow());

      expect(a.device, equals('M:OUTTMP'));
      expect(a.source, equals(AlarmSource.analog));
      expect(a.state, equals(AlarmState.alarmed));
      expect(a.severity, equals(AlarmSeverity.high));
      expect(a.acknowledgeable, isTrue);
      expect(a.time.microsecondsSinceEpoch, equals(1_500_000));
      expect(a.epicsType, equals(''));
      expect(a.user, equals('operator'));
      expect(a.wake, equals(DateTime.utc(2026, 8, 21, 17, 53, 33)));
    });

    test('enum matching is case-insensitive', () {
      final a = decode.alarmFromRow(
        alarmRow(source: 'epics', state: 'Bypassed', severity: 'low'),
      );

      expect(a.source, equals(AlarmSource.epics));
      expect(a.state, equals(AlarmState.bypassed));
      expect(a.severity, equals(AlarmSeverity.low));
    });

    test('unrecognised or missing enum values map to unknown', () {
      final a = decode.alarmFromRow(
        alarmRow(source: 'PLC', state: null, severity: 'MEDIUM'),
      );

      expect(a.source, equals(AlarmSource.unknown));
      expect(a.state, equals(AlarmState.unknown));
      expect(a.severity, equals(AlarmSeverity.unknown));
    });

    test('a null timestamp falls back to the Unix epoch', () {
      final a = decode.alarmFromRow(alarmRow(wake: null));

      expect(a.wake.millisecondsSinceEpoch, equals(0));
    });

    test('rejects an unsupported timestamp type', () {
      expect(
        () => decode.alarmFromRow(alarmRow(time: true)),
        _gqlError('Unexpected timestamp format'),
      );
    });
  });

  group('alarmsFromList', () {
    test('decodes each row', () {
      final alarms = decode.alarmsFromList([
        {
          'device': 'A',
          'source': 'DIGITAL',
          'state': 'OK',
          'severity': 'LOW',
          'acknowledgeable': false,
          'time': 0,
          'epicsType': '',
          'user': '',
          'wake': null,
        },
        {
          'device': 'B',
          'source': 'ANALOG',
          'state': 'LATCHED',
          'severity': 'HIGH',
          'acknowledgeable': true,
          'time': 1,
          'epicsType': '',
          'user': '',
          'wake': 2,
        },
      ]);

      expect(alarms.map((a) => a.device), equals(['A', 'B']));
      expect(alarms[1].state, equals(AlarmState.latched));
    });

    test('decodes an empty list', () {
      expect(decode.alarmsFromList([]), isEmpty);
    });
  });

  // -------------------------------------------------------------------------
  // Plot configurations
  // -------------------------------------------------------------------------

  group('plot configurations', () {
    final configJson = jsonEncode({
      'xMin': -5.0,
      'isScalar': false,
      'dataLimit': 1024,
      'readingMode': 'array_as_time_series',
    });

    Map<String, dynamic> configRow(int id, String name) => {
      'configId': id,
      'configName': name,
      'config': configJson,
    };

    test('firstPlotConfig returns null for no rows', () {
      expect(decode.firstPlotConfig([]), isNull);
    });

    test('firstPlotConfig decodes the first row', () {
      final s = decode.firstPlotConfig([
        configRow(12, 'Linac'),
        configRow(13, 'Booster'),
      ])!;

      expect(s.configurationId, equals(PlotConfigId.fromInt(12)));
      expect(s.configurationName, equals('Linac'));
      expect(s.xMin, equals(-5.0));
      expect(s.isScalar, isFalse);
      expect(s.dataLimit, equals(1024));
      expect(s.readingMode, equals(ReadingMode.arrayAsTimeSeries));
    });

    test('plotListings decodes IDs and names', () {
      final listings = decode.plotListings([
        configRow(1, 'One'),
        configRow(2, 'Two'),
      ]);

      expect(
        listings.map((l) => l.configurationId),
        equals([PlotConfigId.fromInt(1), PlotConfigId.fromInt(2)]),
      );
      expect(listings.map((l) => l.configurationName), equals(['One', 'Two']));
    });

    test('lastUserConfig returns null when nothing was saved', () {
      expect(decode.lastUserConfig(null), isNull);
    });

    test('lastUserConfig decodes a JSON string', () {
      final s = decode.lastUserConfig(configJson)!;

      expect(s.configurationId, isNotNull);
      expect(s.configurationName, isEmpty);
      expect(s.dataLimit, equals(1024));
    });

    test('lastUserConfig rejects a non-string value', () {
      expect(
        () => decode.lastUserConfig(42),
        _gqlError('usersLastConfiguration'),
      );
    });
  });
}
