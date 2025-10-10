// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_plot_config.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeletePlotConfigData> _$gDeletePlotConfigDataSerializer =
    new _$GDeletePlotConfigDataSerializer();
Serializer<GDeletePlotConfigData_deletePlotConfiguration>
_$gDeletePlotConfigDataDeletePlotConfigurationSerializer =
    new _$GDeletePlotConfigData_deletePlotConfigurationSerializer();

class _$GDeletePlotConfigDataSerializer
    implements StructuredSerializer<GDeletePlotConfigData> {
  @override
  final Iterable<Type> types = const [
    GDeletePlotConfigData,
    _$GDeletePlotConfigData,
  ];
  @override
  final String wireName = 'GDeletePlotConfigData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GDeletePlotConfigData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(
        object.G__typename,
        specifiedType: const FullType(String),
      ),
      'deletePlotConfiguration',
      serializers.serialize(
        object.deletePlotConfiguration,
        specifiedType: const FullType(
          GDeletePlotConfigData_deletePlotConfiguration,
        ),
      ),
    ];

    return result;
  }

  @override
  GDeletePlotConfigData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GDeletePlotConfigDataBuilder();

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
        case 'deletePlotConfiguration':
          result.deletePlotConfiguration.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                    GDeletePlotConfigData_deletePlotConfiguration,
                  ),
                )!
                as GDeletePlotConfigData_deletePlotConfiguration,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$GDeletePlotConfigData_deletePlotConfigurationSerializer
    implements
        StructuredSerializer<GDeletePlotConfigData_deletePlotConfiguration> {
  @override
  final Iterable<Type> types = const [
    GDeletePlotConfigData_deletePlotConfiguration,
    _$GDeletePlotConfigData_deletePlotConfiguration,
  ];
  @override
  final String wireName = 'GDeletePlotConfigData_deletePlotConfiguration';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GDeletePlotConfigData_deletePlotConfiguration object, {
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
  GDeletePlotConfigData_deletePlotConfiguration deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = new GDeletePlotConfigData_deletePlotConfigurationBuilder();

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

class _$GDeletePlotConfigData extends GDeletePlotConfigData {
  @override
  final String G__typename;
  @override
  final GDeletePlotConfigData_deletePlotConfiguration deletePlotConfiguration;

  factory _$GDeletePlotConfigData([
    void Function(GDeletePlotConfigDataBuilder)? updates,
  ]) => (new GDeletePlotConfigDataBuilder()..update(updates))._build();

  _$GDeletePlotConfigData._({
    required this.G__typename,
    required this.deletePlotConfiguration,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GDeletePlotConfigData',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      deletePlotConfiguration,
      r'GDeletePlotConfigData',
      'deletePlotConfiguration',
    );
  }

  @override
  GDeletePlotConfigData rebuild(
    void Function(GDeletePlotConfigDataBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GDeletePlotConfigDataBuilder toBuilder() =>
      new GDeletePlotConfigDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeletePlotConfigData &&
        G__typename == other.G__typename &&
        deletePlotConfiguration == other.deletePlotConfiguration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deletePlotConfiguration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeletePlotConfigData')
          ..add('G__typename', G__typename)
          ..add('deletePlotConfiguration', deletePlotConfiguration))
        .toString();
  }
}

class GDeletePlotConfigDataBuilder
    implements Builder<GDeletePlotConfigData, GDeletePlotConfigDataBuilder> {
  _$GDeletePlotConfigData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeletePlotConfigData_deletePlotConfigurationBuilder?
  _deletePlotConfiguration;
  GDeletePlotConfigData_deletePlotConfigurationBuilder
  get deletePlotConfiguration =>
      _$this._deletePlotConfiguration ??=
          new GDeletePlotConfigData_deletePlotConfigurationBuilder();
  set deletePlotConfiguration(
    GDeletePlotConfigData_deletePlotConfigurationBuilder?
    deletePlotConfiguration,
  ) => _$this._deletePlotConfiguration = deletePlotConfiguration;

  GDeletePlotConfigDataBuilder() {
    GDeletePlotConfigData._initializeBuilder(this);
  }

  GDeletePlotConfigDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deletePlotConfiguration = $v.deletePlotConfiguration.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeletePlotConfigData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeletePlotConfigData;
  }

  @override
  void update(void Function(GDeletePlotConfigDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeletePlotConfigData build() => _build();

  _$GDeletePlotConfigData _build() {
    _$GDeletePlotConfigData _$result;
    try {
      _$result =
          _$v ??
          new _$GDeletePlotConfigData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GDeletePlotConfigData',
              'G__typename',
            ),
            deletePlotConfiguration: deletePlotConfiguration.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deletePlotConfiguration';
        deletePlotConfiguration.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GDeletePlotConfigData',
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

class _$GDeletePlotConfigData_deletePlotConfiguration
    extends GDeletePlotConfigData_deletePlotConfiguration {
  @override
  final String G__typename;
  @override
  final int status;

  factory _$GDeletePlotConfigData_deletePlotConfiguration([
    void Function(GDeletePlotConfigData_deletePlotConfigurationBuilder)?
    updates,
  ]) =>
      (new GDeletePlotConfigData_deletePlotConfigurationBuilder()
            ..update(updates))
          ._build();

  _$GDeletePlotConfigData_deletePlotConfiguration._({
    required this.G__typename,
    required this.status,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      G__typename,
      r'GDeletePlotConfigData_deletePlotConfiguration',
      'G__typename',
    );
    BuiltValueNullFieldError.checkNotNull(
      status,
      r'GDeletePlotConfigData_deletePlotConfiguration',
      'status',
    );
  }

  @override
  GDeletePlotConfigData_deletePlotConfiguration rebuild(
    void Function(GDeletePlotConfigData_deletePlotConfigurationBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GDeletePlotConfigData_deletePlotConfigurationBuilder toBuilder() =>
      new GDeletePlotConfigData_deletePlotConfigurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeletePlotConfigData_deletePlotConfiguration &&
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
            r'GDeletePlotConfigData_deletePlotConfiguration',
          )
          ..add('G__typename', G__typename)
          ..add('status', status))
        .toString();
  }
}

class GDeletePlotConfigData_deletePlotConfigurationBuilder
    implements
        Builder<
          GDeletePlotConfigData_deletePlotConfiguration,
          GDeletePlotConfigData_deletePlotConfigurationBuilder
        > {
  _$GDeletePlotConfigData_deletePlotConfiguration? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  GDeletePlotConfigData_deletePlotConfigurationBuilder() {
    GDeletePlotConfigData_deletePlotConfiguration._initializeBuilder(this);
  }

  GDeletePlotConfigData_deletePlotConfigurationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeletePlotConfigData_deletePlotConfiguration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeletePlotConfigData_deletePlotConfiguration;
  }

  @override
  void update(
    void Function(GDeletePlotConfigData_deletePlotConfigurationBuilder)?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GDeletePlotConfigData_deletePlotConfiguration build() => _build();

  _$GDeletePlotConfigData_deletePlotConfiguration _build() {
    final _$result =
        _$v ??
        new _$GDeletePlotConfigData_deletePlotConfiguration._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
            G__typename,
            r'GDeletePlotConfigData_deletePlotConfiguration',
            'G__typename',
          ),
          status: BuiltValueNullFieldError.checkNotNull(
            status,
            r'GDeletePlotConfigData_deletePlotConfiguration',
            'status',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
