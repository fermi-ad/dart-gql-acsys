// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/read_devices.ast.gql.dart'
    as _i5;
import 'package:dart_gql_acsys/src/schema/__generated__/read_devices.data.gql.dart'
    as _i2;
import 'package:dart_gql_acsys/src/schema/__generated__/read_devices.var.gql.dart'
    as _i3;
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'read_devices.req.gql.g.dart';

abstract class GReadDevicesReq
    implements
        Built<GReadDevicesReq, GReadDevicesReqBuilder>,
        _i1.OperationRequest<_i2.GReadDevicesData, _i3.GReadDevicesVars> {
  GReadDevicesReq._();

  factory GReadDevicesReq([void Function(GReadDevicesReqBuilder b) updates]) =
      _$GReadDevicesReq;

  static void _initializeBuilder(GReadDevicesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'ReadDevices',
    )
    ..executeOnListen = true;

  @override
  _i3.GReadDevicesVars get vars;
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
  _i2.GReadDevicesData? Function(_i2.GReadDevicesData?, _i2.GReadDevicesData?)?
  get updateResult;
  @override
  _i2.GReadDevicesData? get optimisticResponse;
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
  _i2.GReadDevicesData? parseData(Map<String, dynamic> json) =>
      _i2.GReadDevicesData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GReadDevicesData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GReadDevicesData, _i3.GReadDevicesVars>
  transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GReadDevicesReq> get serializer =>
      _$gReadDevicesReqSerializer;

  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GReadDevicesReq.serializer, this)
          as Map<String, dynamic>);

  static GReadDevicesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GReadDevicesReq.serializer, json);
}
