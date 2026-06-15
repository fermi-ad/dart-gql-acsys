// This example sets up a subscription to receive the outdoor temperature
// readings forever.

import 'dart:io';
import 'package:dart_gql_acsys/dart_gql_acsys.dart';

const units = ["F", "%"];

Future<void> main() async {
  final strm = ACSysService().monitorDevices(["M:OUTTMP", "G:HUMID"]);

  try {
    // Perform the loop each time we recive a new packet. For each reply,
    // use pattern-matching to determine the data's representation.

    await for (final reply in strm) {
      switch (reply) {
        // If we received a reading, print it.

        case Reading(refId: final refId, value: DevScalar(value: final val)):
          print(
            "Reading: [$refId] = ${val.toStringAsFixed(1)} ${units[refId]}",
          );

        // If we received a status, there was a problem with the device.

        case Reading(refId: final refId, value: final DevStatusCode val):
          print("Status: [$refId] = $val");

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
