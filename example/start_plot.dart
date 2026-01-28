// This example starts a plot request for the outdoor temperature. The
// data is collected as 1 Hz.

import 'package:dart_gql_acsys/dart_gql_acsys.dart';

Future<void> main() async {
  final strm = ACSysService().startPlot(["M:OUTTMP"], updateRate: 10000);

  try {
    // Wait for each reply packet.

    await for (final reply in strm) {
      // A packet may contain data for multiple devices. Loop through
      // each device.

      for (final data in reply.data) {
        // For a given device, loop through its data points.

        for (final point in data.points) {
          print("${point.t}, ${point.value.toDouble()}");
        }
      }
    }
  } catch (e) {
    print("exception: $e");
  }
}
