// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_plot.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStartPlotData> _$gStartPlotDataSerializer =
    new _$GStartPlotDataSerializer();
Serializer<GStartPlotData_startPlot> _$gStartPlotDataStartPlotSerializer =
    new _$GStartPlotData_startPlotSerializer();
Serializer<GStartPlotData_startPlot_data>
_$gStartPlotDataStartPlotDataSerializer =
    new _$GStartPlotData_startPlot_dataSerializer();
Serializer<GStartPlotData_startPlot_data_channelData>
_$gStartPlotDataStartPlotDataChannelDataSerializer =
    new _$GStartPlotData_startPlot_data_channelDataSerializer();
Serializer<GStartPlotData_startPlot_data_channelData_result__base>
_$gStartPlotDataStartPlotDataChannelDataResultBaseSerializer =
    new _$GStartPlotData_startPlot_data_channelData_result__baseSerializer();
Serializer<GStartPlotData_startPlot_data_channelData_result__asScalar>
_$gStartPlotDataStartPlotDataChannelDataResultAsScalarSerializer =
    new _$GStartPlotData_startPlot_data_channelData_result__asScalarSerializer();
Serializer<GStartPlotData_startPlot_data_channelData_result__asScalarArray>
_$gStartPlotDataStartPlotDataChannelDataResultAsScalarArraySerializer =
    new _$GStartPlotData_startPlot_data_channelData_result__asScalarArraySerializer();

class _$GStartPlotDataSerializer
    implements StructuredSerializer<GStartPlotData> {
  @override
  final Iterable<Type> types = const [GStartPlotData, _$GStartPlotData];
  @override
  final String wireName = 'GStartPlotData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'startPlot',
      serializers.serialize(
        object.startPlot,
        specifiedType: const FullType(GStartPlotData_startPlot),
      ),
    ];

    return result;
  }

  @override
  GStartPlotData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GStartPlotDataBuilder();

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
        case 'startPlot':
          result.startPlot.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(GStartPlotData_startPlot),
                )!
                as GStartPlotData_startPlot,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GStartPlotData_startPlotSerializer
    implements StructuredSerializer<GStartPlotData_startPlot> {
  @override
  final Iterable<Type> types = const [
    GStartPlotData_startPlot,
    _$GStartPlotData_startPlot,
  ];
  @override
  final String wireName = 'GStartPlotData_startPlot';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData_startPlot object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'plotId',
      serializers.serialize(
        object.plotId,
        specifiedType: const FullType(String),
      ),
      'timestamp',
      serializers.serialize(
        object.timestamp,
        specifiedType: const FullType(double),
      ),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, const [
          const FullType(GStartPlotData_startPlot_data),
        ]),
      ),
    ];
    Object? value;
    value = object.triggerTimestamp;
    if (value != null) {
      result
        ..add('triggerTimestamp')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    return result;
  }

  @override
  GStartPlotData_startPlot deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GStartPlotData_startPlotBuilder();

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
        case 'plotId':
          result.plotId =
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
        case 'triggerTimestamp':
          result.triggerTimestamp =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'data':
          result.data.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GStartPlotData_startPlot_data),
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

class _$GStartPlotData_startPlot_dataSerializer
    implements StructuredSerializer<GStartPlotData_startPlot_data> {
  @override
  final Iterable<Type> types = const [
    GStartPlotData_startPlot_data,
    _$GStartPlotData_startPlot_data,
  ];
  @override
  final String wireName = 'GStartPlotData_startPlot_data';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData_startPlot_data object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'channelRate',
      serializers.serialize(
        object.channelRate,
        specifiedType: const FullType(String),
      ),
      'channelUnits',
      serializers.serialize(
        object.channelUnits,
        specifiedType: const FullType(String),
      ),
      'channelStatus',
      serializers.serialize(
        object.channelStatus,
        specifiedType: const FullType(int),
      ),
      'channelData',
      serializers.serialize(
        object.channelData,
        specifiedType: const FullType(BuiltList, const [
          const FullType(GStartPlotData_startPlot_data_channelData),
        ]),
      ),
    ];

    return result;
  }

  @override
  GStartPlotData_startPlot_data deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GStartPlotData_startPlot_dataBuilder();

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
        case 'channelRate':
          result.channelRate =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'channelUnits':
          result.channelUnits =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'channelStatus':
          result.channelStatus =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'channelData':
          result.channelData.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GStartPlotData_startPlot_data_channelData),
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

class _$GStartPlotData_startPlot_data_channelDataSerializer
    implements StructuredSerializer<GStartPlotData_startPlot_data_channelData> {
  @override
  final Iterable<Type> types = const [
    GStartPlotData_startPlot_data_channelData,
    _$GStartPlotData_startPlot_data_channelData,
  ];
  @override
  final String wireName = 'GStartPlotData_startPlot_data_channelData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData_startPlot_data_channelData object, {
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
          GStartPlotData_startPlot_data_channelData_result,
        ),
      ),
    ];

    return result;
  }

  @override
  GStartPlotData_startPlot_data_channelData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GStartPlotData_startPlot_data_channelDataBuilder();

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
                      GStartPlotData_startPlot_data_channelData_result,
                    ),
                  )!
                  as GStartPlotData_startPlot_data_channelData_result;
          break;
      }
    }

    return result.build();
  }
}

class _$GStartPlotData_startPlot_data_channelData_result__baseSerializer
    implements
        StructuredSerializer<
          GStartPlotData_startPlot_data_channelData_result__base
        > {
  @override
  final Iterable<Type> types = const [
    GStartPlotData_startPlot_data_channelData_result__base,
    _$GStartPlotData_startPlot_data_channelData_result__base,
  ];
  @override
  final String wireName =
      'GStartPlotData_startPlot_data_channelData_result__base';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData_startPlot_data_channelData_result__base object, {
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
  GStartPlotData_startPlot_data_channelData_result__base deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        new GStartPlotData_startPlot_data_channelData_result__baseBuilder();

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

class _$GStartPlotData_startPlot_data_channelData_result__asScalarSerializer
    implements
        StructuredSerializer<
          GStartPlotData_startPlot_data_channelData_result__asScalar
        > {
  @override
  final Iterable<Type> types = const [
    GStartPlotData_startPlot_data_channelData_result__asScalar,
    _$GStartPlotData_startPlot_data_channelData_result__asScalar,
  ];
  @override
  final String wireName =
      'GStartPlotData_startPlot_data_channelData_result__asScalar';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData_startPlot_data_channelData_result__asScalar object, {
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
  GStartPlotData_startPlot_data_channelData_result__asScalar deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        new GStartPlotData_startPlot_data_channelData_result__asScalarBuilder();

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

class _$GStartPlotData_startPlot_data_channelData_result__asScalarArraySerializer
    implements
        StructuredSerializer<
          GStartPlotData_startPlot_data_channelData_result__asScalarArray
        > {
  @override
  final Iterable<Type> types = const [
    GStartPlotData_startPlot_data_channelData_result__asScalarArray,
    _$GStartPlotData_startPlot_data_channelData_result__asScalarArray,
  ];
  @override
  final String wireName =
      'GStartPlotData_startPlot_data_channelData_result__asScalarArray';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotData_startPlot_data_channelData_result__asScalarArray object, {
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
  GStartPlotData_startPlot_data_channelData_result__asScalarArray deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        new GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder();

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

class _$GStartPlotData extends GStartPlotData {
  @override
  final String G__typename;
  @override
  final GStartPlotData_startPlot startPlot;

  factory _$GStartPlotData([void Function(GStartPlotDataBuilder)? updates]) =>
      (new GStartPlotDataBuilder()..update(updates))._build();

  _$GStartPlotData._({required this.G__typename, required this.startPlot})
    : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      startPlot,
      r'GStartPlotData',
      'startPlot',
    );
  }

  @override
  GStartPlotData rebuild(void Function(GStartPlotDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStartPlotDataBuilder toBuilder() =>
      new GStartPlotDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStartPlotData &&
        G__typename == other.G__typename &&
        startPlot == other.startPlot;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, startPlot.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStartPlotData')
          ..add('G__typename', G__typename)
          ..add('startPlot', startPlot))
        .toString();
  }
}

class GStartPlotDataBuilder
    implements Builder<GStartPlotData, GStartPlotDataBuilder> {
  _$GStartPlotData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GStartPlotData_startPlotBuilder? _startPlot;
  GStartPlotData_startPlotBuilder get startPlot =>
      _$this._startPlot ??= new GStartPlotData_startPlotBuilder();
  set startPlot(GStartPlotData_startPlotBuilder? startPlot) =>
      _$this._startPlot = startPlot;

  GStartPlotDataBuilder() {
    GStartPlotData._initializeBuilder(this);
  }

  GStartPlotDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _startPlot = $v.startPlot.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStartPlotData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStartPlotData;
  }

  @override
  void update(void Function(GStartPlotDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData build() => _build();

  _$GStartPlotData _build() {
    _$GStartPlotData _$result;
    try {
      _$result =
          _$v ??
          new _$GStartPlotData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GStartPlotData',
              'G__typename',
            ),
            startPlot: startPlot.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'startPlot';
        startPlot.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GStartPlotData',
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

class _$GStartPlotData_startPlot extends GStartPlotData_startPlot {
  @override
  final String G__typename;
  @override
  final String plotId;
  @override
  final double timestamp;
  @override
  final double? triggerTimestamp;
  @override
  final BuiltList<GStartPlotData_startPlot_data> data;

  factory _$GStartPlotData_startPlot([
    void Function(GStartPlotData_startPlotBuilder)? updates,
  ]) => (new GStartPlotData_startPlotBuilder()..update(updates))._build();

  _$GStartPlotData_startPlot._({
    required this.G__typename,
    required this.plotId,
    required this.timestamp,
    this.triggerTimestamp,
    required this.data,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData_startPlot',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      plotId,
      r'GStartPlotData_startPlot',
      'plotId',
    );
    BuiltValueNullFieldError.checkNotNull(
      timestamp,
      r'GStartPlotData_startPlot',
      'timestamp',
    );
    BuiltValueNullFieldError.checkNotNull(
      data,
      r'GStartPlotData_startPlot',
      'data',
    );
  }

  @override
  GStartPlotData_startPlot rebuild(
    void Function(GStartPlotData_startPlotBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GStartPlotData_startPlotBuilder toBuilder() =>
      new GStartPlotData_startPlotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStartPlotData_startPlot &&
        G__typename == other.G__typename &&
        plotId == other.plotId &&
        timestamp == other.timestamp &&
        triggerTimestamp == other.triggerTimestamp &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, plotId.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, triggerTimestamp.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStartPlotData_startPlot')
          ..add('G__typename', G__typename)
          ..add('plotId', plotId)
          ..add('timestamp', timestamp)
          ..add('triggerTimestamp', triggerTimestamp)
          ..add('data', data))
        .toString();
  }
}

class GStartPlotData_startPlotBuilder
    implements
        Builder<GStartPlotData_startPlot, GStartPlotData_startPlotBuilder> {
  _$GStartPlotData_startPlot? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _plotId;
  String? get plotId => _$this._plotId;
  set plotId(String? plotId) => _$this._plotId = plotId;

  double? _timestamp;
  double? get timestamp => _$this._timestamp;
  set timestamp(double? timestamp) => _$this._timestamp = timestamp;

  double? _triggerTimestamp;
  double? get triggerTimestamp => _$this._triggerTimestamp;
  set triggerTimestamp(double? triggerTimestamp) =>
      _$this._triggerTimestamp = triggerTimestamp;

  ListBuilder<GStartPlotData_startPlot_data>? _data;
  ListBuilder<GStartPlotData_startPlot_data> get data =>
      _$this._data ??= new ListBuilder<GStartPlotData_startPlot_data>();
  set data(ListBuilder<GStartPlotData_startPlot_data>? data) =>
      _$this._data = data;

  GStartPlotData_startPlotBuilder() {
    GStartPlotData_startPlot._initializeBuilder(this);
  }

  GStartPlotData_startPlotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _plotId = $v.plotId;
      _timestamp = $v.timestamp;
      _triggerTimestamp = $v.triggerTimestamp;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStartPlotData_startPlot other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStartPlotData_startPlot;
  }

  @override
  void update(void Function(GStartPlotData_startPlotBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData_startPlot build() => _build();

  _$GStartPlotData_startPlot _build() {
    _$GStartPlotData_startPlot _$result;
    try {
      _$result =
          _$v ??
          new _$GStartPlotData_startPlot._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GStartPlotData_startPlot',
              'G__typename',
            ),
            plotId: BuiltValueNullFieldError.checkNotNull(
              plotId,
              r'GStartPlotData_startPlot',
              'plotId',
            ),
            timestamp: BuiltValueNullFieldError.checkNotNull(
              timestamp,
              r'GStartPlotData_startPlot',
              'timestamp',
            ),
            triggerTimestamp: triggerTimestamp,
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GStartPlotData_startPlot',
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

class _$GStartPlotData_startPlot_data extends GStartPlotData_startPlot_data {
  @override
  final String G__typename;
  @override
  final String channelRate;
  @override
  final String channelUnits;
  @override
  final int channelStatus;
  @override
  final BuiltList<GStartPlotData_startPlot_data_channelData> channelData;

  factory _$GStartPlotData_startPlot_data([
    void Function(GStartPlotData_startPlot_dataBuilder)? updates,
  ]) => (new GStartPlotData_startPlot_dataBuilder()..update(updates))._build();

  _$GStartPlotData_startPlot_data._({
    required this.G__typename,
    required this.channelRate,
    required this.channelUnits,
    required this.channelStatus,
    required this.channelData,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData_startPlot_data',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      channelRate,
      r'GStartPlotData_startPlot_data',
      'channelRate',
    );
    BuiltValueNullFieldError.checkNotNull(
      channelUnits,
      r'GStartPlotData_startPlot_data',
      'channelUnits',
    );
    BuiltValueNullFieldError.checkNotNull(
      channelStatus,
      r'GStartPlotData_startPlot_data',
      'channelStatus',
    );
    BuiltValueNullFieldError.checkNotNull(
      channelData,
      r'GStartPlotData_startPlot_data',
      'channelData',
    );
  }

  @override
  GStartPlotData_startPlot_data rebuild(
    void Function(GStartPlotData_startPlot_dataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GStartPlotData_startPlot_dataBuilder toBuilder() =>
      new GStartPlotData_startPlot_dataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStartPlotData_startPlot_data &&
        G__typename == other.G__typename &&
        channelRate == other.channelRate &&
        channelUnits == other.channelUnits &&
        channelStatus == other.channelStatus &&
        channelData == other.channelData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, channelRate.hashCode);
    _$hash = $jc(_$hash, channelUnits.hashCode);
    _$hash = $jc(_$hash, channelStatus.hashCode);
    _$hash = $jc(_$hash, channelData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStartPlotData_startPlot_data')
          ..add('G__typename', G__typename)
          ..add('channelRate', channelRate)
          ..add('channelUnits', channelUnits)
          ..add('channelStatus', channelStatus)
          ..add('channelData', channelData))
        .toString();
  }
}

class GStartPlotData_startPlot_dataBuilder
    implements
        Builder<
          GStartPlotData_startPlot_data,
          GStartPlotData_startPlot_dataBuilder
        > {
  _$GStartPlotData_startPlot_data? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _channelRate;
  String? get channelRate => _$this._channelRate;
  set channelRate(String? channelRate) => _$this._channelRate = channelRate;

  String? _channelUnits;
  String? get channelUnits => _$this._channelUnits;
  set channelUnits(String? channelUnits) => _$this._channelUnits = channelUnits;

  int? _channelStatus;
  int? get channelStatus => _$this._channelStatus;
  set channelStatus(int? channelStatus) =>
      _$this._channelStatus = channelStatus;

  ListBuilder<GStartPlotData_startPlot_data_channelData>? _channelData;
  ListBuilder<GStartPlotData_startPlot_data_channelData> get channelData =>
      _$this._channelData ??=
          new ListBuilder<GStartPlotData_startPlot_data_channelData>();
  set channelData(
    ListBuilder<GStartPlotData_startPlot_data_channelData>? channelData,
  ) => _$this._channelData = channelData;

  GStartPlotData_startPlot_dataBuilder() {
    GStartPlotData_startPlot_data._initializeBuilder(this);
  }

  GStartPlotData_startPlot_dataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _channelRate = $v.channelRate;
      _channelUnits = $v.channelUnits;
      _channelStatus = $v.channelStatus;
      _channelData = $v.channelData.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStartPlotData_startPlot_data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStartPlotData_startPlot_data;
  }

  @override
  void update(void Function(GStartPlotData_startPlot_dataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData_startPlot_data build() => _build();

  _$GStartPlotData_startPlot_data _build() {
    _$GStartPlotData_startPlot_data _$result;
    try {
      _$result =
          _$v ??
          new _$GStartPlotData_startPlot_data._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GStartPlotData_startPlot_data',
              'G__typename',
            ),
            channelRate: BuiltValueNullFieldError.checkNotNull(
              channelRate,
              r'GStartPlotData_startPlot_data',
              'channelRate',
            ),
            channelUnits: BuiltValueNullFieldError.checkNotNull(
              channelUnits,
              r'GStartPlotData_startPlot_data',
              'channelUnits',
            ),
            channelStatus: BuiltValueNullFieldError.checkNotNull(
              channelStatus,
              r'GStartPlotData_startPlot_data',
              'channelStatus',
            ),
            channelData: channelData.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'channelData';
        channelData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GStartPlotData_startPlot_data',
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

class _$GStartPlotData_startPlot_data_channelData
    extends GStartPlotData_startPlot_data_channelData {
  @override
  final String G__typename;
  @override
  final double timestamp;
  @override
  final GStartPlotData_startPlot_data_channelData_result result;

  factory _$GStartPlotData_startPlot_data_channelData([
    void Function(GStartPlotData_startPlot_data_channelDataBuilder)? updates,
  ]) =>
      (new GStartPlotData_startPlot_data_channelDataBuilder()..update(updates))
          ._build();

  _$GStartPlotData_startPlot_data_channelData._({
    required this.G__typename,
    required this.timestamp,
    required this.result,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData_startPlot_data_channelData',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      timestamp,
      r'GStartPlotData_startPlot_data_channelData',
      'timestamp',
    );
    BuiltValueNullFieldError.checkNotNull(
      result,
      r'GStartPlotData_startPlot_data_channelData',
      'result',
    );
  }

  @override
  GStartPlotData_startPlot_data_channelData rebuild(
    void Function(GStartPlotData_startPlot_data_channelDataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GStartPlotData_startPlot_data_channelDataBuilder toBuilder() =>
      new GStartPlotData_startPlot_data_channelDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStartPlotData_startPlot_data_channelData &&
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
            r'GStartPlotData_startPlot_data_channelData',
          )
          ..add('G__typename', G__typename)
          ..add('timestamp', timestamp)
          ..add('result', result))
        .toString();
  }
}

class GStartPlotData_startPlot_data_channelDataBuilder
    implements
        Builder<
          GStartPlotData_startPlot_data_channelData,
          GStartPlotData_startPlot_data_channelDataBuilder
        > {
  _$GStartPlotData_startPlot_data_channelData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _timestamp;
  double? get timestamp => _$this._timestamp;
  set timestamp(double? timestamp) => _$this._timestamp = timestamp;

  GStartPlotData_startPlot_data_channelData_result? _result;
  GStartPlotData_startPlot_data_channelData_result? get result =>
      _$this._result;
  set result(GStartPlotData_startPlot_data_channelData_result? result) =>
      _$this._result = result;

  GStartPlotData_startPlot_data_channelDataBuilder() {
    GStartPlotData_startPlot_data_channelData._initializeBuilder(this);
  }

  GStartPlotData_startPlot_data_channelDataBuilder get _$this {
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
  void replace(GStartPlotData_startPlot_data_channelData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStartPlotData_startPlot_data_channelData;
  }

  @override
  void update(
    void Function(GStartPlotData_startPlot_data_channelDataBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData_startPlot_data_channelData build() => _build();

  _$GStartPlotData_startPlot_data_channelData _build() {
    final _$result =
        _$v ??
        new _$GStartPlotData_startPlot_data_channelData._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GStartPlotData_startPlot_data_channelData',
            'G__typename',
          ),
          timestamp: BuiltValueNullFieldError.checkNotNull(
            timestamp,
            r'GStartPlotData_startPlot_data_channelData',
            'timestamp',
          ),
          result: BuiltValueNullFieldError.checkNotNull(
            result,
            r'GStartPlotData_startPlot_data_channelData',
            'result',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GStartPlotData_startPlot_data_channelData_result__base
    extends GStartPlotData_startPlot_data_channelData_result__base {
  @override
  final String G__typename;

  factory _$GStartPlotData_startPlot_data_channelData_result__base([
    void Function(
      GStartPlotData_startPlot_data_channelData_result__baseBuilder,
    )?
    updates,
  ]) =>
      (new GStartPlotData_startPlot_data_channelData_result__baseBuilder()
            ..update(updates))
          ._build();

  _$GStartPlotData_startPlot_data_channelData_result__base._({
    required this.G__typename,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData_startPlot_data_channelData_result__base',
      'G__typename',
    );
  }

  @override
  GStartPlotData_startPlot_data_channelData_result__base rebuild(
    void Function(GStartPlotData_startPlot_data_channelData_result__baseBuilder)
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GStartPlotData_startPlot_data_channelData_result__baseBuilder toBuilder() =>
      new GStartPlotData_startPlot_data_channelData_result__baseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStartPlotData_startPlot_data_channelData_result__base &&
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
      r'GStartPlotData_startPlot_data_channelData_result__base',
    )..add('G__typename', G__typename)).toString();
  }
}

class GStartPlotData_startPlot_data_channelData_result__baseBuilder
    implements
        Builder<
          GStartPlotData_startPlot_data_channelData_result__base,
          GStartPlotData_startPlot_data_channelData_result__baseBuilder
        > {
  _$GStartPlotData_startPlot_data_channelData_result__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GStartPlotData_startPlot_data_channelData_result__baseBuilder() {
    GStartPlotData_startPlot_data_channelData_result__base._initializeBuilder(
      this,
    );
  }

  GStartPlotData_startPlot_data_channelData_result__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStartPlotData_startPlot_data_channelData_result__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStartPlotData_startPlot_data_channelData_result__base;
  }

  @override
  void update(
    void Function(
      GStartPlotData_startPlot_data_channelData_result__baseBuilder,
    )?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData_startPlot_data_channelData_result__base build() => _build();

  _$GStartPlotData_startPlot_data_channelData_result__base _build() {
    final _$result =
        _$v ??
        new _$GStartPlotData_startPlot_data_channelData_result__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GStartPlotData_startPlot_data_channelData_result__base',
            'G__typename',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GStartPlotData_startPlot_data_channelData_result__asScalar
    extends GStartPlotData_startPlot_data_channelData_result__asScalar {
  @override
  final String G__typename;
  @override
  final double scalarValue;

  factory _$GStartPlotData_startPlot_data_channelData_result__asScalar([
    void Function(
      GStartPlotData_startPlot_data_channelData_result__asScalarBuilder,
    )?
    updates,
  ]) =>
      (new GStartPlotData_startPlot_data_channelData_result__asScalarBuilder()
            ..update(updates))
          ._build();

  _$GStartPlotData_startPlot_data_channelData_result__asScalar._({
    required this.G__typename,
    required this.scalarValue,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData_startPlot_data_channelData_result__asScalar',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      scalarValue,
      r'GStartPlotData_startPlot_data_channelData_result__asScalar',
      'scalarValue',
    );
  }

  @override
  GStartPlotData_startPlot_data_channelData_result__asScalar rebuild(
    void Function(
      GStartPlotData_startPlot_data_channelData_result__asScalarBuilder,
    )
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GStartPlotData_startPlot_data_channelData_result__asScalarBuilder
  toBuilder() =>
      new GStartPlotData_startPlot_data_channelData_result__asScalarBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GStartPlotData_startPlot_data_channelData_result__asScalar &&
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
            r'GStartPlotData_startPlot_data_channelData_result__asScalar',
          )
          ..add('G__typename', G__typename)
          ..add('scalarValue', scalarValue))
        .toString();
  }
}

class GStartPlotData_startPlot_data_channelData_result__asScalarBuilder
    implements
        Builder<
          GStartPlotData_startPlot_data_channelData_result__asScalar,
          GStartPlotData_startPlot_data_channelData_result__asScalarBuilder
        > {
  _$GStartPlotData_startPlot_data_channelData_result__asScalar? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  double? _scalarValue;
  double? get scalarValue => _$this._scalarValue;
  set scalarValue(double? scalarValue) => _$this._scalarValue = scalarValue;

  GStartPlotData_startPlot_data_channelData_result__asScalarBuilder() {
    GStartPlotData_startPlot_data_channelData_result__asScalar._initializeBuilder(
      this,
    );
  }

  GStartPlotData_startPlot_data_channelData_result__asScalarBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _scalarValue = $v.scalarValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
    GStartPlotData_startPlot_data_channelData_result__asScalar other,
  ) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStartPlotData_startPlot_data_channelData_result__asScalar;
  }

  @override
  void update(
    void Function(
      GStartPlotData_startPlot_data_channelData_result__asScalarBuilder,
    )?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData_startPlot_data_channelData_result__asScalar build() =>
      _build();

  _$GStartPlotData_startPlot_data_channelData_result__asScalar _build() {
    final _$result =
        _$v ??
        new _$GStartPlotData_startPlot_data_channelData_result__asScalar._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GStartPlotData_startPlot_data_channelData_result__asScalar',
            'G__typename',
          ),
          scalarValue: BuiltValueNullFieldError.checkNotNull(
            scalarValue,
            r'GStartPlotData_startPlot_data_channelData_result__asScalar',
            'scalarValue',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GStartPlotData_startPlot_data_channelData_result__asScalarArray
    extends GStartPlotData_startPlot_data_channelData_result__asScalarArray {
  @override
  final String G__typename;
  @override
  final BuiltList<double> scalarArrayValue;

  factory _$GStartPlotData_startPlot_data_channelData_result__asScalarArray([
    void Function(
      GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder,
    )?
    updates,
  ]) =>
      (new GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder()
            ..update(updates))
          ._build();

  _$GStartPlotData_startPlot_data_channelData_result__asScalarArray._({
    required this.G__typename,
    required this.scalarArrayValue,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GStartPlotData_startPlot_data_channelData_result__asScalarArray',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      scalarArrayValue,
      r'GStartPlotData_startPlot_data_channelData_result__asScalarArray',
      'scalarArrayValue',
    );
  }

  @override
  GStartPlotData_startPlot_data_channelData_result__asScalarArray rebuild(
    void Function(
      GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder,
    )
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder
  toBuilder() =>
      new GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GStartPlotData_startPlot_data_channelData_result__asScalarArray &&
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
            r'GStartPlotData_startPlot_data_channelData_result__asScalarArray',
          )
          ..add('G__typename', G__typename)
          ..add('scalarArrayValue', scalarArrayValue))
        .toString();
  }
}

class GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder
    implements
        Builder<
          GStartPlotData_startPlot_data_channelData_result__asScalarArray,
          GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder
        > {
  _$GStartPlotData_startPlot_data_channelData_result__asScalarArray? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<double>? _scalarArrayValue;
  ListBuilder<double> get scalarArrayValue =>
      _$this._scalarArrayValue ??= new ListBuilder<double>();
  set scalarArrayValue(ListBuilder<double>? scalarArrayValue) =>
      _$this._scalarArrayValue = scalarArrayValue;

  GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder() {
    GStartPlotData_startPlot_data_channelData_result__asScalarArray._initializeBuilder(
      this,
    );
  }

  GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder
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
    GStartPlotData_startPlot_data_channelData_result__asScalarArray other,
  ) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other
            as _$GStartPlotData_startPlot_data_channelData_result__asScalarArray;
  }

  @override
  void update(
    void Function(
      GStartPlotData_startPlot_data_channelData_result__asScalarArrayBuilder,
    )?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotData_startPlot_data_channelData_result__asScalarArray build() =>
      _build();

  _$GStartPlotData_startPlot_data_channelData_result__asScalarArray _build() {
    _$GStartPlotData_startPlot_data_channelData_result__asScalarArray _$result;
    try {
      _$result =
          _$v ??
          new _$GStartPlotData_startPlot_data_channelData_result__asScalarArray._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GStartPlotData_startPlot_data_channelData_result__asScalarArray',
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
          r'GStartPlotData_startPlot_data_channelData_result__asScalarArray',
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
