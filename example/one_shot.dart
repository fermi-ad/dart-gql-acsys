// This example reads and prints the latest outdoor temperature and
// humidity readings.

import 'package:dart_gql_acsys/dart_gql_acsys.dart';

Future<void> main() async {
  try {
    // Send the request to read the temperature and humidity. We use
    // pattern-matching to deconstruct the return value into two local
    // variables.

    final [temp, humid] = await ACSysService(
      port: 8001,
    ).readDevices(["M:OUTTMP", "G:HUMID"]);

    print("Temperature: ${temp.value.toDouble()?.toStringAsFixed(1)} F");
    print("   Humidity: ${humid.value.toDouble()?.toStringAsFixed(1)} %");
  } catch (e) {
    print("exception: $e");
  }
}
