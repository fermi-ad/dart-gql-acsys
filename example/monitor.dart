// This example sets up a subscription to receive the outdoor temperature
// readings forever.

import 'dart:io';
import 'package:dart_gql_acsys/dart_gql_acsys.dart';

final DateTime yesterday = DateTime.now().toLocal().subtract(
  Duration(hours: 1),
);
final DateTime tomorrow = DateTime.now().toLocal().add(Duration(hours: 1));

Future<void> main() async {
  try {
    final strm = ACSysService().monitorDevices(
      ["M:OUTTMP", "G:HUMID"],
      startTime: yesterday,
      endTime: tomorrow,
    );

    // Perform the loop each time we recive a new packet. For each reply,
    // use pattern-matching to determine the data's representation.

    await for (final reply in strm) {
      switch (reply) {
        // If we received a reading, print it.

        case Reading(
          refId: 0,
          timestamp: final stamp,
          value: DevScalar(value: final val),
        ):
          print(
            "Reading: ${stamp.toIso8601String()} : ${val.toStringAsFixed(1)} F",
          );

        case Reading(
          refId: 1,
          timestamp: final stamp,
          value: DevScalar(value: final val),
        ):
          print(
            "Reading: ${stamp.toIso8601String()} : ${val.toStringAsFixed(1)} %",
          );

        // If we received a status, there was a problem with the device.

        case Reading(refId: 0, value: final DevStatusCode val):
          print("Status: temperature error : $val");

        case Reading(refId: 1, value: final DevStatusCode val):
          print("Status: humidity error : $val");

        // We shouldn't get any other reply types. But since there are
        // other device value types, we add a `default` case so the
        // compiler doesn't complain.)

        default:
          print("unexpected reply: $reply");
      }
    }
  } catch (e) {
    print("exception: $e");
  }

  exit(0);
}
