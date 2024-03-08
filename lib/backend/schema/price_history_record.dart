import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PriceHistoryRecord extends FirestoreRecord {
  PriceHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itemReference" field.
  DocumentReference? _itemReference;
  DocumentReference? get itemReference => _itemReference;
  bool hasItemReference() => _itemReference != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "pricePerUnit" field.
  int? _pricePerUnit;
  int get pricePerUnit => _pricePerUnit ?? 0;
  bool hasPricePerUnit() => _pricePerUnit != null;

  // "supplierReference" field.
  DocumentReference? _supplierReference;
  DocumentReference? get supplierReference => _supplierReference;
  bool hasSupplierReference() => _supplierReference != null;

  void _initializeFields() {
    _itemReference = snapshotData['itemReference'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _pricePerUnit = castToType<int>(snapshotData['pricePerUnit']);
    _supplierReference =
        snapshotData['supplierReference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('price_history');

  static Stream<PriceHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PriceHistoryRecord.fromSnapshot(s));

  static Future<PriceHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PriceHistoryRecord.fromSnapshot(s));

  static PriceHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PriceHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PriceHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PriceHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PriceHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PriceHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPriceHistoryRecordData({
  DocumentReference? itemReference,
  DateTime? date,
  int? pricePerUnit,
  DocumentReference? supplierReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemReference': itemReference,
      'date': date,
      'pricePerUnit': pricePerUnit,
      'supplierReference': supplierReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class PriceHistoryRecordDocumentEquality
    implements Equality<PriceHistoryRecord> {
  const PriceHistoryRecordDocumentEquality();

  @override
  bool equals(PriceHistoryRecord? e1, PriceHistoryRecord? e2) {
    return e1?.itemReference == e2?.itemReference &&
        e1?.date == e2?.date &&
        e1?.pricePerUnit == e2?.pricePerUnit &&
        e1?.supplierReference == e2?.supplierReference;
  }

  @override
  int hash(PriceHistoryRecord? e) => const ListEquality()
      .hash([e?.itemReference, e?.date, e?.pricePerUnit, e?.supplierReference]);

  @override
  bool isValidKey(Object? o) => o is PriceHistoryRecord;
}
