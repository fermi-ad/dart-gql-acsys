// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:dart_gql_acsys/src/schema/__generated__/set_device.ast.gql.dart'
    as _i5;
import 'package:dart_gql_acsys/src/schema/__generated__/set_device.data.gql.dart'
    as _i2;
import 'package:dart_gql_acsys/src/schema/__generated__/set_device.var.gql.dart'
    as _i3;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'set_device.req.gql.g.dart';

abstract class GSetDeviceReq
    implements
        Built<GSetDeviceReq, GSetDeviceReqBuilder>,
        _i1.OperationRequest<_i2.GSetDeviceData, _i3.GSetDeviceVars> {
  GSetDeviceReq._();

  factory GSetDeviceReq([void Function(GSetDeviceReqBuilder b) updates]) =
      _$GSetDeviceReq;

  static void _initializeBuilder(GSetDeviceReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'SetDevice',
    )
    ..executeOnListen = true;

  @override
  _i3.GSetDeviceVars get vars;
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
  _i2.GSetDeviceData? Function(_i2.GSetDeviceData?, _i2.GSetDeviceData?)?
  get updateResult;
  @override
  _i2.GSetDeviceData? get optimisticResponse;
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
  _i2.GSetDeviceData? parseData(Map<String, dynamic> json) =>
      _i2.GSetDeviceData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GSetDeviceData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GSetDeviceData, _i3.GSetDeviceVars>
  transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GSetDeviceReq> get serializer => _$gSetDeviceReqSerializer;

  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GSetDeviceReq.serializer, this)
          as Map<String, dynamic>);

  static GSetDeviceReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GSetDeviceReq.serializer, json);
}
