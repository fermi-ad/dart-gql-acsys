// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/DPM.schema.gql.dart'
    as _i1;
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i2;

part 'set_device.var.gql.g.dart';

abstract class GSetDeviceVars
    implements Built<GSetDeviceVars, GSetDeviceVarsBuilder> {
  GSetDeviceVars._();

  factory GSetDeviceVars([void Function(GSetDeviceVarsBuilder b) updates]) =
      _$GSetDeviceVars;

  String get device;
  _i1.GDevValue get value;
  static Serializer<GSetDeviceVars> get serializer =>
      _$gSetDeviceVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GSetDeviceVars.serializer, this)
          as Map<String, dynamic>);

  static GSetDeviceVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GSetDeviceVars.serializer, json);
}
