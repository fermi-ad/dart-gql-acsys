// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'DPM.schema.gql.g.dart';

abstract class GChannelSettingSnapshotIn
    implements
        Built<GChannelSettingSnapshotIn, GChannelSettingSnapshotInBuilder> {
  GChannelSettingSnapshotIn._();

  factory GChannelSettingSnapshotIn([
    void Function(GChannelSettingSnapshotInBuilder b) updates,
  ]) = _$GChannelSettingSnapshotIn;

  String get device;
  double? get yMin;
  double? get yMax;
  int? get lineColor;
  int? get markerIndex;
  static Serializer<GChannelSettingSnapshotIn> get serializer =>
      _$gChannelSettingSnapshotInSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GChannelSettingSnapshotIn.serializer, this)
          as Map<String, dynamic>);

  static GChannelSettingSnapshotIn? fromJson(Map<String, dynamic> json) => _i1
      .serializers
      .deserializeWith(GChannelSettingSnapshotIn.serializer, json);
}

abstract class GDevValue implements Built<GDevValue, GDevValueBuilder> {
  GDevValue._();

  factory GDevValue([void Function(GDevValueBuilder b) updates]) = _$GDevValue;

  int? get intVal;
  double? get scalarVal;
  BuiltList<double>? get scalarArrayVal;
  BuiltList<int>? get rawVal;
  String? get textVal;
  BuiltList<String>? get textArrayVal;
  BuiltList<GTimeSeriesEntryIn>? get timeSeriesVal;
  static Serializer<GDevValue> get serializer => _$gDevValueSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GDevValue.serializer, this)
          as Map<String, dynamic>);

  static GDevValue? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GDevValue.serializer, json);
}

abstract class GPlotConfigurationSnapshotIn
    implements
        Built<
          GPlotConfigurationSnapshotIn,
          GPlotConfigurationSnapshotInBuilder
        > {
  GPlotConfigurationSnapshotIn._();

  factory GPlotConfigurationSnapshotIn([
    void Function(GPlotConfigurationSnapshotInBuilder b) updates,
  ]) = _$GPlotConfigurationSnapshotIn;

  int? get configurationId;
  String get configurationName;
  BuiltList<GChannelSettingSnapshotIn> get channels;
  double? get xMin;
  double? get xMax;
  double? get startTime;
  double? get endTime;
  double? get timeDelta;
  bool get isScalar;
  bool get isOneShot;
  bool get isShowLabels;
  bool get isPersistent;
  int get dataLimit;
  int? get updateDelay;
  int? get nAcquisitions;
  int? get tclkEvent;
  static Serializer<GPlotConfigurationSnapshotIn> get serializer =>
      _$gPlotConfigurationSnapshotInSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GPlotConfigurationSnapshotIn.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GPlotConfigurationSnapshotIn? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPlotConfigurationSnapshotIn.serializer,
        json,
      );
}

abstract class GTimeSeriesEntryIn
    implements Built<GTimeSeriesEntryIn, GTimeSeriesEntryInBuilder> {
  GTimeSeriesEntryIn._();

  factory GTimeSeriesEntryIn([
    void Function(GTimeSeriesEntryInBuilder b) updates,
  ]) = _$GTimeSeriesEntryIn;

  double get stamp;
  double get value;
  static Serializer<GTimeSeriesEntryIn> get serializer =>
      _$gTimeSeriesEntryInSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GTimeSeriesEntryIn.serializer, this)
          as Map<String, dynamic>);

  static GTimeSeriesEntryIn? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GTimeSeriesEntryIn.serializer, json);
}

abstract class GXformAvgExpr
    implements Built<GXformAvgExpr, GXformAvgExprBuilder> {
  GXformAvgExpr._();

  factory GXformAvgExpr([void Function(GXformAvgExprBuilder b) updates]) =
      _$GXformAvgExpr;

  GXformExpr get expr;
  int get n;
  static Serializer<GXformAvgExpr> get serializer => _$gXformAvgExprSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GXformAvgExpr.serializer, this)
          as Map<String, dynamic>);

  static GXformAvgExpr? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GXformAvgExpr.serializer, json);
}

abstract class GXformDeviceExpr
    implements Built<GXformDeviceExpr, GXformDeviceExprBuilder> {
  GXformDeviceExpr._();

  factory GXformDeviceExpr([void Function(GXformDeviceExprBuilder b) updates]) =
      _$GXformDeviceExpr;

  String get device;
  static Serializer<GXformDeviceExpr> get serializer =>
      _$gXformDeviceExprSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GXformDeviceExpr.serializer, this)
          as Map<String, dynamic>);

  static GXformDeviceExpr? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GXformDeviceExpr.serializer, json);
}

abstract class GXformExpr implements Built<GXformExpr, GXformExprBuilder> {
  GXformExpr._();

  factory GXformExpr([void Function(GXformExprBuilder b) updates]) =
      _$GXformExpr;

  GXformDeviceExpr? get devEx;
  GXformAvgExpr? get avgEx;
  static Serializer<GXformExpr> get serializer => _$gXformExprSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GXformExpr.serializer, this)
          as Map<String, dynamic>);

  static GXformExpr? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GXformExpr.serializer, json);
}

abstract class GXformRequest
    implements Built<GXformRequest, GXformRequestBuilder> {
  GXformRequest._();

  factory GXformRequest([void Function(GXformRequestBuilder b) updates]) =
      _$GXformRequest;

  String get event;
  GXformExpr get expr;
  static Serializer<GXformRequest> get serializer => _$gXformRequestSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GXformRequest.serializer, this)
          as Map<String, dynamic>);

  static GXformRequest? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GXformRequest.serializer, json);
}

const Map<String, Set<String>> possibleTypesMap = {
  'DataType': {
    'StatusReply',
    'Scalar',
    'ScalarArray',
    'Raw',
    'Text',
    'TextArray',
    'TimeSeries',
    'StructData',
  },
};
