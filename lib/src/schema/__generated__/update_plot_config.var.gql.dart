// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/DPM.schema.gql.dart'
    as _i1;
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i2;

part 'update_plot_config.var.gql.g.dart';

abstract class GUpdatePlotConfigVars
    implements Built<GUpdatePlotConfigVars, GUpdatePlotConfigVarsBuilder> {
  GUpdatePlotConfigVars._();

  factory GUpdatePlotConfigVars([
    void Function(GUpdatePlotConfigVarsBuilder b) updates,
  ]) = _$GUpdatePlotConfigVars;

  _i1.GPlotConfigurationSnapshotIn get cfg;
  static Serializer<GUpdatePlotConfigVars> get serializer =>
      _$gUpdatePlotConfigVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GUpdatePlotConfigVars.serializer, this)
          as Map<String, dynamic>);

  static GUpdatePlotConfigVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GUpdatePlotConfigVars.serializer, json);
}
