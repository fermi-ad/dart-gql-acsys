// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'remove_plot_config.var.gql.g.dart';

abstract class GDeletePlotConfigVars
    implements Built<GDeletePlotConfigVars, GDeletePlotConfigVarsBuilder> {
  GDeletePlotConfigVars._();

  factory GDeletePlotConfigVars([
    void Function(GDeletePlotConfigVarsBuilder b) updates,
  ]) = _$GDeletePlotConfigVars;

  int get id;
  static Serializer<GDeletePlotConfigVars> get serializer =>
      _$gDeletePlotConfigVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GDeletePlotConfigVars.serializer, this)
          as Map<String, dynamic>);

  static GDeletePlotConfigVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GDeletePlotConfigVars.serializer, json);
}
