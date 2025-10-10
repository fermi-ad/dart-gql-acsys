// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_plot_config.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeletePlotConfigVars> _$gDeletePlotConfigVarsSerializer =
    new _$GDeletePlotConfigVarsSerializer();

class _$GDeletePlotConfigVarsSerializer
    implements StructuredSerializer<GDeletePlotConfigVars> {
  @override
  final Iterable<Type> types = const [
    GDeletePlotConfigVars,
    _$GDeletePlotConfigVars,
  ];
  @override
  final String wireName = 'GDeletePlotConfigVars';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GDeletePlotConfigVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GDeletePlotConfigVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GDeletePlotConfigVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
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

class _$GDeletePlotConfigVars extends GDeletePlotConfigVars {
  @override
  final int id;

  factory _$GDeletePlotConfigVars([
    void Function(GDeletePlotConfigVarsBuilder)? updates,
  ]) => (new GDeletePlotConfigVarsBuilder()..update(updates))._build();

  _$GDeletePlotConfigVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GDeletePlotConfigVars', 'id');
  }

  @override
  GDeletePlotConfigVars rebuild(
    void Function(GDeletePlotConfigVarsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GDeletePlotConfigVarsBuilder toBuilder() =>
      new GDeletePlotConfigVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeletePlotConfigVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GDeletePlotConfigVars')
      ..add('id', id)).toString();
  }
}

class GDeletePlotConfigVarsBuilder
    implements Builder<GDeletePlotConfigVars, GDeletePlotConfigVarsBuilder> {
  _$GDeletePlotConfigVars? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  GDeletePlotConfigVarsBuilder();

  GDeletePlotConfigVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeletePlotConfigVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeletePlotConfigVars;
  }

  @override
  void update(void Function(GDeletePlotConfigVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeletePlotConfigVars build() => _build();

  _$GDeletePlotConfigVars _build() {
    final _$result =
        _$v ??
        new _$GDeletePlotConfigVars._(
          id: BuiltValueNullFieldError.checkNotNull(
            id,
            r'GDeletePlotConfigVars',
            'id',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
