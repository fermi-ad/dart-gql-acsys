# dart-gql-acsys

This package allows Dart programs to access the Fermilab ACSys API.

Dart programs can use the `ACSysService` class to make requests to the
Fermilab control system as well as stream real-time device data. Flutter
applications should use the `flutter-gql-acsys` package, which depends
on this package.

## Getting started

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  dart_gql_acsys:
    git:
      url: https://github.com/fermi-ad/dart-gql-acsys.git
      ref: main

```

## Usage

This is a simple example to read the outdoor temperature once every 10 seconds.

### Create a Command-Line Dart Project

```shell
$ dart create -t cli my_demo
$ cd my_demo
```

Update `pubspec.yaml` with the dependency mentioned about. Replace `lib/main.dart` with this:

```dart
import 'package:dart_gql_acsys/dart_gql_acsys.dart';

void main() async {
  // Create a stream of readings. Specify M:OUTTMP being read once
  // every 10 seconds.

  final strm = ACSysService().monitorDevices(["M:OUTTMP@p,10000"]);

  // It's an asynchronous stream, so we use an 'await for-loop'.

  await for (final reply in strm) {
    // Pattern match the result. We expect a `Reading` with a `refId`
    // of 0 and the `value` field to have a scalar value.

    if (reply case Reading(refId: 0, value: DevScalar(value: final val))) {
      // Print the value to 1 significant digit to the right of
      // the decimal point.

      print("Reading: ${val.toStringAsFixed(1)} F");
    } else {
      print("unexpected reply: $reply");
    }
  }
}
```

### Run the Code

```shell
$ dart run
```

Enjoy the outdoor temperature!