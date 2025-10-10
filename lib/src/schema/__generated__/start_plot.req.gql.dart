// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:dart_gql_acsys/src/schema/__generated__/start_plot.ast.gql.dart'
    as _i5;
import 'package:dart_gql_acsys/src/schema/__generated__/start_plot.data.gql.dart'
    as _i2;
import 'package:dart_gql_acsys/src/schema/__generated__/start_plot.var.gql.dart'
    as _i3;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'start_plot.req.gql.g.dart';

abstract class GStartPlotReq
    implements
        Built<GStartPlotReq, GStartPlotReqBuilder>,
        _i1.OperationRequest<_i2.GStartPlotData, _i3.GStartPlotVars> {
  GStartPlotReq._();

  factory GStartPlotReq([void Function(GStartPlotReqBuilder b) updates]) =
      _$GStartPlotReq;

  static void _initializeBuilder(GStartPlotReqBuilder b) =>
      b
        ..operation = _i4.Operation(
          document: _i5.document,
          operationName: 'StartPlot',
        )
        ..executeOnListen = true;

  @override
  _i3.GStartPlotVars get vars;
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
  _i2.GStartPlotData? Function(_i2.GStartPlotData?, _i2.GStartPlotData?)?
  get updateResult;
  @override
  _i2.GStartPlotData? get optimisticResponse;
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
  _i2.GStartPlotData? parseData(Map<String, dynamic> json) =>
      _i2.GStartPlotData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GStartPlotData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GStartPlotData, _i3.GStartPlotVars>
  transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GStartPlotReq> get serializer => _$gStartPlotReqSerializer;

  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GStartPlotReq.serializer, this)
          as Map<String, dynamic>);

  static GStartPlotReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GStartPlotReq.serializer, json);
}
