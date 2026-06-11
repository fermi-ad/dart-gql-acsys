// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/remove_plot_config.ast.gql.dart'
    as _i5;
import 'package:dart_gql_acsys/src/schema/__generated__/remove_plot_config.data.gql.dart'
    as _i2;
import 'package:dart_gql_acsys/src/schema/__generated__/remove_plot_config.var.gql.dart'
    as _i3;
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'remove_plot_config.req.gql.g.dart';

abstract class GDeletePlotConfigReq
    implements
        Built<GDeletePlotConfigReq, GDeletePlotConfigReqBuilder>,
        _i1.OperationRequest<
          _i2.GDeletePlotConfigData,
          _i3.GDeletePlotConfigVars
        > {
  GDeletePlotConfigReq._();

  factory GDeletePlotConfigReq([
    void Function(GDeletePlotConfigReqBuilder b) updates,
  ]) = _$GDeletePlotConfigReq;

  static void _initializeBuilder(GDeletePlotConfigReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'DeletePlotConfig',
    )
    ..executeOnListen = true;

  @override
  _i3.GDeletePlotConfigVars get vars;
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
  _i2.GDeletePlotConfigData? Function(
    _i2.GDeletePlotConfigData?,
    _i2.GDeletePlotConfigData?,
  )?
  get updateResult;
  @override
  _i2.GDeletePlotConfigData? get optimisticResponse;
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
  _i2.GDeletePlotConfigData? parseData(Map<String, dynamic> json) =>
      _i2.GDeletePlotConfigData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GDeletePlotConfigData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GDeletePlotConfigData, _i3.GDeletePlotConfigVars>
  transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GDeletePlotConfigReq> get serializer =>
      _$gDeletePlotConfigReqSerializer;

  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GDeletePlotConfigReq.serializer, this)
          as Map<String, dynamic>);

  static GDeletePlotConfigReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GDeletePlotConfigReq.serializer, json);
}
