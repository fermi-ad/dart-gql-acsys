// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/plot_configs.ast.gql.dart'
    as _i5;
import 'package:dart_gql_acsys/src/schema/__generated__/plot_configs.data.gql.dart'
    as _i2;
import 'package:dart_gql_acsys/src/schema/__generated__/plot_configs.var.gql.dart'
    as _i3;
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'plot_configs.req.gql.g.dart';

abstract class GPlotConfigsReq
    implements
        Built<GPlotConfigsReq, GPlotConfigsReqBuilder>,
        _i1.OperationRequest<_i2.GPlotConfigsData, _i3.GPlotConfigsVars> {
  GPlotConfigsReq._();

  factory GPlotConfigsReq([void Function(GPlotConfigsReqBuilder b) updates]) =
      _$GPlotConfigsReq;

  static void _initializeBuilder(GPlotConfigsReqBuilder b) =>
      b
        ..operation = _i4.Operation(
          document: _i5.document,
          operationName: 'PlotConfigs',
        )
        ..executeOnListen = true;

  @override
  _i3.GPlotConfigsVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
    operation: operation,
    variables: vars.toJson(),
    context: context ?? const _i4.Context(),
  );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GPlotConfigsData? Function(_i2.GPlotConfigsData?, _i2.GPlotConfigsData?)?
  get updateResult;
  @override
  _i2.GPlotConfigsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GPlotConfigsData? parseData(Map<String, dynamic> json) =>
      _i2.GPlotConfigsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GPlotConfigsData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GPlotConfigsData, _i3.GPlotConfigsVars>
  transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GPlotConfigsReq> get serializer =>
      _$gPlotConfigsReqSerializer;

  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GPlotConfigsReq.serializer, this)
          as Map<String, dynamic>);

  static GPlotConfigsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPlotConfigsReq.serializer, json);
}
