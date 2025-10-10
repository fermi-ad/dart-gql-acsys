// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DPM.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GChannelSettingSnapshotIn> _$gChannelSettingSnapshotInSerializer =
    new _$GChannelSettingSnapshotInSerializer();
Serializer<GDevValue> _$gDevValueSerializer = new _$GDevValueSerializer();
Serializer<GPlotConfigurationSnapshotIn>
_$gPlotConfigurationSnapshotInSerializer =
    new _$GPlotConfigurationSnapshotInSerializer();
Serializer<GTimeSeriesEntryIn> _$gTimeSeriesEntryInSerializer =
    new _$GTimeSeriesEntryInSerializer();
Serializer<GXformAvgExpr> _$gXformAvgExprSerializer =
    new _$GXformAvgExprSerializer();
Serializer<GXformDeviceExpr> _$gXformDeviceExprSerializer =
    new _$GXformDeviceExprSerializer();
Serializer<GXformExpr> _$gXformExprSerializer = new _$GXformExprSerializer();
Serializer<GXformRequest> _$gXformRequestSerializer =
    new _$GXformRequestSerializer();

class _$GChannelSettingSnapshotInSerializer
    implements StructuredSerializer<GChannelSettingSnapshotIn> {
  @override
  final Iterable<Type> types = const [
    GChannelSettingSnapshotIn,
    _$GChannelSettingSnapshotIn,
  ];
  @override
  final String wireName = 'GChannelSettingSnapshotIn';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GChannelSettingSnapshotIn object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'device',
      serializers.serialize(
        object.device,
        specifiedType: const FullType(String),
      ),
    ];
    Object? value;
    value = object.yMin;
    if (value != null) {
      result
        ..add('yMin')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.yMax;
    if (value != null) {
      result
        ..add('yMax')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.lineColor;
    if (value != null) {
      result
        ..add('lineColor')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.markerIndex;
    if (value != null) {
      result
        ..add('markerIndex')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GChannelSettingSnapshotIn deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GChannelSettingSnapshotInBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'device':
          result.device =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'yMin':
          result.yMin =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'yMax':
          result.yMax =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'lineColor':
          result.lineColor =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'markerIndex':
          result.markerIndex =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GDevValueSerializer implements StructuredSerializer<GDevValue> {
  @override
  final Iterable<Type> types = const [GDevValue, _$GDevValue];
  @override
  final String wireName = 'GDevValue';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GDevValue object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.intVal;
    if (value != null) {
      result
        ..add('intVal')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.scalarVal;
    if (value != null) {
      result
        ..add('scalarVal')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.scalarArrayVal;
    if (value != null) {
      result
        ..add('scalarArrayVal')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(double),
            ]),
          ),
        );
    }
    value = object.rawVal;
    if (value != null) {
      result
        ..add('rawVal')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(int),
            ]),
          ),
        );
    }
    value = object.textVal;
    if (value != null) {
      result
        ..add('textVal')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.textArrayVal;
    if (value != null) {
      result
        ..add('textArrayVal')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(String),
            ]),
          ),
        );
    }
    value = object.timeSeriesVal;
    if (value != null) {
      result
        ..add('timeSeriesVal')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GTimeSeriesEntryIn),
            ]),
          ),
        );
    }
    return result;
  }

  @override
  GDevValue deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GDevValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'intVal':
          result.intVal =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'scalarVal':
          result.scalarVal =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'scalarArrayVal':
          result.scalarArrayVal.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(double),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'rawVal':
          result.rawVal.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(int),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'textVal':
          result.textVal =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'textArrayVal':
          result.textArrayVal.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(String),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'timeSeriesVal':
          result.timeSeriesVal.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GTimeSeriesEntryIn),
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

class _$GPlotConfigurationSnapshotInSerializer
    implements StructuredSerializer<GPlotConfigurationSnapshotIn> {
  @override
  final Iterable<Type> types = const [
    GPlotConfigurationSnapshotIn,
    _$GPlotConfigurationSnapshotIn,
  ];
  @override
  final String wireName = 'GPlotConfigurationSnapshotIn';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GPlotConfigurationSnapshotIn object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'configurationName',
      serializers.serialize(
        object.configurationName,
        specifiedType: const FullType(String),
      ),
      'channels',
      serializers.serialize(
        object.channels,
        specifiedType: const FullType(BuiltList, const [
          const FullType(GChannelSettingSnapshotIn),
        ]),
      ),
      'isScalar',
      serializers.serialize(
        object.isScalar,
        specifiedType: const FullType(bool),
      ),
      'isOneShot',
      serializers.serialize(
        object.isOneShot,
        specifiedType: const FullType(bool),
      ),
      'isShowLabels',
      serializers.serialize(
        object.isShowLabels,
        specifiedType: const FullType(bool),
      ),
      'isPersistent',
      serializers.serialize(
        object.isPersistent,
        specifiedType: const FullType(bool),
      ),
      'dataLimit',
      serializers.serialize(
        object.dataLimit,
        specifiedType: const FullType(int),
      ),
    ];
    Object? value;
    value = object.configurationId;
    if (value != null) {
      result
        ..add('configurationId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.xMin;
    if (value != null) {
      result
        ..add('xMin')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.xMax;
    if (value != null) {
      result
        ..add('xMax')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.startTime;
    if (value != null) {
      result
        ..add('startTime')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.endTime;
    if (value != null) {
      result
        ..add('endTime')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.timeDelta;
    if (value != null) {
      result
        ..add('timeDelta')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }
    value = object.updateDelay;
    if (value != null) {
      result
        ..add('updateDelay')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nAcquisitions;
    if (value != null) {
      result
        ..add('nAcquisitions')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tclkEvent;
    if (value != null) {
      result
        ..add('tclkEvent')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GPlotConfigurationSnapshotIn deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GPlotConfigurationSnapshotInBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'configurationId':
          result.configurationId =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'configurationName':
          result.configurationName =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'channels':
          result.channels.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(GChannelSettingSnapshotIn),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'xMin':
          result.xMin =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'xMax':
          result.xMax =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'startTime':
          result.startTime =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'endTime':
          result.endTime =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'timeDelta':
          result.timeDelta =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double?;
          break;
        case 'isScalar':
          result.isScalar =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'isOneShot':
          result.isOneShot =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'isShowLabels':
          result.isShowLabels =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'isPersistent':
          result.isPersistent =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'dataLimit':
          result.dataLimit =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'updateDelay':
          result.updateDelay =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'nAcquisitions':
          result.nAcquisitions =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'tclkEvent':
          result.tclkEvent =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GTimeSeriesEntryInSerializer
    implements StructuredSerializer<GTimeSeriesEntryIn> {
  @override
  final Iterable<Type> types = const [GTimeSeriesEntryIn, _$GTimeSeriesEntryIn];
  @override
  final String wireName = 'GTimeSeriesEntryIn';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GTimeSeriesEntryIn object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'stamp',
      serializers.serialize(
        object.stamp,
        specifiedType: const FullType(double),
      ),
      'value',
      serializers.serialize(
        object.value,
        specifiedType: const FullType(double),
      ),
    ];

    return result;
  }

  @override
  GTimeSeriesEntryIn deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GTimeSeriesEntryInBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stamp':
          result.stamp =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )!
                  as double;
          break;
        case 'value':
          result.value =
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

class _$GXformAvgExprSerializer implements StructuredSerializer<GXformAvgExpr> {
  @override
  final Iterable<Type> types = const [GXformAvgExpr, _$GXformAvgExpr];
  @override
  final String wireName = 'GXformAvgExpr';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GXformAvgExpr object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'expr',
      serializers.serialize(
        object.expr,
        specifiedType: const FullType(GXformExpr),
      ),
      'n',
      serializers.serialize(object.n, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GXformAvgExpr deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GXformAvgExprBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'expr':
          result.expr.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(GXformExpr),
                )!
                as GXformExpr,
          );
          break;
        case 'n':
          result.n =
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

class _$GXformDeviceExprSerializer
    implements StructuredSerializer<GXformDeviceExpr> {
  @override
  final Iterable<Type> types = const [GXformDeviceExpr, _$GXformDeviceExpr];
  @override
  final String wireName = 'GXformDeviceExpr';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GXformDeviceExpr object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'device',
      serializers.serialize(
        object.device,
        specifiedType: const FullType(String),
      ),
    ];

    return result;
  }

  @override
  GXformDeviceExpr deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GXformDeviceExprBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'device':
          result.device =
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

class _$GXformExprSerializer implements StructuredSerializer<GXformExpr> {
  @override
  final Iterable<Type> types = const [GXformExpr, _$GXformExpr];
  @override
  final String wireName = 'GXformExpr';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GXformExpr object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.devEx;
    if (value != null) {
      result
        ..add('devEx')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(GXformDeviceExpr),
          ),
        );
    }
    value = object.avgEx;
    if (value != null) {
      result
        ..add('avgEx')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(GXformAvgExpr),
          ),
        );
    }
    return result;
  }

  @override
  GXformExpr deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GXformExprBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'devEx':
          result.devEx.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(GXformDeviceExpr),
                )!
                as GXformDeviceExpr,
          );
          break;
        case 'avgEx':
          result.avgEx.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(GXformAvgExpr),
                )!
                as GXformAvgExpr,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GXformRequestSerializer implements StructuredSerializer<GXformRequest> {
  @override
  final Iterable<Type> types = const [GXformRequest, _$GXformRequest];
  @override
  final String wireName = 'GXformRequest';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GXformRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'event',
      serializers.serialize(
        object.event,
        specifiedType: const FullType(String),
      ),
      'expr',
      serializers.serialize(
        object.expr,
        specifiedType: const FullType(GXformExpr),
      ),
    ];

    return result;
  }

  @override
  GXformRequest deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GXformRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'event':
          result.event =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'expr':
          result.expr.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(GXformExpr),
                )!
                as GXformExpr,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GChannelSettingSnapshotIn extends GChannelSettingSnapshotIn {
  @override
  final String device;
  @override
  final double? yMin;
  @override
  final double? yMax;
  @override
  final int? lineColor;
  @override
  final int? markerIndex;

  factory _$GChannelSettingSnapshotIn([
    void Function(GChannelSettingSnapshotInBuilder)? updates,
  ]) => (new GChannelSettingSnapshotInBuilder()..update(updates))._build();

  _$GChannelSettingSnapshotIn._({
    required this.device,
    this.yMin,
    this.yMax,
    this.lineColor,
    this.markerIndex,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      device,
      r'GChannelSettingSnapshotIn',
      'device',
    );
  }

  @override
  GChannelSettingSnapshotIn rebuild(
    void Function(GChannelSettingSnapshotInBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GChannelSettingSnapshotInBuilder toBuilder() =>
      new GChannelSettingSnapshotInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChannelSettingSnapshotIn &&
        device == other.device &&
        yMin == other.yMin &&
        yMax == other.yMax &&
        lineColor == other.lineColor &&
        markerIndex == other.markerIndex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, device.hashCode);
    _$hash = $jc(_$hash, yMin.hashCode);
    _$hash = $jc(_$hash, yMax.hashCode);
    _$hash = $jc(_$hash, lineColor.hashCode);
    _$hash = $jc(_$hash, markerIndex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GChannelSettingSnapshotIn')
          ..add('device', device)
          ..add('yMin', yMin)
          ..add('yMax', yMax)
          ..add('lineColor', lineColor)
          ..add('markerIndex', markerIndex))
        .toString();
  }
}

class GChannelSettingSnapshotInBuilder
    implements
        Builder<GChannelSettingSnapshotIn, GChannelSettingSnapshotInBuilder> {
  _$GChannelSettingSnapshotIn? _$v;

  String? _device;
  String? get device => _$this._device;
  set device(String? device) => _$this._device = device;

  double? _yMin;
  double? get yMin => _$this._yMin;
  set yMin(double? yMin) => _$this._yMin = yMin;

  double? _yMax;
  double? get yMax => _$this._yMax;
  set yMax(double? yMax) => _$this._yMax = yMax;

  int? _lineColor;
  int? get lineColor => _$this._lineColor;
  set lineColor(int? lineColor) => _$this._lineColor = lineColor;

  int? _markerIndex;
  int? get markerIndex => _$this._markerIndex;
  set markerIndex(int? markerIndex) => _$this._markerIndex = markerIndex;

  GChannelSettingSnapshotInBuilder();

  GChannelSettingSnapshotInBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _device = $v.device;
      _yMin = $v.yMin;
      _yMax = $v.yMax;
      _lineColor = $v.lineColor;
      _markerIndex = $v.markerIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChannelSettingSnapshotIn other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChannelSettingSnapshotIn;
  }

  @override
  void update(void Function(GChannelSettingSnapshotInBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GChannelSettingSnapshotIn build() => _build();

  _$GChannelSettingSnapshotIn _build() {
    final _$result =
        _$v ??
        new _$GChannelSettingSnapshotIn._(
          device: BuiltValueNullFieldError.checkNotNull(
            device,
            r'GChannelSettingSnapshotIn',
            'device',
          ),
          yMin: yMin,
          yMax: yMax,
          lineColor: lineColor,
          markerIndex: markerIndex,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GDevValue extends GDevValue {
  @override
  final int? intVal;
  @override
  final double? scalarVal;
  @override
  final BuiltList<double>? scalarArrayVal;
  @override
  final BuiltList<int>? rawVal;
  @override
  final String? textVal;
  @override
  final BuiltList<String>? textArrayVal;
  @override
  final BuiltList<GTimeSeriesEntryIn>? timeSeriesVal;

  factory _$GDevValue([void Function(GDevValueBuilder)? updates]) =>
      (new GDevValueBuilder()..update(updates))._build();

  _$GDevValue._({
    this.intVal,
    this.scalarVal,
    this.scalarArrayVal,
    this.rawVal,
    this.textVal,
    this.textArrayVal,
    this.timeSeriesVal,
  }) : super._();

  @override
  GDevValue rebuild(void Function(GDevValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDevValueBuilder toBuilder() => new GDevValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDevValue &&
        intVal == other.intVal &&
        scalarVal == other.scalarVal &&
        scalarArrayVal == other.scalarArrayVal &&
        rawVal == other.rawVal &&
        textVal == other.textVal &&
        textArrayVal == other.textArrayVal &&
        timeSeriesVal == other.timeSeriesVal;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, intVal.hashCode);
    _$hash = $jc(_$hash, scalarVal.hashCode);
    _$hash = $jc(_$hash, scalarArrayVal.hashCode);
    _$hash = $jc(_$hash, rawVal.hashCode);
    _$hash = $jc(_$hash, textVal.hashCode);
    _$hash = $jc(_$hash, textArrayVal.hashCode);
    _$hash = $jc(_$hash, timeSeriesVal.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDevValue')
          ..add('intVal', intVal)
          ..add('scalarVal', scalarVal)
          ..add('scalarArrayVal', scalarArrayVal)
          ..add('rawVal', rawVal)
          ..add('textVal', textVal)
          ..add('textArrayVal', textArrayVal)
          ..add('timeSeriesVal', timeSeriesVal))
        .toString();
  }
}

class GDevValueBuilder implements Builder<GDevValue, GDevValueBuilder> {
  _$GDevValue? _$v;

  int? _intVal;
  int? get intVal => _$this._intVal;
  set intVal(int? intVal) => _$this._intVal = intVal;

  double? _scalarVal;
  double? get scalarVal => _$this._scalarVal;
  set scalarVal(double? scalarVal) => _$this._scalarVal = scalarVal;

  ListBuilder<double>? _scalarArrayVal;
  ListBuilder<double> get scalarArrayVal =>
      _$this._scalarArrayVal ??= new ListBuilder<double>();
  set scalarArrayVal(ListBuilder<double>? scalarArrayVal) =>
      _$this._scalarArrayVal = scalarArrayVal;

  ListBuilder<int>? _rawVal;
  ListBuilder<int> get rawVal => _$this._rawVal ??= new ListBuilder<int>();
  set rawVal(ListBuilder<int>? rawVal) => _$this._rawVal = rawVal;

  String? _textVal;
  String? get textVal => _$this._textVal;
  set textVal(String? textVal) => _$this._textVal = textVal;

  ListBuilder<String>? _textArrayVal;
  ListBuilder<String> get textArrayVal =>
      _$this._textArrayVal ??= new ListBuilder<String>();
  set textArrayVal(ListBuilder<String>? textArrayVal) =>
      _$this._textArrayVal = textArrayVal;

  ListBuilder<GTimeSeriesEntryIn>? _timeSeriesVal;
  ListBuilder<GTimeSeriesEntryIn> get timeSeriesVal =>
      _$this._timeSeriesVal ??= new ListBuilder<GTimeSeriesEntryIn>();
  set timeSeriesVal(ListBuilder<GTimeSeriesEntryIn>? timeSeriesVal) =>
      _$this._timeSeriesVal = timeSeriesVal;

  GDevValueBuilder();

  GDevValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _intVal = $v.intVal;
      _scalarVal = $v.scalarVal;
      _scalarArrayVal = $v.scalarArrayVal?.toBuilder();
      _rawVal = $v.rawVal?.toBuilder();
      _textVal = $v.textVal;
      _textArrayVal = $v.textArrayVal?.toBuilder();
      _timeSeriesVal = $v.timeSeriesVal?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDevValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDevValue;
  }

  @override
  void update(void Function(GDevValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDevValue build() => _build();

  _$GDevValue _build() {
    _$GDevValue _$result;
    try {
      _$result =
          _$v ??
          new _$GDevValue._(
            intVal: intVal,
            scalarVal: scalarVal,
            scalarArrayVal: _scalarArrayVal?.build(),
            rawVal: _rawVal?.build(),
            textVal: textVal,
            textArrayVal: _textArrayVal?.build(),
            timeSeriesVal: _timeSeriesVal?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scalarArrayVal';
        _scalarArrayVal?.build();
        _$failedField = 'rawVal';
        _rawVal?.build();

        _$failedField = 'textArrayVal';
        _textArrayVal?.build();
        _$failedField = 'timeSeriesVal';
        _timeSeriesVal?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GDevValue',
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

class _$GPlotConfigurationSnapshotIn extends GPlotConfigurationSnapshotIn {
  @override
  final int? configurationId;
  @override
  final String configurationName;
  @override
  final BuiltList<GChannelSettingSnapshotIn> channels;
  @override
  final double? xMin;
  @override
  final double? xMax;
  @override
  final double? startTime;
  @override
  final double? endTime;
  @override
  final double? timeDelta;
  @override
  final bool isScalar;
  @override
  final bool isOneShot;
  @override
  final bool isShowLabels;
  @override
  final bool isPersistent;
  @override
  final int dataLimit;
  @override
  final int? updateDelay;
  @override
  final int? nAcquisitions;
  @override
  final int? tclkEvent;

  factory _$GPlotConfigurationSnapshotIn([
    void Function(GPlotConfigurationSnapshotInBuilder)? updates,
  ]) => (new GPlotConfigurationSnapshotInBuilder()..update(updates))._build();

  _$GPlotConfigurationSnapshotIn._({
    this.configurationId,
    required this.configurationName,
    required this.channels,
    this.xMin,
    this.xMax,
    this.startTime,
    this.endTime,
    this.timeDelta,
    required this.isScalar,
    required this.isOneShot,
    required this.isShowLabels,
    required this.isPersistent,
    required this.dataLimit,
    this.updateDelay,
    this.nAcquisitions,
    this.tclkEvent,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      configurationName,
      r'GPlotConfigurationSnapshotIn',
      'configurationName',
    );
    BuiltValueNullFieldError.checkNotNull(
      channels,
      r'GPlotConfigurationSnapshotIn',
      'channels',
    );
    BuiltValueNullFieldError.checkNotNull(
      isScalar,
      r'GPlotConfigurationSnapshotIn',
      'isScalar',
    );
    BuiltValueNullFieldError.checkNotNull(
      isOneShot,
      r'GPlotConfigurationSnapshotIn',
      'isOneShot',
    );
    BuiltValueNullFieldError.checkNotNull(
      isShowLabels,
      r'GPlotConfigurationSnapshotIn',
      'isShowLabels',
    );
    BuiltValueNullFieldError.checkNotNull(
      isPersistent,
      r'GPlotConfigurationSnapshotIn',
      'isPersistent',
    );
    BuiltValueNullFieldError.checkNotNull(
      dataLimit,
      r'GPlotConfigurationSnapshotIn',
      'dataLimit',
    );
  }

  @override
  GPlotConfigurationSnapshotIn rebuild(
    void Function(GPlotConfigurationSnapshotInBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GPlotConfigurationSnapshotInBuilder toBuilder() =>
      new GPlotConfigurationSnapshotInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlotConfigurationSnapshotIn &&
        configurationId == other.configurationId &&
        configurationName == other.configurationName &&
        channels == other.channels &&
        xMin == other.xMin &&
        xMax == other.xMax &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        timeDelta == other.timeDelta &&
        isScalar == other.isScalar &&
        isOneShot == other.isOneShot &&
        isShowLabels == other.isShowLabels &&
        isPersistent == other.isPersistent &&
        dataLimit == other.dataLimit &&
        updateDelay == other.updateDelay &&
        nAcquisitions == other.nAcquisitions &&
        tclkEvent == other.tclkEvent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, configurationId.hashCode);
    _$hash = $jc(_$hash, configurationName.hashCode);
    _$hash = $jc(_$hash, channels.hashCode);
    _$hash = $jc(_$hash, xMin.hashCode);
    _$hash = $jc(_$hash, xMax.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, timeDelta.hashCode);
    _$hash = $jc(_$hash, isScalar.hashCode);
    _$hash = $jc(_$hash, isOneShot.hashCode);
    _$hash = $jc(_$hash, isShowLabels.hashCode);
    _$hash = $jc(_$hash, isPersistent.hashCode);
    _$hash = $jc(_$hash, dataLimit.hashCode);
    _$hash = $jc(_$hash, updateDelay.hashCode);
    _$hash = $jc(_$hash, nAcquisitions.hashCode);
    _$hash = $jc(_$hash, tclkEvent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPlotConfigurationSnapshotIn')
          ..add('configurationId', configurationId)
          ..add('configurationName', configurationName)
          ..add('channels', channels)
          ..add('xMin', xMin)
          ..add('xMax', xMax)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('timeDelta', timeDelta)
          ..add('isScalar', isScalar)
          ..add('isOneShot', isOneShot)
          ..add('isShowLabels', isShowLabels)
          ..add('isPersistent', isPersistent)
          ..add('dataLimit', dataLimit)
          ..add('updateDelay', updateDelay)
          ..add('nAcquisitions', nAcquisitions)
          ..add('tclkEvent', tclkEvent))
        .toString();
  }
}

class GPlotConfigurationSnapshotInBuilder
    implements
        Builder<
          GPlotConfigurationSnapshotIn,
          GPlotConfigurationSnapshotInBuilder
        > {
  _$GPlotConfigurationSnapshotIn? _$v;

  int? _configurationId;
  int? get configurationId => _$this._configurationId;
  set configurationId(int? configurationId) =>
      _$this._configurationId = configurationId;

  String? _configurationName;
  String? get configurationName => _$this._configurationName;
  set configurationName(String? configurationName) =>
      _$this._configurationName = configurationName;

  ListBuilder<GChannelSettingSnapshotIn>? _channels;
  ListBuilder<GChannelSettingSnapshotIn> get channels =>
      _$this._channels ??= new ListBuilder<GChannelSettingSnapshotIn>();
  set channels(ListBuilder<GChannelSettingSnapshotIn>? channels) =>
      _$this._channels = channels;

  double? _xMin;
  double? get xMin => _$this._xMin;
  set xMin(double? xMin) => _$this._xMin = xMin;

  double? _xMax;
  double? get xMax => _$this._xMax;
  set xMax(double? xMax) => _$this._xMax = xMax;

  double? _startTime;
  double? get startTime => _$this._startTime;
  set startTime(double? startTime) => _$this._startTime = startTime;

  double? _endTime;
  double? get endTime => _$this._endTime;
  set endTime(double? endTime) => _$this._endTime = endTime;

  double? _timeDelta;
  double? get timeDelta => _$this._timeDelta;
  set timeDelta(double? timeDelta) => _$this._timeDelta = timeDelta;

  bool? _isScalar;
  bool? get isScalar => _$this._isScalar;
  set isScalar(bool? isScalar) => _$this._isScalar = isScalar;

  bool? _isOneShot;
  bool? get isOneShot => _$this._isOneShot;
  set isOneShot(bool? isOneShot) => _$this._isOneShot = isOneShot;

  bool? _isShowLabels;
  bool? get isShowLabels => _$this._isShowLabels;
  set isShowLabels(bool? isShowLabels) => _$this._isShowLabels = isShowLabels;

  bool? _isPersistent;
  bool? get isPersistent => _$this._isPersistent;
  set isPersistent(bool? isPersistent) => _$this._isPersistent = isPersistent;

  int? _dataLimit;
  int? get dataLimit => _$this._dataLimit;
  set dataLimit(int? dataLimit) => _$this._dataLimit = dataLimit;

  int? _updateDelay;
  int? get updateDelay => _$this._updateDelay;
  set updateDelay(int? updateDelay) => _$this._updateDelay = updateDelay;

  int? _nAcquisitions;
  int? get nAcquisitions => _$this._nAcquisitions;
  set nAcquisitions(int? nAcquisitions) =>
      _$this._nAcquisitions = nAcquisitions;

  int? _tclkEvent;
  int? get tclkEvent => _$this._tclkEvent;
  set tclkEvent(int? tclkEvent) => _$this._tclkEvent = tclkEvent;

  GPlotConfigurationSnapshotInBuilder();

  GPlotConfigurationSnapshotInBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _configurationId = $v.configurationId;
      _configurationName = $v.configurationName;
      _channels = $v.channels.toBuilder();
      _xMin = $v.xMin;
      _xMax = $v.xMax;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _timeDelta = $v.timeDelta;
      _isScalar = $v.isScalar;
      _isOneShot = $v.isOneShot;
      _isShowLabels = $v.isShowLabels;
      _isPersistent = $v.isPersistent;
      _dataLimit = $v.dataLimit;
      _updateDelay = $v.updateDelay;
      _nAcquisitions = $v.nAcquisitions;
      _tclkEvent = $v.tclkEvent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlotConfigurationSnapshotIn other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlotConfigurationSnapshotIn;
  }

  @override
  void update(void Function(GPlotConfigurationSnapshotInBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPlotConfigurationSnapshotIn build() => _build();

  _$GPlotConfigurationSnapshotIn _build() {
    _$GPlotConfigurationSnapshotIn _$result;
    try {
      _$result =
          _$v ??
          new _$GPlotConfigurationSnapshotIn._(
            configurationId: configurationId,
            configurationName: BuiltValueNullFieldError.checkNotNull(
              configurationName,
              r'GPlotConfigurationSnapshotIn',
              'configurationName',
            ),
            channels: channels.build(),
            xMin: xMin,
            xMax: xMax,
            startTime: startTime,
            endTime: endTime,
            timeDelta: timeDelta,
            isScalar: BuiltValueNullFieldError.checkNotNull(
              isScalar,
              r'GPlotConfigurationSnapshotIn',
              'isScalar',
            ),
            isOneShot: BuiltValueNullFieldError.checkNotNull(
              isOneShot,
              r'GPlotConfigurationSnapshotIn',
              'isOneShot',
            ),
            isShowLabels: BuiltValueNullFieldError.checkNotNull(
              isShowLabels,
              r'GPlotConfigurationSnapshotIn',
              'isShowLabels',
            ),
            isPersistent: BuiltValueNullFieldError.checkNotNull(
              isPersistent,
              r'GPlotConfigurationSnapshotIn',
              'isPersistent',
            ),
            dataLimit: BuiltValueNullFieldError.checkNotNull(
              dataLimit,
              r'GPlotConfigurationSnapshotIn',
              'dataLimit',
            ),
            updateDelay: updateDelay,
            nAcquisitions: nAcquisitions,
            tclkEvent: tclkEvent,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'channels';
        channels.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GPlotConfigurationSnapshotIn',
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

class _$GTimeSeriesEntryIn extends GTimeSeriesEntryIn {
  @override
  final double stamp;
  @override
  final double value;

  factory _$GTimeSeriesEntryIn([
    void Function(GTimeSeriesEntryInBuilder)? updates,
  ]) => (new GTimeSeriesEntryInBuilder()..update(updates))._build();

  _$GTimeSeriesEntryIn._({required this.stamp, required this.value})
    : super._() {
    BuiltValueNullFieldError.checkNotNull(
      stamp,
      r'GTimeSeriesEntryIn',
      'stamp',
    );
    BuiltValueNullFieldError.checkNotNull(
      value,
      r'GTimeSeriesEntryIn',
      'value',
    );
  }

  @override
  GTimeSeriesEntryIn rebuild(
    void Function(GTimeSeriesEntryInBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GTimeSeriesEntryInBuilder toBuilder() =>
      new GTimeSeriesEntryInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTimeSeriesEntryIn &&
        stamp == other.stamp &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stamp.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTimeSeriesEntryIn')
          ..add('stamp', stamp)
          ..add('value', value))
        .toString();
  }
}

class GTimeSeriesEntryInBuilder
    implements Builder<GTimeSeriesEntryIn, GTimeSeriesEntryInBuilder> {
  _$GTimeSeriesEntryIn? _$v;

  double? _stamp;
  double? get stamp => _$this._stamp;
  set stamp(double? stamp) => _$this._stamp = stamp;

  double? _value;
  double? get value => _$this._value;
  set value(double? value) => _$this._value = value;

  GTimeSeriesEntryInBuilder();

  GTimeSeriesEntryInBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stamp = $v.stamp;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTimeSeriesEntryIn other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTimeSeriesEntryIn;
  }

  @override
  void update(void Function(GTimeSeriesEntryInBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTimeSeriesEntryIn build() => _build();

  _$GTimeSeriesEntryIn _build() {
    final _$result =
        _$v ??
        new _$GTimeSeriesEntryIn._(
          stamp: BuiltValueNullFieldError.checkNotNull(
            stamp,
            r'GTimeSeriesEntryIn',
            'stamp',
          ),
          value: BuiltValueNullFieldError.checkNotNull(
            value,
            r'GTimeSeriesEntryIn',
            'value',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GXformAvgExpr extends GXformAvgExpr {
  @override
  final GXformExpr expr;
  @override
  final int n;

  factory _$GXformAvgExpr([void Function(GXformAvgExprBuilder)? updates]) =>
      (new GXformAvgExprBuilder()..update(updates))._build();

  _$GXformAvgExpr._({required this.expr, required this.n}) : super._() {
    BuiltValueNullFieldError.checkNotNull(expr, r'GXformAvgExpr', 'expr');
    BuiltValueNullFieldError.checkNotNull(n, r'GXformAvgExpr', 'n');
  }

  @override
  GXformAvgExpr rebuild(void Function(GXformAvgExprBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GXformAvgExprBuilder toBuilder() => new GXformAvgExprBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GXformAvgExpr && expr == other.expr && n == other.n;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, expr.hashCode);
    _$hash = $jc(_$hash, n.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GXformAvgExpr')
          ..add('expr', expr)
          ..add('n', n))
        .toString();
  }
}

class GXformAvgExprBuilder
    implements Builder<GXformAvgExpr, GXformAvgExprBuilder> {
  _$GXformAvgExpr? _$v;

  GXformExprBuilder? _expr;
  GXformExprBuilder get expr => _$this._expr ??= new GXformExprBuilder();
  set expr(GXformExprBuilder? expr) => _$this._expr = expr;

  int? _n;
  int? get n => _$this._n;
  set n(int? n) => _$this._n = n;

  GXformAvgExprBuilder();

  GXformAvgExprBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _expr = $v.expr.toBuilder();
      _n = $v.n;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GXformAvgExpr other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GXformAvgExpr;
  }

  @override
  void update(void Function(GXformAvgExprBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GXformAvgExpr build() => _build();

  _$GXformAvgExpr _build() {
    _$GXformAvgExpr _$result;
    try {
      _$result =
          _$v ??
          new _$GXformAvgExpr._(
            expr: expr.build(),
            n: BuiltValueNullFieldError.checkNotNull(n, r'GXformAvgExpr', 'n'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expr';
        expr.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GXformAvgExpr',
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

class _$GXformDeviceExpr extends GXformDeviceExpr {
  @override
  final String device;

  factory _$GXformDeviceExpr([
    void Function(GXformDeviceExprBuilder)? updates,
  ]) => (new GXformDeviceExprBuilder()..update(updates))._build();

  _$GXformDeviceExpr._({required this.device}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      device,
      r'GXformDeviceExpr',
      'device',
    );
  }

  @override
  GXformDeviceExpr rebuild(void Function(GXformDeviceExprBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GXformDeviceExprBuilder toBuilder() =>
      new GXformDeviceExprBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GXformDeviceExpr && device == other.device;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, device.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GXformDeviceExpr')
      ..add('device', device)).toString();
  }
}

class GXformDeviceExprBuilder
    implements Builder<GXformDeviceExpr, GXformDeviceExprBuilder> {
  _$GXformDeviceExpr? _$v;

  String? _device;
  String? get device => _$this._device;
  set device(String? device) => _$this._device = device;

  GXformDeviceExprBuilder();

  GXformDeviceExprBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _device = $v.device;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GXformDeviceExpr other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GXformDeviceExpr;
  }

  @override
  void update(void Function(GXformDeviceExprBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GXformDeviceExpr build() => _build();

  _$GXformDeviceExpr _build() {
    final _$result =
        _$v ??
        new _$GXformDeviceExpr._(
          device: BuiltValueNullFieldError.checkNotNull(
            device,
            r'GXformDeviceExpr',
            'device',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GXformExpr extends GXformExpr {
  @override
  final GXformDeviceExpr? devEx;
  @override
  final GXformAvgExpr? avgEx;

  factory _$GXformExpr([void Function(GXformExprBuilder)? updates]) =>
      (new GXformExprBuilder()..update(updates))._build();

  _$GXformExpr._({this.devEx, this.avgEx}) : super._();

  @override
  GXformExpr rebuild(void Function(GXformExprBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GXformExprBuilder toBuilder() => new GXformExprBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GXformExpr && devEx == other.devEx && avgEx == other.avgEx;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, devEx.hashCode);
    _$hash = $jc(_$hash, avgEx.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GXformExpr')
          ..add('devEx', devEx)
          ..add('avgEx', avgEx))
        .toString();
  }
}

class GXformExprBuilder implements Builder<GXformExpr, GXformExprBuilder> {
  _$GXformExpr? _$v;

  GXformDeviceExprBuilder? _devEx;
  GXformDeviceExprBuilder get devEx =>
      _$this._devEx ??= new GXformDeviceExprBuilder();
  set devEx(GXformDeviceExprBuilder? devEx) => _$this._devEx = devEx;

  GXformAvgExprBuilder? _avgEx;
  GXformAvgExprBuilder get avgEx =>
      _$this._avgEx ??= new GXformAvgExprBuilder();
  set avgEx(GXformAvgExprBuilder? avgEx) => _$this._avgEx = avgEx;

  GXformExprBuilder();

  GXformExprBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _devEx = $v.devEx?.toBuilder();
      _avgEx = $v.avgEx?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GXformExpr other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GXformExpr;
  }

  @override
  void update(void Function(GXformExprBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GXformExpr build() => _build();

  _$GXformExpr _build() {
    _$GXformExpr _$result;
    try {
      _$result =
          _$v ??
          new _$GXformExpr._(devEx: _devEx?.build(), avgEx: _avgEx?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'devEx';
        _devEx?.build();
        _$failedField = 'avgEx';
        _avgEx?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GXformExpr',
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

class _$GXformRequest extends GXformRequest {
  @override
  final String event;
  @override
  final GXformExpr expr;

  factory _$GXformRequest([void Function(GXformRequestBuilder)? updates]) =>
      (new GXformRequestBuilder()..update(updates))._build();

  _$GXformRequest._({required this.event, required this.expr}) : super._() {
    BuiltValueNullFieldError.checkNotNull(event, r'GXformRequest', 'event');
    BuiltValueNullFieldError.checkNotNull(expr, r'GXformRequest', 'expr');
  }

  @override
  GXformRequest rebuild(void Function(GXformRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GXformRequestBuilder toBuilder() => new GXformRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GXformRequest && event == other.event && expr == other.expr;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jc(_$hash, expr.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GXformRequest')
          ..add('event', event)
          ..add('expr', expr))
        .toString();
  }
}

class GXformRequestBuilder
    implements Builder<GXformRequest, GXformRequestBuilder> {
  _$GXformRequest? _$v;

  String? _event;
  String? get event => _$this._event;
  set event(String? event) => _$this._event = event;

  GXformExprBuilder? _expr;
  GXformExprBuilder get expr => _$this._expr ??= new GXformExprBuilder();
  set expr(GXformExprBuilder? expr) => _$this._expr = expr;

  GXformRequestBuilder();

  GXformRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _event = $v.event;
      _expr = $v.expr.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GXformRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GXformRequest;
  }

  @override
  void update(void Function(GXformRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GXformRequest build() => _build();

  _$GXformRequest _build() {
    _$GXformRequest _$result;
    try {
      _$result =
          _$v ??
          new _$GXformRequest._(
            event: BuiltValueNullFieldError.checkNotNull(
              event,
              r'GXformRequest',
              'event',
            ),
            expr: expr.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expr';
        expr.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GXformRequest',
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
