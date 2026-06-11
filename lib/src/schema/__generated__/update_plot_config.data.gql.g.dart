// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_plot_config.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdatePlotConfigData> _$gUpdatePlotConfigDataSerializer =
    _$GUpdatePlotConfigDataSerializer();

class _$GUpdatePlotConfigDataSerializer
    implements StructuredSerializer<GUpdatePlotConfigData> {
  @override
  final Iterable<Type> types = const [
    GUpdatePlotConfigData,
    _$GUpdatePlotConfigData,
  ];
  @override
  final String wireName = 'GUpdatePlotConfigData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GUpdatePlotConfigData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
    ];
    Object? value;
    value = object.updatePlotConfiguration;
    if (value != null) {
      result
        ..add('updatePlotConfiguration')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GUpdatePlotConfigData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GUpdatePlotConfigDataBuilder();

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
        case 'updatePlotConfiguration':
          result.updatePlotConfiguration =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdatePlotConfigData extends GUpdatePlotConfigData {
  @override
  final String G__typename;
  @override
  final int? updatePlotConfiguration;

  factory _$GUpdatePlotConfigData([
    void Function(GUpdatePlotConfigDataBuilder)? updates,
  ]) => (GUpdatePlotConfigDataBuilder()..update(updates))._build();

  _$GUpdatePlotConfigData._({
    required this.G__typename,
    this.updatePlotConfiguration,
  }) : super._();
  @override
  GUpdatePlotConfigData rebuild(
    void Function(GUpdatePlotConfigDataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GUpdatePlotConfigDataBuilder toBuilder() =>
      GUpdatePlotConfigDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdatePlotConfigData &&
        G__typename == other.G__typename &&
        updatePlotConfiguration == other.updatePlotConfiguration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updatePlotConfiguration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdatePlotConfigData')
          ..add('G__typename', G__typename)
          ..add('updatePlotConfiguration', updatePlotConfiguration))
        .toString();
  }
}

class GUpdatePlotConfigDataBuilder
    implements Builder<GUpdatePlotConfigData, GUpdatePlotConfigDataBuilder> {
  _$GUpdatePlotConfigData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _updatePlotConfiguration;
  int? get updatePlotConfiguration => _$this._updatePlotConfiguration;
  set updatePlotConfiguration(int? updatePlotConfiguration) =>
      _$this._updatePlotConfiguration = updatePlotConfiguration;

  GUpdatePlotConfigDataBuilder() {
    GUpdatePlotConfigData._initializeBuilder(this);
  }

  GUpdatePlotConfigDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updatePlotConfiguration = $v.updatePlotConfiguration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdatePlotConfigData other) {
    _$v = other as _$GUpdatePlotConfigData;
  }

  @override
  void update(void Function(GUpdatePlotConfigDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdatePlotConfigData build() => _build();

  _$GUpdatePlotConfigData _build() {
    final _$result =
        _$v ??
        _$GUpdatePlotConfigData._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GUpdatePlotConfigData',
            'G__typename',
          ),
          updatePlotConfiguration: updatePlotConfiguration,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
