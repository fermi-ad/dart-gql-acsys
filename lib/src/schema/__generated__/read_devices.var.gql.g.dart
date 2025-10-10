// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_devices.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReadDevicesVars> _$gReadDevicesVarsSerializer =
    new _$GReadDevicesVarsSerializer();

class _$GReadDevicesVarsSerializer
    implements StructuredSerializer<GReadDevicesVars> {
  @override
  final Iterable<Type> types = const [GReadDevicesVars, _$GReadDevicesVars];
  @override
  final String wireName = 'GReadDevicesVars';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GReadDevicesVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'devList',
      serializers.serialize(
        object.devList,
        specifiedType: const FullType(BuiltList, const [
          const FullType(String),
        ]),
      ),
    ];

    return result;
  }

  @override
  GReadDevicesVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GReadDevicesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'devList':
          result.devList.replace(
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

class _$GReadDevicesVars extends GReadDevicesVars {
  @override
  final BuiltList<String> devList;

  factory _$GReadDevicesVars([
    void Function(GReadDevicesVarsBuilder)? updates,
  ]) => (new GReadDevicesVarsBuilder()..update(updates))._build();

  _$GReadDevicesVars._({required this.devList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      devList,
      r'GReadDevicesVars',
      'devList',
    );
  }

  @override
  GReadDevicesVars rebuild(void Function(GReadDevicesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReadDevicesVarsBuilder toBuilder() =>
      new GReadDevicesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadDevicesVars && devList == other.devList;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, devList.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReadDevicesVars')
      ..add('devList', devList)).toString();
  }
}

class GReadDevicesVarsBuilder
    implements Builder<GReadDevicesVars, GReadDevicesVarsBuilder> {
  _$GReadDevicesVars? _$v;

  ListBuilder<String>? _devList;
  ListBuilder<String> get devList =>
      _$this._devList ??= new ListBuilder<String>();
  set devList(ListBuilder<String>? devList) => _$this._devList = devList;

  GReadDevicesVarsBuilder();

  GReadDevicesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _devList = $v.devList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadDevicesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReadDevicesVars;
  }

  @override
  void update(void Function(GReadDevicesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReadDevicesVars build() => _build();

  _$GReadDevicesVars _build() {
    _$GReadDevicesVars _$result;
    try {
      _$result = _$v ?? new _$GReadDevicesVars._(devList: devList.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'devList';
        devList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GReadDevicesVars',
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
