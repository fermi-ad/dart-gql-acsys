// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_gql_acsys/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'plot_configs.data.gql.g.dart';

abstract class GPlotConfigsData
    implements Built<GPlotConfigsData, GPlotConfigsDataBuilder> {
  GPlotConfigsData._();

  factory GPlotConfigsData([void Function(GPlotConfigsDataBuilder b) updates]) =
      _$GPlotConfigsData;

  static void _initializeBuilder(GPlotConfigsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPlotConfigsData_plotConfiguration> get plotConfiguration;
  static Serializer<GPlotConfigsData> get serializer =>
      _$gPlotConfigsDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPlotConfigsData.serializer, this)
          as Map<String, dynamic>);

  static GPlotConfigsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPlotConfigsData.serializer, json);
}

abstract class GPlotConfigsData_plotConfiguration
    implements
        Built<
          GPlotConfigsData_plotConfiguration,
          GPlotConfigsData_plotConfigurationBuilder
        > {
  GPlotConfigsData_plotConfiguration._();

  factory GPlotConfigsData_plotConfiguration([
    void Function(GPlotConfigsData_plotConfigurationBuilder b) updates,
  ]) = _$GPlotConfigsData_plotConfiguration;

  static void _initializeBuilder(GPlotConfigsData_plotConfigurationBuilder b) =>
      b..G__typename = 'PlotConfigurationSnapshot';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get configurationId;
  String get configurationName;
  BuiltList<GPlotConfigsData_plotConfiguration_channels> get channels;
  double? get xMin;
  double? get xMax;
  double? get startTime;
  double? get endTime;
  double? get timeDelta;
  bool get isScalar;
  bool get isOneShot;
  bool get isShowLabels;
  int? get updateDelay;
  int? get nAcquisitions;
  int? get tclkEvent;
  bool get isPersistent;
  int get dataLimit;
  static Serializer<GPlotConfigsData_plotConfiguration> get serializer =>
      _$gPlotConfigsDataPlotConfigurationSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GPlotConfigsData_plotConfiguration.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GPlotConfigsData_plotConfiguration? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GPlotConfigsData_plotConfiguration.serializer,
    json,
  );
}

abstract class GPlotConfigsData_plotConfiguration_channels
    implements
        Built<
          GPlotConfigsData_plotConfiguration_channels,
          GPlotConfigsData_plotConfiguration_channelsBuilder
        > {
  GPlotConfigsData_plotConfiguration_channels._();

  factory GPlotConfigsData_plotConfiguration_channels([
    void Function(GPlotConfigsData_plotConfiguration_channelsBuilder b) updates,
  ]) = _$GPlotConfigsData_plotConfiguration_channels;

  static void _initializeBuilder(
    GPlotConfigsData_plotConfiguration_channelsBuilder b,
  ) => b..G__typename = 'ChannelSettingSnapshot';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get device;
  double? get yMin;
  double? get yMax;
  int? get lineColor;
  int? get markerIndex;
  static Serializer<GPlotConfigsData_plotConfiguration_channels>
  get serializer => _$gPlotConfigsDataPlotConfigurationChannelsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GPlotConfigsData_plotConfiguration_channels.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GPlotConfigsData_plotConfiguration_channels? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GPlotConfigsData_plotConfiguration_channels.serializer,
    json,
  );
}
