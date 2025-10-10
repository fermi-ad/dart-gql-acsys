// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'plot_configs.var.gql.g.dart';

abstract class GPlotConfigsVars
    implements Built<GPlotConfigsVars, GPlotConfigsVarsBuilder> {
  GPlotConfigsVars._();

  factory GPlotConfigsVars([void Function(GPlotConfigsVarsBuilder b) updates]) =
      _$GPlotConfigsVars;

  int? get id;
  static Serializer<GPlotConfigsVars> get serializer =>
      _$gPlotConfigsVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPlotConfigsVars.serializer, this)
          as Map<String, dynamic>);

  static GPlotConfigsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPlotConfigsVars.serializer, json);
}
