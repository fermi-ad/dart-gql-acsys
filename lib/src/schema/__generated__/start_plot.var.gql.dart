// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'start_plot.var.gql.g.dart';

abstract class GStartPlotVars
    implements Built<GStartPlotVars, GStartPlotVarsBuilder> {
  GStartPlotVars._();

  factory GStartPlotVars([void Function(GStartPlotVarsBuilder b) updates]) =
      _$GStartPlotVars;

  BuiltList<String> get drfList;
  double? get xMin;
  double? get xMax;
  int? get windowSize;
  int? get updateDelay;
  int? get nAcquisitions;
  int? get triggerEvent;
  double? get startTime;
  double? get endTime;
  static Serializer<GStartPlotVars> get serializer =>
      _$gStartPlotVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GStartPlotVars.serializer, this)
          as Map<String, dynamic>);

  static GStartPlotVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStartPlotVars.serializer, json);
}
