import 'status.dart';

// Declare an exception type that's specific to the ACSys API.

abstract class ACSysException implements Exception {
  final String message;

  const ACSysException(this.message);

  @override
  String toString() => message;
}

class ACSysInvArgException extends ACSysException {
  const ACSysInvArgException(String message) : super("InvArg: $message");
}

class ACSysTypeException extends ACSysException {
  const ACSysTypeException(String message) : super("Type: $message");
}

class ACSysConfigurationException extends ACSysException {
  const ACSysConfigurationException(String message) : super("Config: $message");
}

class ACSysGraphQLException extends ACSysException {
  const ACSysGraphQLException(String message) : super("GraphQL: $message");
}

class ACSysStatusException extends ACSysException {
  final Status status;

  ACSysStatusException(String message, {required this.status})
    : super("ACNET status: [${status.facility} ${status.error}]");
}
