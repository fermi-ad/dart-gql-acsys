// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_plot.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStartPlotVars> _$gStartPlotVarsSerializer =
    _$GStartPlotVarsSerializer();

class _$GStartPlotVarsSerializer
    implements StructuredSerializer<GStartPlotVars> {
  @override
  final Iterable<Type> types = const [GStartPlotVars, _$GStartPlotVars];
  @override
  final String wireName = 'GStartPlotVars';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GStartPlotVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'drfList',
      serializers.serialize(
        object.drfList,
        specifiedType: const FullType(BuiltList, const [
          const FullType(String),
        ]),
      ),
    ];
    Object? value;
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
    value = object.windowSize;
    if (value != null) {
      result
        ..add('windowSize')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.triggerEvent;
    if (value != null) {
      result
        ..add('triggerEvent')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    return result;
  }

  @override
  GStartPlotVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GStartPlotVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'drfList':
          result.drfList.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(String),
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
        case 'windowSize':
          result.windowSize =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
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
        case 'triggerEvent':
          result.triggerEvent =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
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
      }
    }

    return result.build();
  }
}

class _$GStartPlotVars extends GStartPlotVars {
  @override
  final BuiltList<String> drfList;
  @override
  final double? xMin;
  @override
  final double? xMax;
  @override
  final int? windowSize;
  @override
  final int? updateDelay;
  @override
  final int? nAcquisitions;
  @override
  final int? triggerEvent;
  @override
  final double? startTime;
  @override
  final double? endTime;

  factory _$GStartPlotVars([void Function(GStartPlotVarsBuilder)? updates]) =>
      (GStartPlotVarsBuilder()..update(updates))._build();

  _$GStartPlotVars._({
    required this.drfList,
    this.xMin,
    this.xMax,
    this.windowSize,
    this.updateDelay,
    this.nAcquisitions,
    this.triggerEvent,
    this.startTime,
    this.endTime,
  }) : super._();
  @override
  GStartPlotVars rebuild(void Function(GStartPlotVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStartPlotVarsBuilder toBuilder() => GStartPlotVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStartPlotVars &&
        drfList == other.drfList &&
        xMin == other.xMin &&
        xMax == other.xMax &&
        windowSize == other.windowSize &&
        updateDelay == other.updateDelay &&
        nAcquisitions == other.nAcquisitions &&
        triggerEvent == other.triggerEvent &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, drfList.hashCode);
    _$hash = $jc(_$hash, xMin.hashCode);
    _$hash = $jc(_$hash, xMax.hashCode);
    _$hash = $jc(_$hash, windowSize.hashCode);
    _$hash = $jc(_$hash, updateDelay.hashCode);
    _$hash = $jc(_$hash, nAcquisitions.hashCode);
    _$hash = $jc(_$hash, triggerEvent.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStartPlotVars')
          ..add('drfList', drfList)
          ..add('xMin', xMin)
          ..add('xMax', xMax)
          ..add('windowSize', windowSize)
          ..add('updateDelay', updateDelay)
          ..add('nAcquisitions', nAcquisitions)
          ..add('triggerEvent', triggerEvent)
          ..add('startTime', startTime)
          ..add('endTime', endTime))
        .toString();
  }
}

class GStartPlotVarsBuilder
    implements Builder<GStartPlotVars, GStartPlotVarsBuilder> {
  _$GStartPlotVars? _$v;

  ListBuilder<String>? _drfList;
  ListBuilder<String> get drfList => _$this._drfList ??= ListBuilder<String>();
  set drfList(ListBuilder<String>? drfList) => _$this._drfList = drfList;

  double? _xMin;
  double? get xMin => _$this._xMin;
  set xMin(double? xMin) => _$this._xMin = xMin;

  double? _xMax;
  double? get xMax => _$this._xMax;
  set xMax(double? xMax) => _$this._xMax = xMax;

  int? _windowSize;
  int? get windowSize => _$this._windowSize;
  set windowSize(int? windowSize) => _$this._windowSize = windowSize;

  int? _updateDelay;
  int? get updateDelay => _$this._updateDelay;
  set updateDelay(int? updateDelay) => _$this._updateDelay = updateDelay;

  int? _nAcquisitions;
  int? get nAcquisitions => _$this._nAcquisitions;
  set nAcquisitions(int? nAcquisitions) =>
      _$this._nAcquisitions = nAcquisitions;

  int? _triggerEvent;
  int? get triggerEvent => _$this._triggerEvent;
  set triggerEvent(int? triggerEvent) => _$this._triggerEvent = triggerEvent;

  double? _startTime;
  double? get startTime => _$this._startTime;
  set startTime(double? startTime) => _$this._startTime = startTime;

  double? _endTime;
  double? get endTime => _$this._endTime;
  set endTime(double? endTime) => _$this._endTime = endTime;

  GStartPlotVarsBuilder();

  GStartPlotVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _drfList = $v.drfList.toBuilder();
      _xMin = $v.xMin;
      _xMax = $v.xMax;
      _windowSize = $v.windowSize;
      _updateDelay = $v.updateDelay;
      _nAcquisitions = $v.nAcquisitions;
      _triggerEvent = $v.triggerEvent;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStartPlotVars other) {
    _$v = other as _$GStartPlotVars;
  }

  @override
  void update(void Function(GStartPlotVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStartPlotVars build() => _build();

  _$GStartPlotVars _build() {
    _$GStartPlotVars _$result;
    try {
      _$result =
          _$v ??
          _$GStartPlotVars._(
            drfList: drfList.build(),
            xMin: xMin,
            xMax: xMax,
            windowSize: windowSize,
            updateDelay: updateDelay,
            nAcquisitions: nAcquisitions,
            triggerEvent: triggerEvent,
            startTime: startTime,
            endTime: endTime,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'drfList';
        drfList.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'GStartPlotVars',
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
