// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'set_users_config.data.gql.g.dart';

abstract class GSetUsersConfigData
    implements Built<GSetUsersConfigData, GSetUsersConfigDataBuilder> {
  GSetUsersConfigData._();

  factory GSetUsersConfigData([
    void Function(GSetUsersConfigDataBuilder b) updates,
  ]) = _$GSetUsersConfigData;

  static void _initializeBuilder(GSetUsersConfigDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GSetUsersConfigData_usersConfiguration get usersConfiguration;
  static Serializer<GSetUsersConfigData> get serializer =>
      _$gSetUsersConfigDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GSetUsersConfigData.serializer, this)
          as Map<String, dynamic>);

  static GSetUsersConfigData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GSetUsersConfigData.serializer, json);
}

abstract class GSetUsersConfigData_usersConfiguration
    implements
        Built<
          GSetUsersConfigData_usersConfiguration,
          GSetUsersConfigData_usersConfigurationBuilder
        > {
  GSetUsersConfigData_usersConfiguration._();

  factory GSetUsersConfigData_usersConfiguration([
    void Function(GSetUsersConfigData_usersConfigurationBuilder b) updates,
  ]) = _$GSetUsersConfigData_usersConfiguration;

  static void _initializeBuilder(
    GSetUsersConfigData_usersConfigurationBuilder b,
  ) => b..G__typename = 'StatusReply';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get status;
  static Serializer<GSetUsersConfigData_usersConfiguration> get serializer =>
      _$gSetUsersConfigDataUsersConfigurationSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSetUsersConfigData_usersConfiguration.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSetUsersConfigData_usersConfiguration? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GSetUsersConfigData_usersConfiguration.serializer,
    json,
  );
}
