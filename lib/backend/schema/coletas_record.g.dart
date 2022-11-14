// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coletas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ColetasRecord> _$coletasRecordSerializer =
    new _$ColetasRecordSerializer();

class _$ColetasRecordSerializer implements StructuredSerializer<ColetasRecord> {
  @override
  final Iterable<Type> types = const [ColetasRecord, _$ColetasRecord];
  @override
  final String wireName = 'ColetasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ColetasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cliente;
    if (value != null) {
      result
        ..add('cliente')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idcliente;
    if (value != null) {
      result
        ..add('idcliente')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.local;
    if (value != null) {
      result
        ..add('local')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.totalcoletado;
    if (value != null) {
      result
        ..add('totalcoletado')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.objetosbipados;
    if (value != null) {
      result
        ..add('objetosbipados')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ColetasRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ColetasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cliente':
          result.cliente = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idcliente':
          result.idcliente = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'local':
          result.local = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'totalcoletado':
          result.totalcoletado = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'objetosbipados':
          result.objetosbipados.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ColetasRecord extends ColetasRecord {
  @override
  final String? cliente;
  @override
  final String? idcliente;
  @override
  final LatLng? local;
  @override
  final DateTime? data;
  @override
  final int? totalcoletado;
  @override
  final BuiltList<String>? objetosbipados;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ColetasRecord([void Function(ColetasRecordBuilder)? updates]) =>
      (new ColetasRecordBuilder()..update(updates))._build();

  _$ColetasRecord._(
      {this.cliente,
      this.idcliente,
      this.local,
      this.data,
      this.totalcoletado,
      this.objetosbipados,
      this.ffRef})
      : super._();

  @override
  ColetasRecord rebuild(void Function(ColetasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ColetasRecordBuilder toBuilder() => new ColetasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ColetasRecord &&
        cliente == other.cliente &&
        idcliente == other.idcliente &&
        local == other.local &&
        data == other.data &&
        totalcoletado == other.totalcoletado &&
        objetosbipados == other.objetosbipados &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, cliente.hashCode), idcliente.hashCode),
                        local.hashCode),
                    data.hashCode),
                totalcoletado.hashCode),
            objetosbipados.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ColetasRecord')
          ..add('cliente', cliente)
          ..add('idcliente', idcliente)
          ..add('local', local)
          ..add('data', data)
          ..add('totalcoletado', totalcoletado)
          ..add('objetosbipados', objetosbipados)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ColetasRecordBuilder
    implements Builder<ColetasRecord, ColetasRecordBuilder> {
  _$ColetasRecord? _$v;

  String? _cliente;
  String? get cliente => _$this._cliente;
  set cliente(String? cliente) => _$this._cliente = cliente;

  String? _idcliente;
  String? get idcliente => _$this._idcliente;
  set idcliente(String? idcliente) => _$this._idcliente = idcliente;

  LatLng? _local;
  LatLng? get local => _$this._local;
  set local(LatLng? local) => _$this._local = local;

  DateTime? _data;
  DateTime? get data => _$this._data;
  set data(DateTime? data) => _$this._data = data;

  int? _totalcoletado;
  int? get totalcoletado => _$this._totalcoletado;
  set totalcoletado(int? totalcoletado) =>
      _$this._totalcoletado = totalcoletado;

  ListBuilder<String>? _objetosbipados;
  ListBuilder<String> get objetosbipados =>
      _$this._objetosbipados ??= new ListBuilder<String>();
  set objetosbipados(ListBuilder<String>? objetosbipados) =>
      _$this._objetosbipados = objetosbipados;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ColetasRecordBuilder() {
    ColetasRecord._initializeBuilder(this);
  }

  ColetasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cliente = $v.cliente;
      _idcliente = $v.idcliente;
      _local = $v.local;
      _data = $v.data;
      _totalcoletado = $v.totalcoletado;
      _objetosbipados = $v.objetosbipados?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ColetasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ColetasRecord;
  }

  @override
  void update(void Function(ColetasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ColetasRecord build() => _build();

  _$ColetasRecord _build() {
    _$ColetasRecord _$result;
    try {
      _$result = _$v ??
          new _$ColetasRecord._(
              cliente: cliente,
              idcliente: idcliente,
              local: local,
              data: data,
              totalcoletado: totalcoletado,
              objetosbipados: _objetosbipados?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'objetosbipados';
        _objetosbipados?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ColetasRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
