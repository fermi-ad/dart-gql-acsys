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

part 'read_devices.data.gql.g.dart';

abstract class GReadDevicesData
    implements Built<GReadDevicesData, GReadDevicesDataBuilder> {
  GReadDevicesData._();

  factory GReadDevicesData([void Function(GReadDevicesDataBuilder b) updates]) =
      _$GReadDevicesData;

  static void _initializeBuilder(GReadDevicesDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GReadDevicesData_acceleratorData> get acceleratorData;
  static Serializer<GReadDevicesData> get serializer =>
      _$gReadDevicesDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReadDevicesData.serializer, this)
          as Map<String, dynamic>);

  static GReadDevicesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReadDevicesData.serializer, json);
}

abstract class GReadDevicesData_acceleratorData
    implements
        Built<
          GReadDevicesData_acceleratorData,
          GReadDevicesData_acceleratorDataBuilder
        > {
  GReadDevicesData_acceleratorData._();

  factory GReadDevicesData_acceleratorData([
    void Function(GReadDevicesData_acceleratorDataBuilder b) updates,
  ]) = _$GReadDevicesData_acceleratorData;

  static void _initializeBuilder(GReadDevicesData_acceleratorDataBuilder b) =>
      b..G__typename = 'DataReply';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get refId;
  BuiltList<GReadDevicesData_acceleratorData_data> get data;
  static Serializer<GReadDevicesData_acceleratorData> get serializer =>
      _$gReadDevicesDataAcceleratorDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GReadDevicesData_acceleratorData.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GReadDevicesData_acceleratorData? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GReadDevicesData_acceleratorData.serializer,
    json,
  );
}

abstract class GReadDevicesData_acceleratorData_data
    implements
        Built<
          GReadDevicesData_acceleratorData_data,
          GReadDevicesData_acceleratorData_dataBuilder
        > {
  GReadDevicesData_acceleratorData_data._();

  factory GReadDevicesData_acceleratorData_data([
    void Function(GReadDevicesData_acceleratorData_dataBuilder b) updates,
  ]) = _$GReadDevicesData_acceleratorData_data;

  static void _initializeBuilder(
    GReadDevicesData_acceleratorData_dataBuilder b,
  ) => b..G__typename = 'DataInfo';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double get timestamp;
  GReadDevicesData_acceleratorData_data_result get result;
  static Serializer<GReadDevicesData_acceleratorData_data> get serializer =>
      _$gReadDevicesDataAcceleratorDataDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GReadDevicesData_acceleratorData_data.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GReadDevicesData_acceleratorData_data? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GReadDevicesData_acceleratorData_data.serializer,
    json,
  );
}

abstract class GReadDevicesData_acceleratorData_data_result {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GReadDevicesData_acceleratorData_data_result>
  get serializer =>
      _i2.InlineFragmentSerializer<
        GReadDevicesData_acceleratorData_data_result
      >(
        'GReadDevicesData_acceleratorData_data_result',
        GReadDevicesData_acceleratorData_data_result__base,
        {
          'StatusReply':
              GReadDevicesData_acceleratorData_data_result__asStatusReply,
          'Scalar': GReadDevicesData_acceleratorData_data_result__asScalar,
          'ScalarArray':
              GReadDevicesData_acceleratorData_data_result__asScalarArray,
          'Raw': GReadDevicesData_acceleratorData_data_result__asRaw,
          'Text': GReadDevicesData_acceleratorData_data_result__asText,
          'TextArray':
              GReadDevicesData_acceleratorData_data_result__asTextArray,
        },
      );

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GReadDevicesData_acceleratorData_data_result.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GReadDevicesData_acceleratorData_data_result? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GReadDevicesData_acceleratorData_data_result.serializer,
    json,
  );
}

abstract class GReadDevicesData_acceleratorData_data_result__base
    implements
        Built<
          GReadDevicesData_acceleratorData_data_result__base,
          GReadDevicesData_acceleratorData_data_result__baseBuilder
        >,
        GReadDevicesData_acceleratorData_data_result {
  GReadDevicesData_acceleratorData_data_result__base._();

  factory GReadDevicesData_acceleratorData_data_result__base([
    void Function(GReadDevicesData_acceleratorData_data_result__baseBuilder b)
    updates,
  ]) = _$GReadDevicesData_acceleratorData_data_result__base;

  static void _initializeBuilder(
    GReadDevicesData_acceleratorData_data_result__baseBuilder b,
  ) => b..G__typename = 'DataType';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GReadDevicesData_acceleratorData_data_result__base>
  get serializer => _$gReadDevicesDataAcceleratorDataDataResultBaseSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GReadDevicesData_acceleratorData_data_result__base.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GReadDevicesData_acceleratorData_data_result__base? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GReadDevicesData_acceleratorData_data_result__base.serializer,
    json,
  );
}

abstract class GReadDevicesData_acceleratorData_data_result__asStatusReply
    implements
        Built<
          GReadDevicesData_acceleratorData_data_result__asStatusReply,
          GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder
        >,
        GReadDevicesData_acceleratorData_data_result {
  GReadDevicesData_acceleratorData_data_result__asStatusReply._();

  factory GReadDevicesData_acceleratorData_data_result__asStatusReply([
    void Function(
      GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder b,
    )
    updates,
  ]) = _$GReadDevicesData_acceleratorData_data_result__asStatusReply;

  static void _initializeBuilder(
    GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder b,
  ) => b..G__typename = 'StatusReply';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get status;
  static Serializer<GReadDevicesData_acceleratorData_data_result__asStatusReply>
  get serializer =>
      _$gReadDevicesDataAcceleratorDataDataResultAsStatusReplySerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GReadDevicesData_acceleratorData_data_result__asStatusReply
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GReadDevicesData_acceleratorData_data_result__asStatusReply? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GReadDevicesData_acceleratorData_data_result__asStatusReply.serializer,
    json,
  );
}

abstract class GReadDevicesData_acceleratorData_data_result__asScalar
    implements
        Built<
          GReadDevicesData_acceleratorData_data_result__asScalar,
          GReadDevicesData_acceleratorData_data_result__asScalarBuilder
        >,
        GReadDevicesData_acceleratorData_data_result {
  GReadDevicesData_acceleratorData_data_result__asScalar._();

  factory GReadDevicesData_acceleratorData_data_result__asScalar([
    void Function(
      GReadDevicesData_acceleratorData_data_result__asScalarBuilder b,
    )
    updates,
  ]) = _$GReadDevicesData_acceleratorData_data_result__asScalar;

  static void _initializeBuilder(
    GReadDevicesData_acceleratorData_data_result__asScalarBuilder b,
  ) => b..G__typename = 'Scalar';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double get scalarValue;
  static Serializer<GReadDevicesData_acceleratorData_data_result__asScalar>
  get serializer =>
      _$gReadDevicesDataAcceleratorDataDataResultAsScalarSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GReadDevicesData_acceleratorData_data_result__asScalar.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GReadDevicesData_acceleratorData_data_result__asScalar? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GReadDevicesData_acceleratorData_data_result__asScalar.serializer,
    json,
  );
}

abstract class GReadDevicesData_acceleratorData_data_result__asScalarArray
    implements
        Built<
          GReadDevicesData_acceleratorData_data_result__asScalarArray,
          GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder
        >,
        GReadDevicesData_acceleratorData_data_result {
  GReadDevicesData_acceleratorData_data_result__asScalarArray._();

  factory GReadDevicesData_acceleratorData_data_result__asScalarArray([
    void Function(
      GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder b,
    )
    updates,
  ]) = _$GReadDevicesData_acceleratorData_data_result__asScalarArray;

  static void _initializeBuilder(
    GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder b,
  ) => b..G__typename = 'ScalarArray';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<double> get scalarArrayValue;
  static Serializer<GReadDevicesData_acceleratorData_data_result__asScalarArray>
  get serializer =>
      _$gReadDevicesDataAcceleratorDataDataResultAsScalarArraySerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GReadDevicesData_acceleratorData_data_result__asScalarArray
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GReadDevicesData_acceleratorData_data_result__asScalarArray? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GReadDevicesData_acceleratorData_data_result__asScalarArray.serializer,
    json,
  );
}

abstract class GReadDevicesData_acceleratorData_data_result__asRaw
    implements
        Built<
          GReadDevicesData_acceleratorData_data_result__asRaw,
          GReadDevicesData_acceleratorData_data_result__asRawBuilder
        >,
        GReadDevicesData_acceleratorData_data_result {
  GReadDevicesData_acceleratorData_data_result__asRaw._();

  factory GReadDevicesData_acceleratorData_data_result__asRaw([
    void Function(GReadDevicesData_acceleratorData_data_result__asRawBuilder b)
    updates,
  ]) = _$GReadDevicesData_acceleratorData_data_result__asRaw;

  static void _initializeBuilder(
    GReadDevicesData_acceleratorData_data_result__asRawBuilder b,
  ) => b..G__typename = 'Raw';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<int> get rawValue;
  static Serializer<GReadDevicesData_acceleratorData_data_result__asRaw>
  get serializer => _$gReadDevicesDataAcceleratorDataDataResultAsRawSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GReadDevicesData_acceleratorData_data_result__asRaw.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GReadDevicesData_acceleratorData_data_result__asRaw? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GReadDevicesData_acceleratorData_data_result__asRaw.serializer,
    json,
  );
}

abstract class GReadDevicesData_acceleratorData_data_result__asText
    implements
        Built<
          GReadDevicesData_acceleratorData_data_result__asText,
          GReadDevicesData_acceleratorData_data_result__asTextBuilder
        >,
        GReadDevicesData_acceleratorData_data_result {
  GReadDevicesData_acceleratorData_data_result__asText._();

  factory GReadDevicesData_acceleratorData_data_result__asText([
    void Function(GReadDevicesData_acceleratorData_data_result__asTextBuilder b)
    updates,
  ]) = _$GReadDevicesData_acceleratorData_data_result__asText;

  static void _initializeBuilder(
    GReadDevicesData_acceleratorData_data_result__asTextBuilder b,
  ) => b..G__typename = 'Text';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get textValue;
  static Serializer<GReadDevicesData_acceleratorData_data_result__asText>
  get serializer => _$gReadDevicesDataAcceleratorDataDataResultAsTextSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GReadDevicesData_acceleratorData_data_result__asText.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GReadDevicesData_acceleratorData_data_result__asText? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GReadDevicesData_acceleratorData_data_result__asText.serializer,
    json,
  );
}

abstract class GReadDevicesData_acceleratorData_data_result__asTextArray
    implements
        Built<
          GReadDevicesData_acceleratorData_data_result__asTextArray,
          GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder
        >,
        GReadDevicesData_acceleratorData_data_result {
  GReadDevicesData_acceleratorData_data_result__asTextArray._();

  factory GReadDevicesData_acceleratorData_data_result__asTextArray([
    void Function(
      GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder b,
    )
    updates,
  ]) = _$GReadDevicesData_acceleratorData_data_result__asTextArray;

  static void _initializeBuilder(
    GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder b,
  ) => b..G__typename = 'TextArray';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<String> get textArrayValue;
  static Serializer<GReadDevicesData_acceleratorData_data_result__asTextArray>
  get serializer =>
      _$gReadDevicesDataAcceleratorDataDataResultAsTextArraySerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GReadDevicesData_acceleratorData_data_result__asTextArray
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GReadDevicesData_acceleratorData_data_result__asTextArray? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GReadDevicesData_acceleratorData_data_result__asTextArray.serializer,
    json,
  );
}
