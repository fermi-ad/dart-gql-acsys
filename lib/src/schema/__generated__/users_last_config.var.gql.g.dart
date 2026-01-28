// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_last_config.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUsersLastConfigVars> _$gUsersLastConfigVarsSerializer =
    _$GUsersLastConfigVarsSerializer();

class _$GUsersLastConfigVarsSerializer
    implements StructuredSerializer<GUsersLastConfigVars> {
  @override
  final Iterable<Type> types = const [
    GUsersLastConfigVars,
    _$GUsersLastConfigVars,
  ];
  @override
  final String wireName = 'GUsersLastConfigVars';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GUsersLastConfigVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return <Object?>[];
  }

  @override
  GUsersLastConfigVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return GUsersLastConfigVarsBuilder().build();
  }
}

class _$GUsersLastConfigVars extends GUsersLastConfigVars {
  factory _$GUsersLastConfigVars([
    void Function(GUsersLastConfigVarsBuilder)? updates,
  ]) => (GUsersLastConfigVarsBuilder()..update(updates))._build();

  _$GUsersLastConfigVars._() : super._();
  @override
  GUsersLastConfigVars rebuild(
    void Function(GUsersLastConfigVarsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GUsersLastConfigVarsBuilder toBuilder() =>
      GUsersLastConfigVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUsersLastConfigVars;
  }

  @override
  int get hashCode {
    return 462711812;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GUsersLastConfigVars').toString();
  }
}

class GUsersLastConfigVarsBuilder
    implements Builder<GUsersLastConfigVars, GUsersLastConfigVarsBuilder> {
  _$GUsersLastConfigVars? _$v;

  GUsersLastConfigVarsBuilder();

  @override
  void replace(GUsersLastConfigVars other) {
    _$v = other as _$GUsersLastConfigVars;
  }

  @override
  void update(void Function(GUsersLastConfigVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUsersLastConfigVars build() => _build();

  _$GUsersLastConfigVars _build() {
    final _$result = _$v ?? _$GUsersLastConfigVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
