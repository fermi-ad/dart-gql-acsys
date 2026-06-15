import 'dart:convert';

import 'package:test/test.dart';
import 'package:pure_dart_ui/pure_dart_ui.dart';
import 'package:dart_gql_acsys/dart_gql_acsys.dart';

void main() {
  // ---------------------------------------------------------------------------
  // ChannelSettingSnapshot
  // ---------------------------------------------------------------------------

  group('ChannelSettingSnapshot', () {
    test('fromJson round-trips all fields', () {
      final original = ChannelSettingSnapshot(
        lineColor: const Color(0xFF112233),
        markerIndex: 3,
        yMin: -10.0,
        yMax: 100.0,
      );

      final json = original.toJson();
      final restored = ChannelSettingSnapshot.fromJson(json);

      expect(restored.lineColor?.value, equals(0xFF112233));
      expect(restored.markerIndex, equals(3));
      expect(restored.yMin, equals(-10.0));
      expect(restored.yMax, equals(100.0));
    });

    test('fromJson tolerates missing fields', () {
      final ch = ChannelSettingSnapshot.fromJson({});

      expect(ch.lineColor, isNull);
      expect(ch.markerIndex, isNull);
      expect(ch.yMin, isNull);
      expect(ch.yMax, isNull);
    });

    test('fromJson tolerates wrong-typed fields', () {
      final ch = ChannelSettingSnapshot.fromJson({
        'lineColor': 'not-an-int',
        'markerIndex': 'also-not-an-int',
        'yMin': 'nope',
        'yMax': true,
      });

      expect(ch.lineColor, isNull);
      expect(ch.markerIndex, isNull);
      expect(ch.yMin, isNull);
      expect(ch.yMax, isNull);
    });

    test('toJson preserves null fields', () {
      final json = const ChannelSettingSnapshot().toJson();

      expect(json['lineColor'], isNull);
      expect(json['markerIndex'], isNull);
      expect(json['yMin'], isNull);
      expect(json['yMax'], isNull);
    });
  });

  // ---------------------------------------------------------------------------
  // PlotConfigurationListing
  // ---------------------------------------------------------------------------

  group('PlotConfigurationListing', () {
    test('fromJson parses id and name', () {
      final listing = PlotConfigurationListing.fromJson({
        'id': 42,
        'name': 'My Config',
      });

      expect(listing.configurationId?.value, equals(42));
      expect(listing.configurationName, equals('My Config'));
    });

    test('fromJson throws on missing id', () {
      expect(
        () => PlotConfigurationListing.fromJson({'name': 'No ID'}),
        throwsA(isA<ACSysConfigurationException>()),
      );
    });

    test('fromJson throws on missing name', () {
      expect(
        () => PlotConfigurationListing.fromJson({'id': 1}),
        throwsA(isA<ACSysConfigurationException>()),
      );
    });

    test('fromJson throws on empty map', () {
      expect(
        () => PlotConfigurationListing.fromJson({}),
        throwsA(isA<ACSysConfigurationException>()),
      );
    });
  });

  // ---------------------------------------------------------------------------
  // PlotConfigurationSnapshot — JSON round-trip
  // ---------------------------------------------------------------------------

  group('PlotConfigurationSnapshot', () {
    PlotConfigurationSnapshot makeSnapshot({int? id, String name = 'Test'}) =>
        PlotConfigurationSnapshot(
          configurationId: id != null ? PlotConfigId.fromInt(id) : null,
          configurationName: name,
          channels: {
            'M:OUTTMP': ChannelSettingSnapshot(
              lineColor: const Color(0xFFAABBCC),
              markerIndex: 1,
              yMin: 0.0,
              yMax: 50.0,
            ),
            'M:BEAM': const ChannelSettingSnapshot(),
          },
          xMin: -1.0,
          xMax: 1.0,
          timeDelta: 0.5,
          startTime: 1000.0,
          endTime: 2000.0,
          isShowLabels: true,
          isScalar: false,
          isOneShot: true,
          isPersistent: false,
          isBlink: true,
          updateDelay: 100,
          nAcquisitions: 5,
          tclkEvent: 0x0F,
          sampleOnEvent: 2,
          acquisitionMode: AcquisitionMode.repetitivePeriodic,
          readingMode: ReadingMode.arrayAsTimeSeries,
          xAxis: 'M:XAXIS',
          dataLimit: 1024,
          waveformDuration: 3.14,
        );

    test('toJson / fromJson round-trip preserves all scalar fields', () {
      final original = makeSnapshot(id: 7, name: 'Round-trip');
      final json = original.toJson();
      final restored = PlotConfigurationSnapshot.fromJson(
        PlotConfigId.fromInt(7),
        'Round-trip',
        json,
      );

      expect(restored.configurationId?.value, equals(7));
      expect(restored.configurationName, equals('Round-trip'));
      expect(restored.xMin, equals(-1.0));
      expect(restored.xMax, equals(1.0));
      expect(restored.timeDelta, equals(0.5));
      expect(restored.startTime, equals(1000.0));
      expect(restored.endTime, equals(2000.0));
      expect(restored.isShowLabels, isTrue);
      expect(restored.isScalar, isFalse);
      expect(restored.isOneShot, isTrue);
      expect(restored.isPersistent, isFalse);
      expect(restored.isBlink, isTrue);
      expect(restored.updateDelay, equals(100));
      expect(restored.nAcquisitions, equals(5));
      expect(restored.tclkEvent, equals(0x0F));
      expect(restored.sampleOnEvent, equals(2));
      expect(
        restored.acquisitionMode,
        equals(AcquisitionMode.repetitivePeriodic),
      );
      expect(restored.readingMode, equals(ReadingMode.arrayAsTimeSeries));
      expect(restored.xAxis, equals('M:XAXIS'));
      expect(restored.dataLimit, equals(1024));
      expect(restored.waveformDuration, closeTo(3.14, 1e-9));
    });

    test('toJson / fromJson round-trip preserves channels map', () {
      final original = makeSnapshot(id: 1);
      final json = original.toJson();
      final restored = PlotConfigurationSnapshot.fromJson(
        PlotConfigId.fromInt(1),
        'Test',
        json,
      );

      expect(restored.channels.keys, containsAll(['M:OUTTMP', 'M:BEAM']));

      final ch = restored.channels['M:OUTTMP']!;

      expect(ch.lineColor?.value, equals(0xFFAABBCC));
      expect(ch.markerIndex, equals(1));
      expect(ch.yMin, equals(0.0));
      expect(ch.yMax, equals(50.0));

      final beam = restored.channels['M:BEAM']!;

      expect(beam.lineColor, isNull);
    });

    test('fromJson applies sensible defaults for missing fields', () {
      final snap = PlotConfigurationSnapshot.fromJson(
        PlotConfigId.fromInt(99),
        'Defaults',
        {},
      );

      expect(snap.isShowLabels, isTrue);
      expect(snap.isScalar, isTrue);
      expect(snap.isOneShot, isFalse);
      expect(snap.isPersistent, isFalse);
      expect(snap.isBlink, isFalse);
      expect(snap.dataLimit, equals(32768));
      expect(snap.channels, isEmpty);
      expect(snap.xMin, isNull);
      expect(snap.acquisitionMode, isNull);
      expect(snap.readingMode, isNull);
    });

    test('JSON encodes cleanly through dart:convert', () {
      final snap = makeSnapshot(id: 3, name: 'Encode test');
      final encoded = jsonEncode(snap.toJson());
      final decoded = jsonDecode(encoded) as Map<String, dynamic>;

      // Verify the outer structure survives a full JSON encode/decode cycle.
      expect(decoded['isShowLabels'], isTrue);
      expect(decoded['dataLimit'], equals(1024));
      expect((decoded['channels'] as Map).keys, contains('M:OUTTMP'));
    });

    test('PlotConfigId comparison works', () {
      final a = PlotConfigId.fromInt(1);
      final b = PlotConfigId.fromInt(2);
      final a2 = PlotConfigId.fromInt(1);

      expect(a.compareTo(a2), equals(0));
      expect(a.compareTo(b), lessThan(0));
      expect(b.compareTo(a), greaterThan(0));
    });

    test('PlotConfigId.generate produces unique IDs', () {
      final ids = List.generate(10, (_) => PlotConfigId.generate().value);

      expect(ids.toSet().length, equals(10));
    });
  });
}
