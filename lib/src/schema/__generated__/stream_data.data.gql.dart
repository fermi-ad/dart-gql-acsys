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

part 'stream_data.data.gql.g.dart';

abstract class GStreamDataData
    implements Built<GStreamDataData, GStreamDataDataBuilder> {
  GStreamDataData._();

  factory GStreamDataData([void Function(GStreamDataDataBuilder b) updates]) =
      _$GStreamDataData;

  static void _initializeBuilder(GStreamDataDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GStreamDataData_acceleratorData get acceleratorData;
  static Serializer<GStreamDataData> get serializer =>
      _$gStreamDataDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GStreamDataData.serializer, this)
          as Map<String, dynamic>);

  static GStreamDataData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStreamDataData.serializer, json);
}

abstract class GStreamDataData_acceleratorData
    implements
        Built<
          GStreamDataData_acceleratorData,
          GStreamDataData_acceleratorDataBuilder
        > {
  GStreamDataData_acceleratorData._();

  factory GStreamDataData_acceleratorData([
    void Function(GStreamDataData_acceleratorDataBuilder b) updates,
  ]) = _$GStreamDataData_acceleratorData;

  static void _initializeBuilder(GStreamDataData_acceleratorDataBuilder b) =>
      b..G__typename = 'DataReply';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get refId;
  BuiltList<GStreamDataData_acceleratorData_data> get data;
  static Serializer<GStreamDataData_acceleratorData> get serializer =>
      _$gStreamDataDataAcceleratorDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStreamDataData_acceleratorData.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStreamDataData_acceleratorData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStreamDataData_acceleratorData.serializer,
        json,
      );
}

abstract class GStreamDataData_acceleratorData_data
    implements
        Built<
          GStreamDataData_acceleratorData_data,
          GStreamDataData_acceleratorData_dataBuilder
        > {
  GStreamDataData_acceleratorData_data._();

  factory GStreamDataData_acceleratorData_data([
    void Function(GStreamDataData_acceleratorData_dataBuilder b) updates,
  ]) = _$GStreamDataData_acceleratorData_data;

  static void _initializeBuilder(
    GStreamDataData_acceleratorData_dataBuilder b,
  ) => b..G__typename = 'DataInfo';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double get timestamp;
  GStreamDataData_acceleratorData_data_result get result;
  static Serializer<GStreamDataData_acceleratorData_data> get serializer =>
      _$gStreamDataDataAcceleratorDataDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStreamDataData_acceleratorData_data.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStreamDataData_acceleratorData_data? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStreamDataData_acceleratorData_data.serializer,
    json,
  );
}

abstract class GStreamDataData_acceleratorData_data_result {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GStreamDataData_acceleratorData_data_result>
  get serializer =>
      _i2.InlineFragmentSerializer<GStreamDataData_acceleratorData_data_result>(
        'GStreamDataData_acceleratorData_data_result',
        GStreamDataData_acceleratorData_data_result__base,
        {
          'StatusReply':
              GStreamDataData_acceleratorData_data_result__asStatusReply,
          'Scalar': GStreamDataData_acceleratorData_data_result__asScalar,
          'ScalarArray':
              GStreamDataData_acceleratorData_data_result__asScalarArray,
          'Raw': GStreamDataData_acceleratorData_data_result__asRaw,
          'Text': GStreamDataData_acceleratorData_data_result__asText,
          'TextArray': GStreamDataData_acceleratorData_data_result__asTextArray,
        },
      );

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStreamDataData_acceleratorData_data_result.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStreamDataData_acceleratorData_data_result? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStreamDataData_acceleratorData_data_result.serializer,
    json,
  );
}

abstract class GStreamDataData_acceleratorData_data_result__base
    implements
        Built<
          GStreamDataData_acceleratorData_data_result__base,
          GStreamDataData_acceleratorData_data_result__baseBuilder
        >,
        GStreamDataData_acceleratorData_data_result {
  GStreamDataData_acceleratorData_data_result__base._();

  factory GStreamDataData_acceleratorData_data_result__base([
    void Function(GStreamDataData_acceleratorData_data_result__baseBuilder b)
    updates,
  ]) = _$GStreamDataData_acceleratorData_data_result__base;

  static void _initializeBuilder(
    GStreamDataData_acceleratorData_data_result__baseBuilder b,
  ) => b..G__typename = 'DataType';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GStreamDataData_acceleratorData_data_result__base>
  get serializer => _$gStreamDataDataAcceleratorDataDataResultBaseSerializer;

  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStreamDataData_acceleratorData_data_result__base.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStreamDataData_acceleratorData_data_result__base? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStreamDataData_acceleratorData_data_result__base.serializer,
    json,
  );
}

abstract class GStreamDataData_acceleratorData_data_result__asStatusReply
    implements
        Built<
          GStreamDataData_acceleratorData_data_result__asStatusReply,
          GStreamDataData_acceleratorData_data_result__asStatusReplyBuilder
        >,
        GStreamDataData_acceleratorData_data_result {
  GStreamDataData_acceleratorData_data_result__asStatusReply._();

  factory GStreamDataData_acceleratorData_data_result__asStatusReply([
    void Function(
      GStreamDataData_acceleratorData_data_result__asStatusReplyBuilder b,
    )
    updates,
  ]) = _$GStreamDataData_acceleratorData_data_result__asStatusReply;

  static void _initializeBuilder(
    GStreamDataData_acceleratorData_data_result__asStatusReplyBuilder b,
  ) => b..G__typename = 'StatusReply';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get status;
  static Serializer<GStreamDataData_acceleratorData_data_result__asStatusReply>
  get serializer =>
      _$gStreamDataDataAcceleratorDataDataResultAsStatusReplySerializer;

  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStreamDataData_acceleratorData_data_result__asStatusReply
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStreamDataData_acceleratorData_data_result__asStatusReply? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStreamDataData_acceleratorData_data_result__asStatusReply.serializer,
    json,
  );
}

abstract class GStreamDataData_acceleratorData_data_result__asScalar
    implements
        Built<
          GStreamDataData_acceleratorData_data_result__asScalar,
          GStreamDataData_acceleratorData_data_result__asScalarBuilder
        >,
        GStreamDataData_acceleratorData_data_result {
  GStreamDataData_acceleratorData_data_result__asScalar._();

  factory GStreamDataData_acceleratorData_data_result__asScalar([
    void Function(
      GStreamDataData_acceleratorData_data_result__asScalarBuilder b,
    )
    updates,
  ]) = _$GStreamDataData_acceleratorData_data_result__asScalar;

  static void _initializeBuilder(
    GStreamDataData_acceleratorData_data_result__asScalarBuilder b,
  ) => b..G__typename = 'Scalar';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  double get scalarValue;
  static Serializer<GStreamDataData_acceleratorData_data_result__asScalar>
  get serializer =>
      _$gStreamDataDataAcceleratorDataDataResultAsScalarSerializer;

  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStreamDataData_acceleratorData_data_result__asScalar.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStreamDataData_acceleratorData_data_result__asScalar? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStreamDataData_acceleratorData_data_result__asScalar.serializer,
    json,
  );
}

abstract class GStreamDataData_acceleratorData_data_result__asScalarArray
    implements
        Built<
          GStreamDataData_acceleratorData_data_result__asScalarArray,
          GStreamDataData_acceleratorData_data_result__asScalarArrayBuilder
        >,
        GStreamDataData_acceleratorData_data_result {
  GStreamDataData_acceleratorData_data_result__asScalarArray._();

  factory GStreamDataData_acceleratorData_data_result__asScalarArray([
    void Function(
      GStreamDataData_acceleratorData_data_result__asScalarArrayBuilder b,
    )
    updates,
  ]) = _$GStreamDataData_acceleratorData_data_result__asScalarArray;

  static void _initializeBuilder(
    GStreamDataData_acceleratorData_data_result__asScalarArrayBuilder b,
  ) => b..G__typename = 'ScalarArray';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<double> get scalarArrayValue;
  static Serializer<GStreamDataData_acceleratorData_data_result__asScalarArray>
  get serializer =>
      _$gStreamDataDataAcceleratorDataDataResultAsScalarArraySerializer;

  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStreamDataData_acceleratorData_data_result__asScalarArray
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStreamDataData_acceleratorData_data_result__asScalarArray? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStreamDataData_acceleratorData_data_result__asScalarArray.serializer,
    json,
  );
}

abstract class GStreamDataData_acceleratorData_data_result__asRaw
    implements
        Built<
          GStreamDataData_acceleratorData_data_result__asRaw,
          GStreamDataData_acceleratorData_data_result__asRawBuilder
        >,
        GStreamDataData_acceleratorData_data_result {
  GStreamDataData_acceleratorData_data_result__asRaw._();

  factory GStreamDataData_acceleratorData_data_result__asRaw([
    void Function(GStreamDataData_acceleratorData_data_result__asRawBuilder b)
    updates,
  ]) = _$GStreamDataData_acceleratorData_data_result__asRaw;

  static void _initializeBuilder(
    GStreamDataData_acceleratorData_data_result__asRawBuilder b,
  ) => b..G__typename = 'Raw';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<int> get rawValue;
  static Serializer<GStreamDataData_acceleratorData_data_result__asRaw>
  get serializer => _$gStreamDataDataAcceleratorDataDataResultAsRawSerializer;

  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStreamDataData_acceleratorData_data_result__asRaw.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStreamDataData_acceleratorData_data_result__asRaw? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStreamDataData_acceleratorData_data_result__asRaw.serializer,
    json,
  );
}

abstract class GStreamDataData_acceleratorData_data_result__asText
    implements
        Built<
          GStreamDataData_acceleratorData_data_result__asText,
          GStreamDataData_acceleratorData_data_result__asTextBuilder
        >,
        GStreamDataData_acceleratorData_data_result {
  GStreamDataData_acceleratorData_data_result__asText._();

  factory GStreamDataData_acceleratorData_data_result__asText([
    void Function(GStreamDataData_acceleratorData_data_result__asTextBuilder b)
    updates,
  ]) = _$GStreamDataData_acceleratorData_data_result__asText;

  static void _initializeBuilder(
    GStreamDataData_acceleratorData_data_result__asTextBuilder b,
  ) => b..G__typename = 'Text';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get textValue;
  static Serializer<GStreamDataData_acceleratorData_data_result__asText>
  get serializer => _$gStreamDataDataAcceleratorDataDataResultAsTextSerializer;

  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStreamDataData_acceleratorData_data_result__asText.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStreamDataData_acceleratorData_data_result__asText? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStreamDataData_acceleratorData_data_result__asText.serializer,
    json,
  );
}

abstract class GStreamDataData_acceleratorData_data_result__asTextArray
    implements
        Built<
          GStreamDataData_acceleratorData_data_result__asTextArray,
          GStreamDataData_acceleratorData_data_result__asTextArrayBuilder
        >,
        GStreamDataData_acceleratorData_data_result {
  GStreamDataData_acceleratorData_data_result__asTextArray._();

  factory GStreamDataData_acceleratorData_data_result__asTextArray([
    void Function(
      GStreamDataData_acceleratorData_data_result__asTextArrayBuilder b,
    )
    updates,
  ]) = _$GStreamDataData_acceleratorData_data_result__asTextArray;

  static void _initializeBuilder(
    GStreamDataData_acceleratorData_data_result__asTextArrayBuilder b,
  ) => b..G__typename = 'TextArray';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<String> get textArrayValue;
  static Serializer<GStreamDataData_acceleratorData_data_result__asTextArray>
  get serializer =>
      _$gStreamDataDataAcceleratorDataDataResultAsTextArraySerializer;

  @override
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GStreamDataData_acceleratorData_data_result__asTextArray.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GStreamDataData_acceleratorData_data_result__asTextArray? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GStreamDataData_acceleratorData_data_result__asTextArray.serializer,
    json,
  );
}
