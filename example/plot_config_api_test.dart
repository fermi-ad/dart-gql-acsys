// This example exercises the plot configuration API end-to-end:
//   1. Verifies the test config name is not already present.
//   2. Saves a new configuration and captures the returned (ID-stamped) copy.
//   3. Retrieves the configuration by ID and compares it to the saved copy.
//   4. Removes the configuration.
//   5. Verifies the configuration is no longer listed.

import 'dart:io';
import 'package:dart_gql_acsys/dart_gql_acsys.dart';

const _testName = r'$API TEST$';

final _service = ACSysService(jwt: Platform.environment['DART_JWT']);

void _check(bool condition, String message) {
  if (!condition) {
    print('FAIL: $message');
    exit(1);
  }
  print('PASS: $message');
}

Future<void> main() async {
  try {
    // -------------------------------------------------------------------------
    // Step 1: Verify the test config name is not already present.
    // -------------------------------------------------------------------------

    var listings = await _service.listPlotConfigurations();
    final alreadyExists = listings.any((l) => l.configurationName == _testName);

    _check(!alreadyExists, '"$_testName" is not in the initial listing');

    // -------------------------------------------------------------------------
    // Step 2: Save a new configuration and capture the returned copy (which
    //         will have a server-assigned ID stamped in).
    // -------------------------------------------------------------------------

    final toSave = PlotConfigurationSnapshot(
      configurationName: _testName,
      channels: {
        'M:OUTTMP': ChannelSettingSnapshot(
          markerIndex: 2,
          yMin: -10.0,
          yMax: 110.0,
        ),
      },
      xMin: -0.5,
      xMax: 0.5,
      timeDelta: 0.1,
      isShowLabels: true,
      isScalar: false,
      isOneShot: false,
      dataLimit: 4096,
    );

    final saved = await _service.savePlotConfiguration(snapshot: toSave);

    _check(
      saved.configurationId != null,
      'savePlotConfiguration() returned a config with a non-null ID',
    );
    _check(
      saved.configurationName == _testName,
      'Saved config has the expected name "$_testName"',
    );

    final savedId = saved.configurationId!;

    // -------------------------------------------------------------------------
    // Step 3: Retrieve the configuration by ID and compare it to the saved copy.
    // -------------------------------------------------------------------------

    final retrieved = await _service.retrievePlotConfiguration(
      configurationId: savedId,
    );

    _check(retrieved != null, 'retrievePlotConfiguration() returned non-null');

    _check(
      retrieved!.configurationId?.compareTo(savedId) == 0,
      'Retrieved config ID matches the saved ID (${savedId.value})',
    );
    _check(
      retrieved.configurationName == saved.configurationName,
      'Retrieved config name matches: "${retrieved.configurationName}"',
    );
    _check(
      retrieved.xMin == saved.xMin,
      'Retrieved xMin matches: ${retrieved.xMin}',
    );
    _check(
      retrieved.xMax == saved.xMax,
      'Retrieved xMax matches: ${retrieved.xMax}',
    );
    _check(
      retrieved.timeDelta == saved.timeDelta,
      'Retrieved timeDelta matches: ${retrieved.timeDelta}',
    );
    _check(
      retrieved.dataLimit == saved.dataLimit,
      'Retrieved dataLimit matches: ${retrieved.dataLimit}',
    );
    _check(
      retrieved.isShowLabels == saved.isShowLabels,
      'Retrieved isShowLabels matches: ${retrieved.isShowLabels}',
    );
    _check(
      retrieved.isScalar == saved.isScalar,
      'Retrieved isScalar matches: ${retrieved.isScalar}',
    );
    _check(
      retrieved.isOneShot == saved.isOneShot,
      'Retrieved isOneShot matches: ${retrieved.isOneShot}',
    );
    _check(
      retrieved.channels.containsKey('M:OUTTMP'),
      'Retrieved config contains channel "M:OUTTMP"',
    );

    final ch = retrieved.channels['M:OUTTMP']!;
    final savedCh = saved.channels['M:OUTTMP']!;

    _check(
      ch.markerIndex == savedCh.markerIndex,
      'Channel markerIndex matches: ${ch.markerIndex}',
    );
    _check(ch.yMin == savedCh.yMin, 'Channel yMin matches: ${ch.yMin}');
    _check(ch.yMax == savedCh.yMax, 'Channel yMax matches: ${ch.yMax}');

    // -------------------------------------------------------------------------
    // Step 4: Remove the configuration.
    // -------------------------------------------------------------------------

    await _service.removePlotConfiguration(configurationId: savedId);
    print('PASS: removePlotConfiguration() completed without error');

    // -------------------------------------------------------------------------
    // Step 5: Verify the configuration is no longer listed.
    // -------------------------------------------------------------------------

    listings = await _service.listPlotConfigurations();
    final stillExists = listings.any((l) => l.configurationName == _testName);

    _check(
      !stillExists,
      '"$_testName" is no longer in the listing after removal',
    );

    print('\nAll checks passed.');
  } catch (e, st) {
    print('exception: $e');
    print(st);
    exit(1);
  }

  exit(0);
}
