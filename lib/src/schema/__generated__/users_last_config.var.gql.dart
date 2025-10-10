// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'users_last_config.var.gql.g.dart';

abstract class GUsersLastConfigVars
    implements Built<GUsersLastConfigVars, GUsersLastConfigVarsBuilder> {
  GUsersLastConfigVars._();

  factory GUsersLastConfigVars([
    void Function(GUsersLastConfigVarsBuilder b) updates,
  ]) = _$GUsersLastConfigVars;

  static Serializer<GUsersLastConfigVars> get serializer =>
      _$gUsersLastConfigVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUsersLastConfigVars.serializer, this)
          as Map<String, dynamic>);

  static GUsersLastConfigVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUsersLastConfigVars.serializer, json);
}
