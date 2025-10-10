// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'users_last_config.data.gql.g.dart';

abstract class GUsersLastConfigData
    implements Built<GUsersLastConfigData, GUsersLastConfigDataBuilder> {
  GUsersLastConfigData._();

  factory GUsersLastConfigData([
    void Function(GUsersLastConfigDataBuilder b) updates,
  ]) = _$GUsersLastConfigData;

  static void _initializeBuilder(GUsersLastConfigDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUsersLastConfigData_usersLastConfiguration? get usersLastConfiguration;
  static Serializer<GUsersLastConfigData> get serializer =>
      _$gUsersLastConfigDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUsersLastConfigData.serializer, this)
          as Map<String, dynamic>);

  static GUsersLastConfigData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUsersLastConfigData.serializer, json);
}

abstract class GUsersLastConfigData_usersLastConfiguration
    implements
        Built<
          GUsersLastConfigData_usersLastConfiguration,
          GUsersLastConfigData_usersLastConfigurationBuilder
        > {
  GUsersLastConfigData_usersLastConfiguration._();

  factory GUsersLastConfigData_usersLastConfiguration([
    void Function(GUsersLastConfigData_usersLastConfigurationBuilder b) updates,
  ]) = _$GUsersLastConfigData_usersLastConfiguration;

  static void _initializeBuilder(
    GUsersLastConfigData_usersLastConfigurationBuilder b,
  ) => b..G__typename = 'PlotConfigurationSnapshot';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get configurationId;
  String get configurationName;
  BuiltList<GUsersLastConfigData_usersLastConfiguration_channels> get channels;
  double? get xMin;
  double? get xMax;
  double? get startTime;
  double? get endTime;
  double? get timeDelta;
  bool get isScalar;
  bool get isOneShot;
  bool get isShowLabels;
  int? get updateDelay;
  int? get nAcquisitions;
  int? get tclkEvent;
  bool get isPersistent;
  int get dataLimit;
  static Serializer<GUsersLastConfigData_usersLastConfiguration>
  get serializer => _$gUsersLastConfigDataUsersLastConfigurationSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GUsersLastConfigData_usersLastConfiguration.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GUsersLastConfigData_usersLastConfiguration? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GUsersLastConfigData_usersLastConfiguration.serializer,
    json,
  );
}

abstract class GUsersLastConfigData_usersLastConfiguration_channels
    implements
        Built<
          GUsersLastConfigData_usersLastConfiguration_channels,
          GUsersLastConfigData_usersLastConfiguration_channelsBuilder
        > {
  GUsersLastConfigData_usersLastConfiguration_channels._();

  factory GUsersLastConfigData_usersLastConfiguration_channels([
    void Function(GUsersLastConfigData_usersLastConfiguration_channelsBuilder b)
    updates,
  ]) = _$GUsersLastConfigData_usersLastConfiguration_channels;

  static void _initializeBuilder(
    GUsersLastConfigData_usersLastConfiguration_channelsBuilder b,
  ) => b..G__typename = 'ChannelSettingSnapshot';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get device;
  double? get yMin;
  double? get yMax;
  int? get lineColor;
  int? get markerIndex;
  static Serializer<GUsersLastConfigData_usersLastConfiguration_channels>
  get serializer =>
      _$gUsersLastConfigDataUsersLastConfigurationChannelsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GUsersLastConfigData_usersLastConfiguration_channels.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GUsersLastConfigData_usersLastConfiguration_channels? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GUsersLastConfigData_usersLastConfiguration_channels.serializer,
    json,
  );
}
