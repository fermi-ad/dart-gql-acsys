// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_users_config.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSetUsersConfigData> _$gSetUsersConfigDataSerializer =
    new _$GSetUsersConfigDataSerializer();
Serializer<GSetUsersConfigData_usersConfiguration>
_$gSetUsersConfigDataUsersConfigurationSerializer =
    new _$GSetUsersConfigData_usersConfigurationSerializer();

class _$GSetUsersConfigDataSerializer
    implements StructuredSerializer<GSetUsersConfigData> {
  @override
  final Iterable<Type> types = const [
    GSetUsersConfigData,
    _$GSetUsersConfigData,
  ];
  @override
  final String wireName = 'GSetUsersConfigData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GSetUsersConfigData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'usersConfiguration',
      serializers.serialize(
        object.usersConfiguration,
        specifiedType: const FullType(GSetUsersConfigData_usersConfiguration),
      ),
    ];

    return result;
  }

  @override
  GSetUsersConfigData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GSetUsersConfigDataBuilder();

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
        case 'usersConfiguration':
          result.usersConfiguration.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                    GSetUsersConfigData_usersConfiguration,
                  ),
                )!
                as GSetUsersConfigData_usersConfiguration,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GSetUsersConfigData_usersConfigurationSerializer
    implements StructuredSerializer<GSetUsersConfigData_usersConfiguration> {
  @override
  final Iterable<Type> types = const [
    GSetUsersConfigData_usersConfiguration,
    _$GSetUsersConfigData_usersConfiguration,
  ];
  @override
  final String wireName = 'GSetUsersConfigData_usersConfiguration';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GSetUsersConfigData_usersConfiguration object, {
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
  GSetUsersConfigData_usersConfiguration deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GSetUsersConfigData_usersConfigurationBuilder();

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

class _$GSetUsersConfigData extends GSetUsersConfigData {
  @override
  final String G__typename;
  @override
  final GSetUsersConfigData_usersConfiguration usersConfiguration;

  factory _$GSetUsersConfigData([
    void Function(GSetUsersConfigDataBuilder)? updates,
  ]) => (new GSetUsersConfigDataBuilder()..update(updates))._build();

  _$GSetUsersConfigData._({
    required this.G__typename,
    required this.usersConfiguration,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GSetUsersConfigData',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      usersConfiguration,
      r'GSetUsersConfigData',
      'usersConfiguration',
    );
  }

  @override
  GSetUsersConfigData rebuild(
    void Function(GSetUsersConfigDataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GSetUsersConfigDataBuilder toBuilder() =>
      new GSetUsersConfigDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSetUsersConfigData &&
        G__typename == other.G__typename &&
        usersConfiguration == other.usersConfiguration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, usersConfiguration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSetUsersConfigData')
          ..add('G__typename', G__typename)
          ..add('usersConfiguration', usersConfiguration))
        .toString();
  }
}

class GSetUsersConfigDataBuilder
    implements Builder<GSetUsersConfigData, GSetUsersConfigDataBuilder> {
  _$GSetUsersConfigData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GSetUsersConfigData_usersConfigurationBuilder? _usersConfiguration;
  GSetUsersConfigData_usersConfigurationBuilder get usersConfiguration =>
      _$this._usersConfiguration ??=
          new GSetUsersConfigData_usersConfigurationBuilder();
  set usersConfiguration(
    GSetUsersConfigData_usersConfigurationBuilder? usersConfiguration,
  ) => _$this._usersConfiguration = usersConfiguration;

  GSetUsersConfigDataBuilder() {
    GSetUsersConfigData._initializeBuilder(this);
  }

  GSetUsersConfigDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _usersConfiguration = $v.usersConfiguration.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSetUsersConfigData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSetUsersConfigData;
  }

  @override
  void update(void Function(GSetUsersConfigDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSetUsersConfigData build() => _build();

  _$GSetUsersConfigData _build() {
    _$GSetUsersConfigData _$result;
    try {
      _$result =
          _$v ??
          new _$GSetUsersConfigData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GSetUsersConfigData',
              'G__typename',
            ),
            usersConfiguration: usersConfiguration.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usersConfiguration';
        usersConfiguration.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GSetUsersConfigData',
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

class _$GSetUsersConfigData_usersConfiguration
    extends GSetUsersConfigData_usersConfiguration {
  @override
  final String G__typename;
  @override
  final int status;

  factory _$GSetUsersConfigData_usersConfiguration([
    void Function(GSetUsersConfigData_usersConfigurationBuilder)? updates,
  ]) =>
      (new GSetUsersConfigData_usersConfigurationBuilder()..update(updates))
          ._build();

  _$GSetUsersConfigData_usersConfiguration._({
    required this.G__typename,
    required this.status,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GSetUsersConfigData_usersConfiguration',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      status,
      r'GSetUsersConfigData_usersConfiguration',
      'status',
    );
  }

  @override
  GSetUsersConfigData_usersConfiguration rebuild(
    void Function(GSetUsersConfigData_usersConfigurationBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GSetUsersConfigData_usersConfigurationBuilder toBuilder() =>
      new GSetUsersConfigData_usersConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSetUsersConfigData_usersConfiguration &&
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
            r'GSetUsersConfigData_usersConfiguration',
          )
          ..add('G__typename', G__typename)
          ..add('status', status))
        .toString();
  }
}

class GSetUsersConfigData_usersConfigurationBuilder
    implements
        Builder<
          GSetUsersConfigData_usersConfiguration,
          GSetUsersConfigData_usersConfigurationBuilder
        > {
  _$GSetUsersConfigData_usersConfiguration? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  GSetUsersConfigData_usersConfigurationBuilder() {
    GSetUsersConfigData_usersConfiguration._initializeBuilder(this);
  }

  GSetUsersConfigData_usersConfigurationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSetUsersConfigData_usersConfiguration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSetUsersConfigData_usersConfiguration;
  }

  @override
  void update(
    void Function(GSetUsersConfigData_usersConfigurationBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GSetUsersConfigData_usersConfiguration build() => _build();

  _$GSetUsersConfigData_usersConfiguration _build() {
    final _$result =
        _$v ??
        new _$GSetUsersConfigData_usersConfiguration._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GSetUsersConfigData_usersConfiguration',
            'G__typename',
          ),
          status: BuiltValueNullFieldError.checkNotNull(
            status,
            r'GSetUsersConfigData_usersConfiguration',
            'status',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
