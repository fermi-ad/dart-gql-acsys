import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_gql_acsys/dart_gql_acsys.dart';
import 'package:test/test.dart';

const _timestamp = '2026-01-02T03:04:05.123Z';

void main() {
  group('BlmBeamLine GraphQL mappings', () {
    final mappings = <BlmBeamLine, String>{
      BlmBeamLine.unspecified: 'BEAM_LINE_UNSPECIFIED',
      BlmBeamLine.linac: 'BEAM_LINE_LINAC',
      BlmBeamLine.linac2: 'BEAM_LINE_LINAC2',
      BlmBeamLine.beamLine400mev: 'BEAM_LINE_400MEV',
      BlmBeamLine.btl: 'BEAM_LINE_BTL',
      BlmBeamLine.booster: 'BEAM_LINE_BOOSTER',
      BlmBeamLine.beamLine8gev: 'BEAM_LINE_8GEV',
      BlmBeamLine.mainInjector: 'BEAM_LINE_MAIN_INJECTOR',
      BlmBeamLine.recycler: 'BEAM_LINE_RECYCLER',
      BlmBeamLine.p1: 'BEAM_LINE_P1',
      BlmBeamLine.p2: 'BEAM_LINE_P2',
      BlmBeamLine.p3: 'BEAM_LINE_P3',
      BlmBeamLine.m1: 'BEAM_LINE_M1',
      BlmBeamLine.m2: 'BEAM_LINE_M2',
      BlmBeamLine.m3: 'BEAM_LINE_M3',
      BlmBeamLine.m4: 'BEAM_LINE_M4',
      BlmBeamLine.m5: 'BEAM_LINE_M5',
      BlmBeamLine.deliveryRing: 'BEAM_LINE_DELIVERY_RING',
    };

    test('serializes and deserializes every beam line', () {
      expect(mappings, hasLength(18));
      for (final entry in mappings.entries) {
        expect(entry.key.graphqlName, equals(entry.value));
        expect(blmBeamLineFromGraphQL(entry.value), equals(entry.key));
      }
    });

    test('rejects unknown enum literals', () {
      expect(
        () => blmBeamLineFromGraphQL('BEAM_LINE_UNKNOWN'),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('BLM model parsing', () {
    test('parses a complete loss-ratio sample', () {
      final sample = BlmLossRatioSample.fromJson({
        'ratios': [
          {
            'deviceData': {
              'device': 'B:BLM01',
              'metadata': {'devicePlotLabel': 'BLM 01'},
            },
            'integratedLoss': 12,
            'lossLimit': 100,
            'ratio': 0.12,
            'timestamp': _timestamp,
            'status': {'facilityCode': 1, 'statusCode': 2, 'message': 'OK'},
          },
        ],
      });

      expect(sample.ratios, hasLength(1));
      final ratio = sample.ratios.single;
      expect(ratio.deviceData!.device, equals('B:BLM01'));
      expect(ratio.deviceData!.metadata!.devicePlotLabel, equals('BLM 01'));
      expect(ratio.integratedLoss, equals(12));
      expect(ratio.lossLimit, equals(100));
      expect(ratio.ratio, equals(0.12));
      expect(ratio.timestamp, equals(DateTime.parse(_timestamp)));
      expect(ratio.status!.message, equals('OK'));
    });

    test('parses nullable fields and numeric ratio values', () {
      final ratio = BlmDeviceLossRatio.fromJson({
        'deviceData': null,
        'integratedLoss': 1.0,
        'lossLimit': 2.0,
        'ratio': 3,
        'timestamp': null,
        'status': null,
      });

      expect(ratio.deviceData, isNull);
      expect(ratio.integratedLoss, equals(1));
      expect(ratio.lossLimit, equals(2));
      expect(ratio.ratio, equals(3.0));
      expect(ratio.timestamp, isNull);
      expect(ratio.status, isNull);
    });

    test('parses throughput samples and nullable beam line', () {
      final sample = BlmBeamThroughputSample.fromJson({
        'beamLine': null,
        'protonsPerPulse': 1,
        'protonsPerHour': 2,
        'protonsPerHourLimit': 3,
        'efficiencies': [
          {'tclkEvent': 4, 'efficiency': 5, 'protonsPerHour': 6},
        ],
      });

      expect(sample.beamLine, isNull);
      expect(sample.efficiencies.single.tclkEvent, equals(4));
      expect(sample.efficiencies.single.protonsPerHour, equals(6));
    });

    test('rejects malformed required fields', () {
      expect(
        () => BlmDevice.fromJson({'device': 42}),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => BlmLossRatioSample.fromJson({
          'ratios': [{}],
        }),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => BlmDeviceLossRatio.fromJson({
          'integratedLoss': 1,
          'lossLimit': 2,
          'ratio': 1,
          'timestamp': 'not-a-date',
        }),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('BlmService HTTP query', () {
    late HttpServer server;
    late BlmService service;

    setUp(() async {
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      service = BlmService(
        httpUrl: 'http://${server.address.host}:${server.port}/blm',
        wsUrl: 'ws://${server.address.host}:${server.port}/blm/s',
      );
    });

    tearDown(() async {
      await service.dispose();
      await server.close(force: true);
    });

    test('sends variables and parses integrated-loss devices', () async {
      final requestCompleter = Completer<Map<String, dynamic>>();
      server.listen((request) async {
        final body = await utf8.decoder.bind(request).join();
        requestCompleter.complete(jsonDecode(body) as Map<String, dynamic>);
        request.response
          ..headers.contentType = ContentType.json
          ..write(
            jsonEncode({
              'data': {
                '__typename': 'Query',
                'integratedLossDevices': [
                  {
                    '__typename': 'BlmDevice',
                    'device': 'B:BLM01',
                    'metadata': {
                      '__typename': 'BlmDeviceMetadata',
                      'devicePlotLabel': 'BLM 01',
                    },
                  },
                ],
              },
            }),
          )
          ..close();
      });

      final devices = await service.integratedLossDevices(
        beamLine: BlmBeamLine.booster,
        tclkEvent: 7,
      );
      final request = await requestCompleter.future;

      expect(
        request['variables'],
        equals({'beamLine': 'BEAM_LINE_BOOSTER', 'tclkEvent': 7}),
      );
      expect(request['query'], contains('integratedLossDevices'));
      expect(devices.single.device, equals('B:BLM01'));
      expect(devices.single.metadata!.devicePlotLabel, equals('BLM 01'));
    });

    test('converts GraphQL errors to ACSysGraphQLException', () async {
      server.listen((request) {
        request.response
          ..headers.contentType = ContentType.json
          ..write(
            jsonEncode({
              'errors': [
                {'message': 'resolver failed'},
              ],
            }),
          )
          ..close();
      });

      expect(
        () => service.integratedLossDevices(
          beamLine: BlmBeamLine.booster,
          tclkEvent: 0,
        ),
        throwsA(
          isA<ACSysGraphQLException>().having(
            (error) => error.message,
            'message',
            contains('resolver failed'),
          ),
        ),
      );
    });

    test('rejects malformed root response data', () async {
      server.listen((request) {
        request.response
          ..headers.contentType = ContentType.json
          ..write(
            jsonEncode({
              'data': {'integratedLossDevices': null},
            }),
          )
          ..close();
      });

      expect(
        () => service.integratedLossDevices(
          beamLine: BlmBeamLine.booster,
          tclkEvent: 0,
        ),
        throwsA(isA<ACSysGraphQLException>()),
      );
    });
  });

  group('BlmService validation and disposal', () {
    late BlmService service;

    setUp(() {
      service = BlmService(
        httpUrl: 'http://127.0.0.1:1/blm',
        wsUrl: 'ws://127.0.0.1:1/blm/s',
      );
    });

    tearDown(() => service.dispose());

    test('rejects invalid tclk events before network access', () {
      expect(
        () => service.integratedLossDevices(
          beamLine: BlmBeamLine.booster,
          tclkEvent: -1,
        ),
        throwsA(isA<ACSysInvArgException>()),
      );
      expect(
        () => service.lossRatios(
          beamLine: BlmBeamLine.booster,
          tclkEvent: 256,
          sampleRateMs: 1,
        ),
        throwsA(isA<ACSysInvArgException>()),
      );
    });

    test('rejects non-positive sample rates before network access', () {
      expect(
        () => service.lossRatios(
          beamLine: BlmBeamLine.booster,
          tclkEvent: 0,
          sampleRateMs: 0,
        ),
        throwsA(isA<ACSysInvArgException>()),
      );
      expect(
        () => service.beamThroughput(
          beamLine: BlmBeamLine.booster,
          sampleRateMs: -1,
        ),
        throwsA(isA<ACSysInvArgException>()),
      );
    });

    test('rejects use after disposal', () async {
      await service.dispose();
      expect(
        () => service.beamThroughput(
          beamLine: BlmBeamLine.booster,
          sampleRateMs: 1,
        ),
        throwsA(isA<StateError>()),
      );
      await service.dispose();
    });
  });
}
