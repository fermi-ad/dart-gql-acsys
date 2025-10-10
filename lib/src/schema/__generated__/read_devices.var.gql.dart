// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'read_devices.var.gql.g.dart';

abstract class GReadDevicesVars
    implements Built<GReadDevicesVars, GReadDevicesVarsBuilder> {
  GReadDevicesVars._();

  factory GReadDevicesVars([void Function(GReadDevicesVarsBuilder b) updates]) =
      _$GReadDevicesVars;

  BuiltList<String> get devList;
  static Serializer<GReadDevicesVars> get serializer =>
      _$gReadDevicesVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReadDevicesVars.serializer, this)
          as Map<String, dynamic>);

  static GReadDevicesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReadDevicesVars.serializer, json);
}
