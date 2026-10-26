// This example starts a plot request for the outdoor temperature. The
// data is collected as 1 Hz.

import 'dart:io';

import 'package:dart_gql_acsys/dart_gql_acsys.dart';

Future<void> main() async {
  final strm = ACSysService().startPlot(["G:HUMID"], updateRate: 10000);

  try {
    // Wait for each reply packet.

    await for (final reply in strm) {
      // A packet may contain data for multiple devices. Loop through
      // each device.

      for (final data in reply.data) {
        // For a given device, loop through its data points. Samples are
        // stored column-wise: `t[i]` is the timestamp of `y[i]`.

        switch (data.series) {
          case ScalarSeries(:final t, :final y):
            for (var ii = 0; ii < t.length; ii++) {
              print("${t[ii]}, ${y[ii]}");
            }
          case ArraySeries(:final t, :final y):
            for (var ii = 0; ii < t.length; ii++) {
              print("${t[ii]}, ${y[ii]}");
            }
        }
      }
    }
  } catch (e) {
    print("exception: $e");
  }

  exit(0);
}
