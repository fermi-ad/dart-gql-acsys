/// Tests for the [ACSysServiceAPI] contract using a fully in-memory fake.
///
/// [FakeACSysService] stores state in plain Dart collections and returns
/// canned responses. This lets us verify that callers interact with the
/// interface correctly without touching the network.
library;

import 'package:test/test.dart';
import 'package:dart_gql_acsys/dart_gql_acsys.dart';

// ---------------------------------------------------------------------------
// Fake implementation
// ---------------------------------------------------------------------------

final class FakeACSysService implements ACSysServiceAPI {
  // In-memory store for plot configurations, keyed by ID.
  final Map<int, PlotConfigurationSnapshot> _configs = {};
  int _nextId = 1;

  // The user's last saved configuration (raw snapshot, no ID/name required).
  PlotConfigurationSnapshot? _userConfig;

  // Canned device readings returned by readDevices / monitorDevices.
  List<Reading> cannedReadings = [];

  // Canned status returned by submit / sendCommand.
  Status cannedStatus = Status.SUCCESS;

  // Canned alarms returned by getAlarmsSnapshot.
  List<Alarm> cannedAlarms = [];

  @override
  Future<List<Reading>> readDevices(List<String> devices) async =>
      List.of(cannedReadings);

  @override
  Stream<Reading> monitorDevices(List<String> drfs) =>
      Stream.fromIterable(cannedReadings);

  @override
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
    int? sampleOnEvent,
    String? chXAxis,
  }) => const Stream.empty();

  @override
  Future<Status> submit({
    required String forDRF,
    required DeviceValue newSetting,
  }) async => cannedStatus;

  @override
  Future<Status> sendCommand({
    required String toDRF,
    required String value,
  }) async => cannedStatus;

  @override
  Future<PlotConfigurationSnapshot> savePlotConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) async {
    final id = snapshot.configurationId?.value ?? _nextId++;
    final saved = snapshot.withId(PlotConfigId.fromInt(id));

    _configs[id] = saved;
    return saved;
  }

  @override
  Future<PlotConfigurationSnapshot?> retrievePlotConfiguration({
    required PlotConfigId configurationId,
  }) async => _configs[configurationId.value];

  @override
  Future<List<PlotConfigurationListing>> listPlotConfigurations() async =>
      _configs.values
          .map(
            (s) => PlotConfigurationListing(
              configurationId: s.configurationId,
              configurationName: s.configurationName,
            ),
          )
          .toList();

  @override
  Future<void> removePlotConfiguration({
    required PlotConfigId configurationId,
  }) async => _configs.remove(configurationId.value);

  @override
  Future<PlotConfigurationSnapshot?> retrieveLastUserConfiguration() async =>
      _userConfig;

  @override
  Future<void> saveUserConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) async => _userConfig = snapshot;

  @override
  Future<List<Alarm>> getAlarmsSnapshot() async => List.of(cannedAlarms);
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

PlotConfigurationSnapshot _makeSnapshot({String name = 'Config', int? id}) =>
    PlotConfigurationSnapshot(
      configurationId: id != null ? PlotConfigId.fromInt(id) : null,
      configurationName: name,
      channels: {},
      isShowLabels: true,
      isScalar: true,
      isOneShot: false,
      dataLimit: 1024,
    );

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late FakeACSysService svc;

  setUp(() => svc = FakeACSysService());

  // -------------------------------------------------------------------------
  // readDevices
  // -------------------------------------------------------------------------

  group('readDevices', () {
    test('returns canned readings', () async {
      final ts = DateTime.fromMicrosecondsSinceEpoch(0);

      svc.cannedReadings = [
        Reading(refId: 0, timestamp: ts, value: DevScalar(1.0)),
        Reading(refId: 1, timestamp: ts, value: DevText('hi')),
      ];

      final result = await svc.readDevices(['M:A', 'M:B']);

      expect(result.length, equals(2));
      expect(result[0].refId, equals(0));
      expect(result[0].value, equals(DevScalar(1.0)));
      expect(result[1].value, equals(DevText('hi')));
    });

    test('returns empty list when no canned readings', () async {
      final result = await svc.readDevices(['M:A']);

      expect(result, isEmpty);
    });
  });

  // -------------------------------------------------------------------------
  // monitorDevices
  // -------------------------------------------------------------------------

  group('monitorDevices', () {
    test('emits canned readings as a stream', () async {
      final ts = DateTime.fromMicrosecondsSinceEpoch(0);

      svc.cannedReadings = [
        Reading(refId: 0, timestamp: ts, value: DevScalar(42.0)),
      ];

      final readings = await svc.monitorDevices(['M:A']).toList();

      expect(readings.length, equals(1));
      expect(readings[0].value, equals(DevScalar(42.0)));
    });
  });

  // -------------------------------------------------------------------------
  // submit / sendCommand
  // -------------------------------------------------------------------------

  group('submit', () {
    test('returns canned SUCCESS status', () async {
      final status = await svc.submit(
        forDRF: 'M:OUTTMP.SETTING',
        newSetting: DevScalar(25.0),
      );

      expect(status, equals(Status.SUCCESS));
    });

    test('returns canned error status', () async {
      svc.cannedStatus = Status.DPM_NO_SUCH_PROP;
      final status = await svc.submit(
        forDRF: 'M:BOGUS.SETTING',
        newSetting: DevScalar(0.0),
      );

      expect(status, equals(Status.DPM_NO_SUCH_PROP));
    });
  });

  group('sendCommand', () {
    test('returns canned status', () async {
      final status = await svc.sendCommand(toDRF: 'M:DEV.CONTROL', value: 'ON');

      expect(status, equals(Status.SUCCESS));
    });
  });

  // -------------------------------------------------------------------------
  // savePlotConfiguration
  // -------------------------------------------------------------------------

  group('savePlotConfiguration', () {
    test('assigns an ID to a new snapshot', () async {
      final snap = _makeSnapshot(name: 'New');

      expect(snap.configurationId, isNull);

      final saved = await svc.savePlotConfiguration(snapshot: snap);

      expect(saved.configurationId, isNotNull);
      expect(saved.configurationName, equals('New'));
    });

    test('preserves an existing ID on update', () async {
      final snap = _makeSnapshot(name: 'Existing', id: 99);

      final saved = await svc.savePlotConfiguration(snapshot: snap);

      expect(saved.configurationId?.value, equals(99));
    });

    test('assigns sequential IDs to multiple new snapshots', () async {
      final a = await svc.savePlotConfiguration(
        snapshot: _makeSnapshot(name: 'A'),
      );
      final b = await svc.savePlotConfiguration(
        snapshot: _makeSnapshot(name: 'B'),
      );

      expect(a.configurationId?.value, isNot(equals(b.configurationId?.value)));
    });
  });

  // -------------------------------------------------------------------------
  // retrievePlotConfiguration
  // -------------------------------------------------------------------------

  group('retrievePlotConfiguration', () {
    test('returns null for unknown ID', () async {
      final result = await svc.retrievePlotConfiguration(
        configurationId: PlotConfigId.fromInt(999),
      );

      expect(result, isNull);
    });

    test('returns the saved snapshot by ID', () async {
      final snap = _makeSnapshot(name: 'Retrieve me');
      final saved = await svc.savePlotConfiguration(snapshot: snap);
      final id = saved.configurationId!;
      final retrieved = await svc.retrievePlotConfiguration(
        configurationId: id,
      );

      expect(retrieved, isNotNull);
      expect(retrieved!.configurationName, equals('Retrieve me'));
      expect(retrieved.configurationId?.value, equals(id.value));
    });
  });

  // -------------------------------------------------------------------------
  // listPlotConfigurations
  // -------------------------------------------------------------------------

  group('listPlotConfigurations', () {
    test('returns empty list when no configs saved', () async {
      final list = await svc.listPlotConfigurations();

      expect(list, isEmpty);
    });

    test('lists all saved configurations', () async {
      await svc.savePlotConfiguration(snapshot: _makeSnapshot(name: 'Alpha'));
      await svc.savePlotConfiguration(snapshot: _makeSnapshot(name: 'Beta'));
      await svc.savePlotConfiguration(snapshot: _makeSnapshot(name: 'Gamma'));

      final list = await svc.listPlotConfigurations();

      expect(list.length, equals(3));
      expect(
        list.map((l) => l.configurationName),
        containsAll(['Alpha', 'Beta', 'Gamma']),
      );
    });

    test('each listing carries a valid ID', () async {
      await svc.savePlotConfiguration(snapshot: _makeSnapshot());

      final list = await svc.listPlotConfigurations();

      for (final entry in list) {
        expect(entry.configurationId, isNotNull);
      }
    });
  });

  // -------------------------------------------------------------------------
  // removePlotConfiguration
  // -------------------------------------------------------------------------

  group('removePlotConfiguration', () {
    test('removes an existing configuration', () async {
      final snap = _makeSnapshot(name: 'To delete');
      final saved = await svc.savePlotConfiguration(snapshot: snap);
      final id = saved.configurationId!;

      await svc.removePlotConfiguration(configurationId: id);

      final retrieved = await svc.retrievePlotConfiguration(
        configurationId: id,
      );

      expect(retrieved, isNull);
    });

    test('removing a non-existent ID is a no-op', () async {
      await svc.savePlotConfiguration(snapshot: _makeSnapshot(name: 'Keep'));

      // Should not throw.
      await svc.removePlotConfiguration(
        configurationId: PlotConfigId.fromInt(999),
      );

      final list = await svc.listPlotConfigurations();

      expect(list.length, equals(1));
    });

    test('list shrinks after removal', () async {
      final a = await svc.savePlotConfiguration(
        snapshot: _makeSnapshot(name: 'A'),
      );

      await svc.savePlotConfiguration(snapshot: _makeSnapshot(name: 'B'));
      await svc.removePlotConfiguration(configurationId: a.configurationId!);

      final list = await svc.listPlotConfigurations();

      expect(list.length, equals(1));
      expect(list.first.configurationName, equals('B'));
    });
  });

  // -------------------------------------------------------------------------
  // retrieveLastUserConfiguration / saveUserConfiguration
  // -------------------------------------------------------------------------

  group('user configuration', () {
    test(
      'retrieveLastUserConfiguration returns null before any save',
      () async {
        final result = await svc.retrieveLastUserConfiguration();

        expect(result, isNull);
      },
    );

    test('saveUserConfiguration persists and retrieve returns it', () async {
      final snap = _makeSnapshot(name: 'User config');

      await svc.saveUserConfiguration(snapshot: snap);

      final retrieved = await svc.retrieveLastUserConfiguration();

      expect(retrieved, isNotNull);
      expect(retrieved!.configurationName, equals('User config'));
    });

    test('saveUserConfiguration overwrites the previous user config', () async {
      await svc.saveUserConfiguration(snapshot: _makeSnapshot(name: 'First'));
      await svc.saveUserConfiguration(snapshot: _makeSnapshot(name: 'Second'));

      final retrieved = await svc.retrieveLastUserConfiguration();

      expect(retrieved!.configurationName, equals('Second'));
    });
  });
}
