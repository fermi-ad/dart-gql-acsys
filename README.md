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

To stream device readings (outdoor temperature, for instance) do this:

```dart
```