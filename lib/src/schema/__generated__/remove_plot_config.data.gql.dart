// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'remove_plot_config.data.gql.g.dart';

abstract class GDeletePlotConfigData
    implements Built<GDeletePlotConfigData, GDeletePlotConfigDataBuilder> {
  GDeletePlotConfigData._();

  factory GDeletePlotConfigData([
    void Function(GDeletePlotConfigDataBuilder b) updates,
  ]) = _$GDeletePlotConfigData;

  static void _initializeBuilder(GDeletePlotConfigDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GDeletePlotConfigData_deletePlotConfiguration get deletePlotConfiguration;
  static Serializer<GDeletePlotConfigData> get serializer =>
      _$gDeletePlotConfigDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GDeletePlotConfigData.serializer, this)
          as Map<String, dynamic>);

  static GDeletePlotConfigData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GDeletePlotConfigData.serializer, json);
}

abstract class GDeletePlotConfigData_deletePlotConfiguration
    implements
        Built<
          GDeletePlotConfigData_deletePlotConfiguration,
          GDeletePlotConfigData_deletePlotConfigurationBuilder
        > {
  GDeletePlotConfigData_deletePlotConfiguration._();

  factory GDeletePlotConfigData_deletePlotConfiguration([
    void Function(GDeletePlotConfigData_deletePlotConfigurationBuilder b)
    updates,
  ]) = _$GDeletePlotConfigData_deletePlotConfiguration;

  static void _initializeBuilder(
    GDeletePlotConfigData_deletePlotConfigurationBuilder b,
  ) => b..G__typename = 'StatusReply';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get status;
  static Serializer<GDeletePlotConfigData_deletePlotConfiguration>
  get serializer => _$gDeletePlotConfigDataDeletePlotConfigurationSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GDeletePlotConfigData_deletePlotConfiguration.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GDeletePlotConfigData_deletePlotConfiguration? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GDeletePlotConfigData_deletePlotConfiguration.serializer,
    json,
  );
}
