// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_configs.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPlotConfigsVars> _$gPlotConfigsVarsSerializer =
    new _$GPlotConfigsVarsSerializer();

class _$GPlotConfigsVarsSerializer
    implements StructuredSerializer<GPlotConfigsVars> {
  @override
  final Iterable<Type> types = const [GPlotConfigsVars, _$GPlotConfigsVars];
  @override
  final String wireName = 'GPlotConfigsVars';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GPlotConfigsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GPlotConfigsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GPlotConfigsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPlotConfigsVars extends GPlotConfigsVars {
  @override
  final int? id;

  factory _$GPlotConfigsVars([
    void Function(GPlotConfigsVarsBuilder)? updates,
  ]) => (new GPlotConfigsVarsBuilder()..update(updates))._build();

  _$GPlotConfigsVars._({this.id}) : super._();

  @override
  GPlotConfigsVars rebuild(void Function(GPlotConfigsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPlotConfigsVarsBuilder toBuilder() =>
      new GPlotConfigsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPlotConfigsVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPlotConfigsVars')
      ..add('id', id)).toString();
  }
}

class GPlotConfigsVarsBuilder
    implements Builder<GPlotConfigsVars, GPlotConfigsVarsBuilder> {
  _$GPlotConfigsVars? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  GPlotConfigsVarsBuilder();

  GPlotConfigsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPlotConfigsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPlotConfigsVars;
  }

  @override
  void update(void Function(GPlotConfigsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPlotConfigsVars build() => _build();

  _$GPlotConfigsVars _build() {
    final _$result = _$v ?? new _$GPlotConfigsVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
