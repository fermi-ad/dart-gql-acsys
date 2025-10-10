// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/DPM.schema.gql.dart'
    as _i1;
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i2;

part 'set_users_config.var.gql.g.dart';

abstract class GSetUsersConfigVars
    implements Built<GSetUsersConfigVars, GSetUsersConfigVarsBuilder> {
  GSetUsersConfigVars._();

  factory GSetUsersConfigVars([
    void Function(GSetUsersConfigVarsBuilder b) updates,
  ]) = _$GSetUsersConfigVars;

  _i1.GPlotConfigurationSnapshotIn get cfg;
  static Serializer<GSetUsersConfigVars> get serializer =>
      _$gSetUsersConfigVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GSetUsersConfigVars.serializer, this)
          as Map<String, dynamic>);

  static GSetUsersConfigVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GSetUsersConfigVars.serializer, json);
}
