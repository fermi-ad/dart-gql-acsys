// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    as _i2;

part 'start_plot.data.gql.g.dart';

abstract class GStartPlotData
    implements Built<GStartPlotData, GStartPlotDataBuilder> {
  GStartPlotData._();

  factory GStartPlotData([void Function(GStartPlotDataBuilder b) updates]) =
      _$GStartPlotData;

  static void _initializeBuilder(GStartPlotDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GStartPlotData_startPlot get startPlot;
  static Serializer<GStartPlotData> get serializer =>
      _$gStartPlotDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GStartPlotData.serializer, this)
          as Map<String, dynamic>);

  static GStartPlotData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStartPlotData.serializer, json);
}

abstract class GStartPlotData_startPlot
    implements
        Built<GStartPlotData_startPlot, GStartPlotData_startPlotBuilder> {
  GStartPlotData_startPlot._();

  factory GStartPlotData_startPlot([
    void Function(GStartPlotData_startPlotBuilder b) updates,
  ]) = _$GStartPlotData_startPlot;

  static void _initializeBuilder(GStartPlotData_startPlotBuilder b) =>
      b..G__typename = 'PlotReplyData';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get plotId;
  double get timestamp;
  double? get triggerTimestamp;
  BuiltList<GStartPlotData_startPlot_data> get data;
  static Serializer<GStartPlotData_startPlot> get serializer =>
      _$gStartPlotDataStartPlotSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GStartPlotData_startPlot.serializer, this)
          as Map<String, dynamic>);

  static GStartPlotData_startPlot? fromJson(Map<String, dynamic> json) => _i1
      .serializers
      .deserializeWith(GStartPlotData_startPlot.serializer, json);
}

abstract class GStartPlotData_startPlot_data
    implements
        Built<
          GStartPlotData_startPlot_data,
          GStartPlotData_startPlot_dataBuilder
        > {
  GStartPlotData_startPlot_data._();

  factory GStartPlotData_startPlot_data([
    void Function(GStartPlotData_startPlot_dataBuilder b) updates,
  ]) = _$GStartPlotData_startPlot_data;

  static void _initializeBuilder(GStartPlotData_startPlot_dataBuilder b) =>
      b..G__typename = 'PlotChannelData';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get channelRate;
  String get channelUnits;
  int get channelStatus;
  BuiltList<GStartPlotData_startPlot_data_channelData> get channelData;
  static Serializer<GStartPlotData_startPlot_data> get serializer =>
      _$gStartPlotDataStartPlotDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStartPlotData_startPlot_data.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStartPlotData_startPlot_data? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStartPlotData_startPlot_data.serializer,
        json,
      );
}

abstract class GStartPlotData_startPlot_data_channelData
    implements
        Built<
          GStartPlotData_startPlot_data_channelData,
          GStartPlotData_startPlot_data_channelDataBuilder
        > {
  GStartPlotData_startPlot_data_channelData._();

  factory GStartPlotData_startPlot_data_channelData([
    void Function(GStartPlotData_startPlot_data_channelDataBuilder b) updates,
  ]) = _$GStartPlotData_startPlot_data_channelData;

  static void _initializeBuilder(
    GStartPlotData_startPlot_data_channelDataBuilder b,
  ) => b..G__typename = 'DataInfo';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double get timestamp;
  GStartPlotData_startPlot_data_channelData_result get result;
  static Serializer<GStartPlotData_startPlot_data_channelData> get serializer =>
      _$gStartPlotDataStartPlotDataChannelDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStartPlotData_startPlot_data_channelData.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStartPlotData_startPlot_data_channelData? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStartPlotData_startPlot_data_channelData.serializer,
    json,
  );
}

abstract class GStartPlotData_startPlot_data_channelData_result {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GStartPlotData_startPlot_data_channelData_result>
  get serializer => _i2.InlineFragmentSerializer<
    GStartPlotData_startPlot_data_channelData_result
  >(
    'GStartPlotData_startPlot_data_channelData_result',
    GStartPlotData_startPlot_data_channelData_result__base,
    {
      'Scalar': GStartPlotData_startPlot_data_channelData_result__asScalar,
      'ScalarArray':
          GStartPlotData_startPlot_data_channelData_result__asScalarArray,
    },
  );

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStartPlotData_startPlot_data_channelData_result.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStartPlotData_startPlot_data_channelData_result? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStartPlotData_startPlot_data_channelData_result.serializer,
    json,
  );
}

abstract class GStartPlotData_startPlot_data_channelData_result__base
    implements
        Built<
          GStartPlotData_startPlot_data_channelData_result__base,
          GStartPlotData_startPlot_data_channelData_result__baseBuilder
        >,
        GStartPlotData_startPlot_data_channelData_result {
  GStartPlotData_startPlot_data_channelData_result__base._();

  factory GStartPlotData_startPlot_data_channelData_result__base([
    void Function(
      GStartPlotData_startPlot_data_channelData_result__baseBuilder b,
    )
    updates,
  ]) = _$GStartPlotData_startPlot_data_channelData_result__base;

  static void _initializeBuilder(
    GStartPlotData_startPlot_data_channelData_result__baseBuilder b,
  ) => b..G__typename = 'DataType';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GStartPlotData_startPlot_data_channelData_result__base>
  get serializer =>
      _$gStartPlotDataStartPlotDataChannelDataResultBaseSerializer;

  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStartPlotData_startPlot_data_channelData_result__base.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStartPlotData_startPlot_data_channelData_result__base? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStartPlotData_startPlot_data_channelData_result__base.serializer,
    json,
  );
}

abstract class GStartPlotData_startPlot_data_channelData_result__asScalar
    implements
        Built<
          GStartPlotData_startPlot_data_channelData_result__asScalar,
          GStartPlotData_startPlot_data_channelData_result__asScalarBuilder
        >,
        GStartPlotData_startPlot_data_channelData_result {
  GStartPlotData_startPlot_data_channelData_result__asScalar._();

  factory GStartPlotData_startPlot_data_channelData_result__asScalar([
    void Function(
      GStartPlotData_startPlot_data_channelData_result__asScalarBuilder b,
    )
    updates,
  ]) = _$GStartPlotData_startPlot_data_channelData_result__asScalar;

  static void _initializeBuilder(
    GStartPlotData_startPlot_data_channelData_result__asScalarBuilder b,
  ) => b..G__typename = 'Scalar';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double get scalarValue;
  static Serializer<GStartPlotData_startPlot_data_channelData_result__asScalar>
  get serializer =>
      _$gStartPlotDataStartPlotDataChannelDataResultAsScalarSerializer;

  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStartPlotData_startPlot_data_channelData_result__asScalar
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStartPlotData_startPlot_data_channelData_result__asScalar? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStartPlotData_startPlot_data_channelData_result__asScalar.serializer,
    json,
  );
}

abstract class GStartPlotData_startPlot_data_channelData_result__asScalarArray
    implements
        Built<
          GStartPlotData_startPlot_data_channelData_result__asScalarArray,
          GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder
        >,
        GStartPlotData_startPlot_data_channelData_result {
  GStartPlotData_startPlot_data_channelData_result__asScalarArray._();

  factory GStartPlotData_startPlot_data_channelData_result__asScalarArray([
    void Function(
      GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder b,
    )
    updates,
  ]) = _$GStartPlotData_startPlot_data_channelData_result__asScalarArray;

  static void _initializeBuilder(
    GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder b,
  ) => b..G__typename = 'ScalarArray';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<double> get scalarArrayValue;
  static Serializer<
    GStartPlotData_startPlot_data_channelData_result__asScalarArray
  >
  get serializer =>
      _$gStartPlotDataStartPlotDataChannelDataResultAsScalarArraySerializer;

  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStartPlotData_startPlot_data_channelData_result__asScalarArray
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStartPlotData_startPlot_data_channelData_result__asScalarArray?
  fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
    GStartPlotData_startPlot_data_channelData_result__asScalarArray.serializer,
    json,
  );
}
