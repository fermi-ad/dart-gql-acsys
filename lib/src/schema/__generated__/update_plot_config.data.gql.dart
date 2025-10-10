// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'update_plot_config.data.gql.g.dart';

abstract class GUpdatePlotConfigData
    implements Built<GUpdatePlotConfigData, GUpdatePlotConfigDataBuilder> {
  GUpdatePlotConfigData._();

  factory GUpdatePlotConfigData([
    void Function(GUpdatePlotConfigDataBuilder b) updates,
  ]) = _$GUpdatePlotConfigData;

  static void _initializeBuilder(GUpdatePlotConfigDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get updatePlotConfiguration;
  static Serializer<GUpdatePlotConfigData> get serializer =>
      _$gUpdatePlotConfigDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUpdatePlotConfigData.serializer, this)
          as Map<String, dynamic>);

  static GUpdatePlotConfigData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUpdatePlotConfigData.serializer, json);
}
