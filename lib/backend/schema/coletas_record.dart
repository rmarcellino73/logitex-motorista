import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'coletas_record.g.dart';

abstract class ColetasRecord
    implements Built<ColetasRecord, ColetasRecordBuilder> {
  static Serializer<ColetasRecord> get serializer => _$coletasRecordSerializer;

  String? get cliente;

  String? get idcliente;

  LatLng? get local;

  DateTime? get data;

  int? get totalcoletado;

  BuiltList<String>? get objetosbipados;

  int? get coletado;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ColetasRecordBuilder builder) => builder
    ..cliente = ''
    ..idcliente = ''
    ..totalcoletado = 0
    ..objetosbipados = ListBuilder()
    ..coletado = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coletas');

  static Stream<ColetasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ColetasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ColetasRecord._();
  factory ColetasRecord([void Function(ColetasRecordBuilder) updates]) =
      _$ColetasRecord;

  static ColetasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createColetasRecordData({
  String? cliente,
  String? idcliente,
  LatLng? local,
  DateTime? data,
  int? totalcoletado,
  int? coletado,
}) {
  final firestoreData = serializers.toFirestore(
    ColetasRecord.serializer,
    ColetasRecord(
      (c) => c
        ..cliente = cliente
        ..idcliente = idcliente
        ..local = local
        ..data = data
        ..totalcoletado = totalcoletado
        ..objetosbipados = null
        ..coletado = coletado,
    ),
  );

  return firestoreData;
}
