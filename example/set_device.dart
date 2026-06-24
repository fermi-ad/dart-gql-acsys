// This example reads and prints the latest outdoor temperature and
// humidity readings.

import 'dart:io';
import 'package:dart_gql_acsys/dart_gql_acsys.dart';

final _service = ACSysService(jwt: Platform.environment['DART_JWT']);

Future<double> readAmanda() async => (await _service.readDevices([
  "G:AMANDA.SETTING",
])).whereType<Reading>().first.value.toDouble()!;

Future<Status> setAmanda(double newVal) async =>
    _service.submit(forDRF: "G:AMANDA.SETTING", newSetting: newVal.toDevVal());

Future<void> main() async {
  try {
    var val = await readAmanda();

    print("Current value: $val");

    print("Setting to ${val + 1.0}");

    final status = await setAmanda(val + 1.0);

    if (status.success) {
      val = await readAmanda();

      print("New current value: $val");
    } else {
      print("Set failed with status code ${status.toStr()}");
    }
  } catch (e) {
    print("exception: $e");
  }

  exit(0);
}
