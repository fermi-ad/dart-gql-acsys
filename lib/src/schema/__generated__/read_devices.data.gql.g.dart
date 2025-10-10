// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_devices.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReadDevicesData> _$gReadDevicesDataSerializer =
    new _$GReadDevicesDataSerializer();
Serializer<GReadDevicesData_acceleratorData>
_$gReadDevicesDataAcceleratorDataSerializer =
    new _$GReadDevicesData_acceleratorDataSerializer();
Serializer<GReadDevicesData_acceleratorData_data>
_$gReadDevicesDataAcceleratorDataDataSerializer =
    new _$GReadDevicesData_acceleratorData_dataSerializer();
Serializer<GReadDevicesData_acceleratorData_data_result__base>
_$gReadDevicesDataAcceleratorDataDataResultBaseSerializer =
    new _$GReadDevicesData_acceleratorData_data_result__baseSerializer();
Serializer<GReadDevicesData_acceleratorData_data_result__asStatusReply>
_$gReadDevicesDataAcceleratorDataDataResultAsStatusReplySerializer =
    new _$GReadDevicesData_acceleratorData_data_result__asStatusReplySerializer();
Serializer<GReadDevicesData_acceleratorData_data_result__asScalar>
_$gReadDevicesDataAcceleratorDataDataResultAsScalarSerializer =
    new _$GReadDevicesData_acceleratorData_data_result__asScalarSerializer();
Serializer<GReadDevicesData_acceleratorData_data_result__asScalarArray>
_$gReadDevicesDataAcceleratorDataDataResultAsScalarArraySerializer =
    new _$GReadDevicesData_acceleratorData_data_result__asScalarArraySerializer();
Serializer<GReadDevicesData_acceleratorData_data_result__asText>
_$gReadDevicesDataAcceleratorDataDataResultAsTextSerializer =
    new _$GReadDevicesData_acceleratorData_data_result__asTextSerializer();
Serializer<GReadDevicesData_acceleratorData_data_result__asTextArray>
_$gReadDevicesDataAcceleratorDataDataResultAsTextArraySerializer =
    new _$GReadDevicesData_acceleratorData_data_result__asTextArraySerializer();

class _$GReadDevicesDataSerializer
    implements StructuredSerializer<GReadDevicesData> {
  @override
  final Iterable<Type> types = const [GReadDevicesData, _$GReadDevicesData];
  @override
  final String wireName = 'GReadDevicesData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GReadDevicesData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'acceleratorData',
      serializers.serialize(
        object.acceleratorData,
        specifiedType: const FullType(BuiltList, const [
          const FullType(GReadDevicesData_acceleratorData),
        ]),
      ),
    ];

    return result;
  }

  @override
  GReadDevicesData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GReadDevicesDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'acceleratorData':
          result.acceleratorData.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GReadDevicesData_acceleratorData),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GReadDevicesData_acceleratorDataSerializer
    implements StructuredSerializer<GReadDevicesData_acceleratorData> {
  @override
  final Iterable<Type> types = const [
    GReadDevicesData_acceleratorData,
    _$GReadDevicesData_acceleratorData,
  ];
  @override
  final String wireName = 'GReadDevicesData_acceleratorData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GReadDevicesData_acceleratorData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'refId',
      serializers.serialize(object.refId, specifiedType: const FullType(int)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, const [
          const FullType(GReadDevicesData_acceleratorData_data),
        ]),
      ),
    ];

    return result;
  }

  @override
  GReadDevicesData_acceleratorData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GReadDevicesData_acceleratorDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'refId':
          result.refId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'data':
          result.data.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GReadDevicesData_acceleratorData_data),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GReadDevicesData_acceleratorData_dataSerializer
    implements StructuredSerializer<GReadDevicesData_acceleratorData_data> {
  @override
  final Iterable<Type> types = const [
    GReadDevicesData_acceleratorData_data,
    _$GReadDevicesData_acceleratorData_data,
  ];
  @override
  final String wireName = 'GReadDevicesData_acceleratorData_data';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GReadDevicesData_acceleratorData_data object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'timestamp',
      serializers.serialize(
        object.timestamp,
        specifiedType: const FullType(double),
      ),
      'result',
      serializers.serialize(
        object.result,
        specifiedType: const FullType(
          GReadDevicesData_acceleratorData_data_result,
        ),
      ),
    ];

    return result;
  }

  @override
  GReadDevicesData_acceleratorData_data deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GReadDevicesData_acceleratorData_dataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'timestamp':
          result.timestamp =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )!
                  as double;
          break;
        case 'result':
          result.result =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      GReadDevicesData_acceleratorData_data_result,
                    ),
                  )!
                  as GReadDevicesData_acceleratorData_data_result;
          break;
      }
    }

    return result.build();
  }
}

class _$GReadDevicesData_acceleratorData_data_result__baseSerializer
    implements
        StructuredSerializer<
          GReadDevicesData_acceleratorData_data_result__base
        > {
  @override
  final Iterable<Type> types = const [
    GReadDevicesData_acceleratorData_data_result__base,
    _$GReadDevicesData_acceleratorData_data_result__base,
  ];
  @override
  final String wireName = 'GReadDevicesData_acceleratorData_data_result__base';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GReadDevicesData_acceleratorData_data_result__base object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
    ];

    return result;
  }

  @override
  GReadDevicesData_acceleratorData_data_result__base deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        new GReadDevicesData_acceleratorData_data_result__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GReadDevicesData_acceleratorData_data_result__asStatusReplySerializer
    implements
        StructuredSerializer<
          GReadDevicesData_acceleratorData_data_result__asStatusReply
        > {
  @override
  final Iterable<Type> types = const [
    GReadDevicesData_acceleratorData_data_result__asStatusReply,
    _$GReadDevicesData_acceleratorData_data_result__asStatusReply,
  ];
  @override
  final String wireName =
      'GReadDevicesData_acceleratorData_data_result__asStatusReply';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GReadDevicesData_acceleratorData_data_result__asStatusReply object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asStatusReply deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        new GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'status':
          result.status =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GReadDevicesData_acceleratorData_data_result__asScalarSerializer
    implements
        StructuredSerializer<
          GReadDevicesData_acceleratorData_data_result__asScalar
        > {
  @override
  final Iterable<Type> types = const [
    GReadDevicesData_acceleratorData_data_result__asScalar,
    _$GReadDevicesData_acceleratorData_data_result__asScalar,
  ];
  @override
  final String wireName =
      'GReadDevicesData_acceleratorData_data_result__asScalar';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GReadDevicesData_acceleratorData_data_result__asScalar object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'scalarValue',
      serializers.serialize(
        object.scalarValue,
        specifiedType: const FullType(double),
      ),
    ];

    return result;
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asScalar deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        new GReadDevicesData_acceleratorData_data_result__asScalarBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'scalarValue':
          result.scalarValue =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )!
                  as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GReadDevicesData_acceleratorData_data_result__asScalarArraySerializer
    implements
        StructuredSerializer<
          GReadDevicesData_acceleratorData_data_result__asScalarArray
        > {
  @override
  final Iterable<Type> types = const [
    GReadDevicesData_acceleratorData_data_result__asScalarArray,
    _$GReadDevicesData_acceleratorData_data_result__asScalarArray,
  ];
  @override
  final String wireName =
      'GReadDevicesData_acceleratorData_data_result__asScalarArray';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GReadDevicesData_acceleratorData_data_result__asScalarArray object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'scalarArrayValue',
      serializers.serialize(
        object.scalarArrayValue,
        specifiedType: const FullType(BuiltList, const [
          const FullType(double),
        ]),
      ),
    ];

    return result;
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asScalarArray deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        new GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'scalarArrayValue':
          result.scalarArrayValue.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(double),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GReadDevicesData_acceleratorData_data_result__asTextSerializer
    implements
        StructuredSerializer<
          GReadDevicesData_acceleratorData_data_result__asText
        > {
  @override
  final Iterable<Type> types = const [
    GReadDevicesData_acceleratorData_data_result__asText,
    _$GReadDevicesData_acceleratorData_data_result__asText,
  ];
  @override
  final String wireName =
      'GReadDevicesData_acceleratorData_data_result__asText';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GReadDevicesData_acceleratorData_data_result__asText object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'textValue',
      serializers.serialize(
        object.textValue,
        specifiedType: const FullType(String),
      ),
    ];

    return result;
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asText deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        new GReadDevicesData_acceleratorData_data_result__asTextBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'textValue':
          result.textValue =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GReadDevicesData_acceleratorData_data_result__asTextArraySerializer
    implements
        StructuredSerializer<
          GReadDevicesData_acceleratorData_data_result__asTextArray
        > {
  @override
  final Iterable<Type> types = const [
    GReadDevicesData_acceleratorData_data_result__asTextArray,
    _$GReadDevicesData_acceleratorData_data_result__asTextArray,
  ];
  @override
  final String wireName =
      'GReadDevicesData_acceleratorData_data_result__asTextArray';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GReadDevicesData_acceleratorData_data_result__asTextArray object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'textArrayValue',
      serializers.serialize(
        object.textArrayValue,
        specifiedType: const FullType(BuiltList, const [
          const FullType(String),
        ]),
      ),
    ];

    return result;
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asTextArray deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        new GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'textArrayValue':
          result.textArrayValue.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(String),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GReadDevicesData extends GReadDevicesData {
  @override
  final String G__typename;
  @override
  final BuiltList<GReadDevicesData_acceleratorData> acceleratorData;

  factory _$GReadDevicesData([
    void Function(GReadDevicesDataBuilder)? updates,
  ]) => (new GReadDevicesDataBuilder()..update(updates))._build();

  _$GReadDevicesData._({
    required this.G__typename,
    required this.acceleratorData,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GReadDevicesData',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      acceleratorData,
      r'GReadDevicesData',
      'acceleratorData',
    );
  }

  @override
  GReadDevicesData rebuild(void Function(GReadDevicesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReadDevicesDataBuilder toBuilder() =>
      new GReadDevicesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadDevicesData &&
        G__typename == other.G__typename &&
        acceleratorData == other.acceleratorData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, acceleratorData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReadDevicesData')
          ..add('G__typename', G__typename)
          ..add('acceleratorData', acceleratorData))
        .toString();
  }
}

class GReadDevicesDataBuilder
    implements Builder<GReadDevicesData, GReadDevicesDataBuilder> {
  _$GReadDevicesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GReadDevicesData_acceleratorData>? _acceleratorData;
  ListBuilder<GReadDevicesData_acceleratorData> get acceleratorData =>
      _$this._acceleratorData ??=
          new ListBuilder<GReadDevicesData_acceleratorData>();
  set acceleratorData(
    ListBuilder<GReadDevicesData_acceleratorData>? acceleratorData,
  ) => _$this._acceleratorData = acceleratorData;

  GReadDevicesDataBuilder() {
    GReadDevicesData._initializeBuilder(this);
  }

  GReadDevicesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _acceleratorData = $v.acceleratorData.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadDevicesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReadDevicesData;
  }

  @override
  void update(void Function(GReadDevicesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReadDevicesData build() => _build();

  _$GReadDevicesData _build() {
    _$GReadDevicesData _$result;
    try {
      _$result =
          _$v ??
          new _$GReadDevicesData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GReadDevicesData',
              'G__typename',
            ),
            acceleratorData: acceleratorData.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'acceleratorData';
        acceleratorData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GReadDevicesData',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GReadDevicesData_acceleratorData
    extends GReadDevicesData_acceleratorData {
  @override
  final String G__typename;
  @override
  final int refId;
  @override
  final BuiltList<GReadDevicesData_acceleratorData_data> data;

  factory _$GReadDevicesData_acceleratorData([
    void Function(GReadDevicesData_acceleratorDataBuilder)? updates,
  ]) =>
      (new GReadDevicesData_acceleratorDataBuilder()..update(updates))._build();

  _$GReadDevicesData_acceleratorData._({
    required this.G__typename,
    required this.refId,
    required this.data,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GReadDevicesData_acceleratorData',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      refId,
      r'GReadDevicesData_acceleratorData',
      'refId',
    );
    BuiltValueNullFieldError.checkNotNull(
      data,
      r'GReadDevicesData_acceleratorData',
      'data',
    );
  }

  @override
  GReadDevicesData_acceleratorData rebuild(
    void Function(GReadDevicesData_acceleratorDataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GReadDevicesData_acceleratorDataBuilder toBuilder() =>
      new GReadDevicesData_acceleratorDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadDevicesData_acceleratorData &&
        G__typename == other.G__typename &&
        refId == other.refId &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, refId.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReadDevicesData_acceleratorData')
          ..add('G__typename', G__typename)
          ..add('refId', refId)
          ..add('data', data))
        .toString();
  }
}

class GReadDevicesData_acceleratorDataBuilder
    implements
        Builder<
          GReadDevicesData_acceleratorData,
          GReadDevicesData_acceleratorDataBuilder
        > {
  _$GReadDevicesData_acceleratorData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _refId;
  int? get refId => _$this._refId;
  set refId(int? refId) => _$this._refId = refId;

  ListBuilder<GReadDevicesData_acceleratorData_data>? _data;
  ListBuilder<GReadDevicesData_acceleratorData_data> get data =>
      _$this._data ??= new ListBuilder<GReadDevicesData_acceleratorData_data>();
  set data(ListBuilder<GReadDevicesData_acceleratorData_data>? data) =>
      _$this._data = data;

  GReadDevicesData_acceleratorDataBuilder() {
    GReadDevicesData_acceleratorData._initializeBuilder(this);
  }

  GReadDevicesData_acceleratorDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _refId = $v.refId;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadDevicesData_acceleratorData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReadDevicesData_acceleratorData;
  }

  @override
  void update(void Function(GReadDevicesData_acceleratorDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReadDevicesData_acceleratorData build() => _build();

  _$GReadDevicesData_acceleratorData _build() {
    _$GReadDevicesData_acceleratorData _$result;
    try {
      _$result =
          _$v ??
          new _$GReadDevicesData_acceleratorData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GReadDevicesData_acceleratorData',
              'G__typename',
            ),
            refId: BuiltValueNullFieldError.checkNotNull(
              refId,
              r'GReadDevicesData_acceleratorData',
              'refId',
            ),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GReadDevicesData_acceleratorData',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GReadDevicesData_acceleratorData_data
    extends GReadDevicesData_acceleratorData_data {
  @override
  final String G__typename;
  @override
  final double timestamp;
  @override
  final GReadDevicesData_acceleratorData_data_result result;

  factory _$GReadDevicesData_acceleratorData_data([
    void Function(GReadDevicesData_acceleratorData_dataBuilder)? updates,
  ]) =>
      (new GReadDevicesData_acceleratorData_dataBuilder()..update(updates))
          ._build();

  _$GReadDevicesData_acceleratorData_data._({
    required this.G__typename,
    required this.timestamp,
    required this.result,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GReadDevicesData_acceleratorData_data',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      timestamp,
      r'GReadDevicesData_acceleratorData_data',
      'timestamp',
    );
    BuiltValueNullFieldError.checkNotNull(
      result,
      r'GReadDevicesData_acceleratorData_data',
      'result',
    );
  }

  @override
  GReadDevicesData_acceleratorData_data rebuild(
    void Function(GReadDevicesData_acceleratorData_dataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GReadDevicesData_acceleratorData_dataBuilder toBuilder() =>
      new GReadDevicesData_acceleratorData_dataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadDevicesData_acceleratorData_data &&
        G__typename == other.G__typename &&
        timestamp == other.timestamp &&
        result == other.result;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GReadDevicesData_acceleratorData_data',
          )
          ..add('G__typename', G__typename)
          ..add('timestamp', timestamp)
          ..add('result', result))
        .toString();
  }
}

class GReadDevicesData_acceleratorData_dataBuilder
    implements
        Builder<
          GReadDevicesData_acceleratorData_data,
          GReadDevicesData_acceleratorData_dataBuilder
        > {
  _$GReadDevicesData_acceleratorData_data? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _timestamp;
  double? get timestamp => _$this._timestamp;
  set timestamp(double? timestamp) => _$this._timestamp = timestamp;

  GReadDevicesData_acceleratorData_data_result? _result;
  GReadDevicesData_acceleratorData_data_result? get result => _$this._result;
  set result(GReadDevicesData_acceleratorData_data_result? result) =>
      _$this._result = result;

  GReadDevicesData_acceleratorData_dataBuilder() {
    GReadDevicesData_acceleratorData_data._initializeBuilder(this);
  }

  GReadDevicesData_acceleratorData_dataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _timestamp = $v.timestamp;
      _result = $v.result;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadDevicesData_acceleratorData_data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReadDevicesData_acceleratorData_data;
  }

  @override
  void update(
    void Function(GReadDevicesData_acceleratorData_dataBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GReadDevicesData_acceleratorData_data build() => _build();

  _$GReadDevicesData_acceleratorData_data _build() {
    final _$result =
        _$v ??
        new _$GReadDevicesData_acceleratorData_data._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GReadDevicesData_acceleratorData_data',
            'G__typename',
          ),
          timestamp: BuiltValueNullFieldError.checkNotNull(
            timestamp,
            r'GReadDevicesData_acceleratorData_data',
            'timestamp',
          ),
          result: BuiltValueNullFieldError.checkNotNull(
            result,
            r'GReadDevicesData_acceleratorData_data',
            'result',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GReadDevicesData_acceleratorData_data_result__base
    extends GReadDevicesData_acceleratorData_data_result__base {
  @override
  final String G__typename;

  factory _$GReadDevicesData_acceleratorData_data_result__base([
    void Function(GReadDevicesData_acceleratorData_data_result__baseBuilder)?
    updates,
  ]) =>
      (new GReadDevicesData_acceleratorData_data_result__baseBuilder()
            ..update(updates))
          ._build();

  _$GReadDevicesData_acceleratorData_data_result__base._({
    required this.G__typename,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GReadDevicesData_acceleratorData_data_result__base',
      'G__typename',
    );
  }

  @override
  GReadDevicesData_acceleratorData_data_result__base rebuild(
    void Function(GReadDevicesData_acceleratorData_data_result__baseBuilder)
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GReadDevicesData_acceleratorData_data_result__baseBuilder toBuilder() =>
      new GReadDevicesData_acceleratorData_data_result__baseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadDevicesData_acceleratorData_data_result__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'GReadDevicesData_acceleratorData_data_result__base',
    )..add('G__typename', G__typename)).toString();
  }
}

class GReadDevicesData_acceleratorData_data_result__baseBuilder
    implements
        Builder<
          GReadDevicesData_acceleratorData_data_result__base,
          GReadDevicesData_acceleratorData_data_result__baseBuilder
        > {
  _$GReadDevicesData_acceleratorData_data_result__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GReadDevicesData_acceleratorData_data_result__baseBuilder() {
    GReadDevicesData_acceleratorData_data_result__base._initializeBuilder(this);
  }

  GReadDevicesData_acceleratorData_data_result__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadDevicesData_acceleratorData_data_result__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReadDevicesData_acceleratorData_data_result__base;
  }

  @override
  void update(
    void Function(GReadDevicesData_acceleratorData_data_result__baseBuilder)?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GReadDevicesData_acceleratorData_data_result__base build() => _build();

  _$GReadDevicesData_acceleratorData_data_result__base _build() {
    final _$result =
        _$v ??
        new _$GReadDevicesData_acceleratorData_data_result__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GReadDevicesData_acceleratorData_data_result__base',
            'G__typename',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GReadDevicesData_acceleratorData_data_result__asStatusReply
    extends GReadDevicesData_acceleratorData_data_result__asStatusReply {
  @override
  final String G__typename;
  @override
  final int status;

  factory _$GReadDevicesData_acceleratorData_data_result__asStatusReply([
    void Function(
      GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder,
    )?
    updates,
  ]) =>
      (new GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder()
            ..update(updates))
          ._build();

  _$GReadDevicesData_acceleratorData_data_result__asStatusReply._({
    required this.G__typename,
    required this.status,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GReadDevicesData_acceleratorData_data_result__asStatusReply',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      status,
      r'GReadDevicesData_acceleratorData_data_result__asStatusReply',
      'status',
    );
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asStatusReply rebuild(
    void Function(
      GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder,
    )
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder
  toBuilder() =>
      new GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GReadDevicesData_acceleratorData_data_result__asStatusReply &&
        G__typename == other.G__typename &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GReadDevicesData_acceleratorData_data_result__asStatusReply',
          )
          ..add('G__typename', G__typename)
          ..add('status', status))
        .toString();
  }
}

class GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder
    implements
        Builder<
          GReadDevicesData_acceleratorData_data_result__asStatusReply,
          GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder
        > {
  _$GReadDevicesData_acceleratorData_data_result__asStatusReply? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder() {
    GReadDevicesData_acceleratorData_data_result__asStatusReply._initializeBuilder(
      this,
    );
  }

  GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder
  get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
    GReadDevicesData_acceleratorData_data_result__asStatusReply other,
  ) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GReadDevicesData_acceleratorData_data_result__asStatusReply;
  }

  @override
  void update(
    void Function(
      GReadDevicesData_acceleratorData_data_result__asStatusReplyBuilder,
    )?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asStatusReply build() =>
      _build();

  _$GReadDevicesData_acceleratorData_data_result__asStatusReply _build() {
    final _$result =
        _$v ??
        new _$GReadDevicesData_acceleratorData_data_result__asStatusReply._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GReadDevicesData_acceleratorData_data_result__asStatusReply',
            'G__typename',
          ),
          status: BuiltValueNullFieldError.checkNotNull(
            status,
            r'GReadDevicesData_acceleratorData_data_result__asStatusReply',
            'status',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GReadDevicesData_acceleratorData_data_result__asScalar
    extends GReadDevicesData_acceleratorData_data_result__asScalar {
  @override
  final String G__typename;
  @override
  final double scalarValue;

  factory _$GReadDevicesData_acceleratorData_data_result__asScalar([
    void Function(
      GReadDevicesData_acceleratorData_data_result__asScalarBuilder,
    )?
    updates,
  ]) =>
      (new GReadDevicesData_acceleratorData_data_result__asScalarBuilder()
            ..update(updates))
          ._build();

  _$GReadDevicesData_acceleratorData_data_result__asScalar._({
    required this.G__typename,
    required this.scalarValue,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GReadDevicesData_acceleratorData_data_result__asScalar',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      scalarValue,
      r'GReadDevicesData_acceleratorData_data_result__asScalar',
      'scalarValue',
    );
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asScalar rebuild(
    void Function(GReadDevicesData_acceleratorData_data_result__asScalarBuilder)
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GReadDevicesData_acceleratorData_data_result__asScalarBuilder toBuilder() =>
      new GReadDevicesData_acceleratorData_data_result__asScalarBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadDevicesData_acceleratorData_data_result__asScalar &&
        G__typename == other.G__typename &&
        scalarValue == other.scalarValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, scalarValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GReadDevicesData_acceleratorData_data_result__asScalar',
          )
          ..add('G__typename', G__typename)
          ..add('scalarValue', scalarValue))
        .toString();
  }
}

class GReadDevicesData_acceleratorData_data_result__asScalarBuilder
    implements
        Builder<
          GReadDevicesData_acceleratorData_data_result__asScalar,
          GReadDevicesData_acceleratorData_data_result__asScalarBuilder
        > {
  _$GReadDevicesData_acceleratorData_data_result__asScalar? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _scalarValue;
  double? get scalarValue => _$this._scalarValue;
  set scalarValue(double? scalarValue) => _$this._scalarValue = scalarValue;

  GReadDevicesData_acceleratorData_data_result__asScalarBuilder() {
    GReadDevicesData_acceleratorData_data_result__asScalar._initializeBuilder(
      this,
    );
  }

  GReadDevicesData_acceleratorData_data_result__asScalarBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _scalarValue = $v.scalarValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadDevicesData_acceleratorData_data_result__asScalar other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReadDevicesData_acceleratorData_data_result__asScalar;
  }

  @override
  void update(
    void Function(
      GReadDevicesData_acceleratorData_data_result__asScalarBuilder,
    )?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asScalar build() => _build();

  _$GReadDevicesData_acceleratorData_data_result__asScalar _build() {
    final _$result =
        _$v ??
        new _$GReadDevicesData_acceleratorData_data_result__asScalar._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GReadDevicesData_acceleratorData_data_result__asScalar',
            'G__typename',
          ),
          scalarValue: BuiltValueNullFieldError.checkNotNull(
            scalarValue,
            r'GReadDevicesData_acceleratorData_data_result__asScalar',
            'scalarValue',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GReadDevicesData_acceleratorData_data_result__asScalarArray
    extends GReadDevicesData_acceleratorData_data_result__asScalarArray {
  @override
  final String G__typename;
  @override
  final BuiltList<double> scalarArrayValue;

  factory _$GReadDevicesData_acceleratorData_data_result__asScalarArray([
    void Function(
      GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder,
    )?
    updates,
  ]) =>
      (new GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder()
            ..update(updates))
          ._build();

  _$GReadDevicesData_acceleratorData_data_result__asScalarArray._({
    required this.G__typename,
    required this.scalarArrayValue,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GReadDevicesData_acceleratorData_data_result__asScalarArray',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      scalarArrayValue,
      r'GReadDevicesData_acceleratorData_data_result__asScalarArray',
      'scalarArrayValue',
    );
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asScalarArray rebuild(
    void Function(
      GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder,
    )
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder
  toBuilder() =>
      new GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GReadDevicesData_acceleratorData_data_result__asScalarArray &&
        G__typename == other.G__typename &&
        scalarArrayValue == other.scalarArrayValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, scalarArrayValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GReadDevicesData_acceleratorData_data_result__asScalarArray',
          )
          ..add('G__typename', G__typename)
          ..add('scalarArrayValue', scalarArrayValue))
        .toString();
  }
}

class GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder
    implements
        Builder<
          GReadDevicesData_acceleratorData_data_result__asScalarArray,
          GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder
        > {
  _$GReadDevicesData_acceleratorData_data_result__asScalarArray? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<double>? _scalarArrayValue;
  ListBuilder<double> get scalarArrayValue =>
      _$this._scalarArrayValue ??= new ListBuilder<double>();
  set scalarArrayValue(ListBuilder<double>? scalarArrayValue) =>
      _$this._scalarArrayValue = scalarArrayValue;

  GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder() {
    GReadDevicesData_acceleratorData_data_result__asScalarArray._initializeBuilder(
      this,
    );
  }

  GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder
  get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _scalarArrayValue = $v.scalarArrayValue.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
    GReadDevicesData_acceleratorData_data_result__asScalarArray other,
  ) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GReadDevicesData_acceleratorData_data_result__asScalarArray;
  }

  @override
  void update(
    void Function(
      GReadDevicesData_acceleratorData_data_result__asScalarArrayBuilder,
    )?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asScalarArray build() =>
      _build();

  _$GReadDevicesData_acceleratorData_data_result__asScalarArray _build() {
    _$GReadDevicesData_acceleratorData_data_result__asScalarArray _$result;
    try {
      _$result =
          _$v ??
          new _$GReadDevicesData_acceleratorData_data_result__asScalarArray._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GReadDevicesData_acceleratorData_data_result__asScalarArray',
              'G__typename',
            ),
            scalarArrayValue: scalarArrayValue.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scalarArrayValue';
        scalarArrayValue.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GReadDevicesData_acceleratorData_data_result__asScalarArray',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GReadDevicesData_acceleratorData_data_result__asText
    extends GReadDevicesData_acceleratorData_data_result__asText {
  @override
  final String G__typename;
  @override
  final String textValue;

  factory _$GReadDevicesData_acceleratorData_data_result__asText([
    void Function(GReadDevicesData_acceleratorData_data_result__asTextBuilder)?
    updates,
  ]) =>
      (new GReadDevicesData_acceleratorData_data_result__asTextBuilder()
            ..update(updates))
          ._build();

  _$GReadDevicesData_acceleratorData_data_result__asText._({
    required this.G__typename,
    required this.textValue,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GReadDevicesData_acceleratorData_data_result__asText',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      textValue,
      r'GReadDevicesData_acceleratorData_data_result__asText',
      'textValue',
    );
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asText rebuild(
    void Function(GReadDevicesData_acceleratorData_data_result__asTextBuilder)
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GReadDevicesData_acceleratorData_data_result__asTextBuilder toBuilder() =>
      new GReadDevicesData_acceleratorData_data_result__asTextBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadDevicesData_acceleratorData_data_result__asText &&
        G__typename == other.G__typename &&
        textValue == other.textValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, textValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GReadDevicesData_acceleratorData_data_result__asText',
          )
          ..add('G__typename', G__typename)
          ..add('textValue', textValue))
        .toString();
  }
}

class GReadDevicesData_acceleratorData_data_result__asTextBuilder
    implements
        Builder<
          GReadDevicesData_acceleratorData_data_result__asText,
          GReadDevicesData_acceleratorData_data_result__asTextBuilder
        > {
  _$GReadDevicesData_acceleratorData_data_result__asText? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _textValue;
  String? get textValue => _$this._textValue;
  set textValue(String? textValue) => _$this._textValue = textValue;

  GReadDevicesData_acceleratorData_data_result__asTextBuilder() {
    GReadDevicesData_acceleratorData_data_result__asText._initializeBuilder(
      this,
    );
  }

  GReadDevicesData_acceleratorData_data_result__asTextBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _textValue = $v.textValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadDevicesData_acceleratorData_data_result__asText other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReadDevicesData_acceleratorData_data_result__asText;
  }

  @override
  void update(
    void Function(GReadDevicesData_acceleratorData_data_result__asTextBuilder)?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asText build() => _build();

  _$GReadDevicesData_acceleratorData_data_result__asText _build() {
    final _$result =
        _$v ??
        new _$GReadDevicesData_acceleratorData_data_result__asText._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GReadDevicesData_acceleratorData_data_result__asText',
            'G__typename',
          ),
          textValue: BuiltValueNullFieldError.checkNotNull(
            textValue,
            r'GReadDevicesData_acceleratorData_data_result__asText',
            'textValue',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GReadDevicesData_acceleratorData_data_result__asTextArray
    extends GReadDevicesData_acceleratorData_data_result__asTextArray {
  @override
  final String G__typename;
  @override
  final BuiltList<String> textArrayValue;

  factory _$GReadDevicesData_acceleratorData_data_result__asTextArray([
    void Function(
      GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder,
    )?
    updates,
  ]) =>
      (new GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder()
            ..update(updates))
          ._build();

  _$GReadDevicesData_acceleratorData_data_result__asTextArray._({
    required this.G__typename,
    required this.textArrayValue,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GReadDevicesData_acceleratorData_data_result__asTextArray',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      textArrayValue,
      r'GReadDevicesData_acceleratorData_data_result__asTextArray',
      'textArrayValue',
    );
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asTextArray rebuild(
    void Function(
      GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder,
    )
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder
  toBuilder() =>
      new GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadDevicesData_acceleratorData_data_result__asTextArray &&
        G__typename == other.G__typename &&
        textArrayValue == other.textArrayValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, textArrayValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GReadDevicesData_acceleratorData_data_result__asTextArray',
          )
          ..add('G__typename', G__typename)
          ..add('textArrayValue', textArrayValue))
        .toString();
  }
}

class GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder
    implements
        Builder<
          GReadDevicesData_acceleratorData_data_result__asTextArray,
          GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder
        > {
  _$GReadDevicesData_acceleratorData_data_result__asTextArray? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<String>? _textArrayValue;
  ListBuilder<String> get textArrayValue =>
      _$this._textArrayValue ??= new ListBuilder<String>();
  set textArrayValue(ListBuilder<String>? textArrayValue) =>
      _$this._textArrayValue = textArrayValue;

  GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder() {
    GReadDevicesData_acceleratorData_data_result__asTextArray._initializeBuilder(
      this,
    );
  }

  GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _textArrayValue = $v.textArrayValue.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
    GReadDevicesData_acceleratorData_data_result__asTextArray other,
  ) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReadDevicesData_acceleratorData_data_result__asTextArray;
  }

  @override
  void update(
    void Function(
      GReadDevicesData_acceleratorData_data_result__asTextArrayBuilder,
    )?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GReadDevicesData_acceleratorData_data_result__asTextArray build() => _build();

  _$GReadDevicesData_acceleratorData_data_result__asTextArray _build() {
    _$GReadDevicesData_acceleratorData_data_result__asTextArray _$result;
    try {
      _$result =
          _$v ??
          new _$GReadDevicesData_acceleratorData_data_result__asTextArray._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GReadDevicesData_acceleratorData_data_result__asTextArray',
              'G__typename',
            ),
            textArrayValue: textArrayValue.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'textArrayValue';
        textArrayValue.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GReadDevicesData_acceleratorData_data_result__asTextArray',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
