library;

extension type Status._(int code) {
  const Status.fromInt(int value) : code = value;

  int get facility => code ~/ 256;
  int get error => code & 255;

  bool get success => error >= 0;
  bool get warning => error > 0;
  bool get fatal => error < 0;

  // Global, predefined status codes.

  static const Status okay = Status.fromInt(0);
  static const Status noProperty = Status.fromInt(-6785);
}
