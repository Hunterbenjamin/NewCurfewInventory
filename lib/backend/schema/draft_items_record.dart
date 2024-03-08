import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DraftItemsRecord extends FirestoreRecord {
  DraftItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itemReference" field.
  DocumentReference? _itemReference;
  DocumentReference? get itemReference => _itemReference;
  bool hasItemReference() => _itemReference != null;

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "pricePerUnit" field.
  int? _pricePerUnit;
  int get pricePerUnit => _pricePerUnit ?? 0;
  bool hasPricePerUnit() => _pricePerUnit != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "quantityOrdered" field.
  double? _quantityOrdered;
  double get quantityOrdered => _quantityOrdered ?? 0.0;
  bool hasQuantityOrdered() => _quantityOrdered != null;

  // "quantityReceived" field.
  double? _quantityReceived;
  double get quantityReceived => _quantityReceived ?? 0.0;
  bool hasQuantityReceived() => _quantityReceived != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _itemReference = snapshotData['itemReference'] as DocumentReference?;
    _itemName = snapshotData['itemName'] as String?;
    _unit = snapshotData['unit'] as String?;
    _pricePerUnit = castToType<int>(snapshotData['pricePerUnit']);
    _note = snapshotData['note'] as String?;
    _quantityOrdered = castToType<double>(snapshotData['quantityOrdered']);
    _quantityReceived = castToType<double>(snapshotData['quantityReceived']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('draft_items')
          : FirebaseFirestore.instance.collectionGroup('draft_items');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('draft_items').doc(id);

  static Stream<DraftItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DraftItemsRecord.fromSnapshot(s));

  static Future<DraftItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DraftItemsRecord.fromSnapshot(s));

  static DraftItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DraftItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DraftItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DraftItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DraftItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DraftItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDraftItemsRecordData({
  DocumentReference? itemReference,
  String? itemName,
  String? unit,
  int? pricePerUnit,
  String? note,
  double? quantityOrdered,
  double? quantityReceived,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemReference': itemReference,
      'itemName': itemName,
      'unit': unit,
      'pricePerUnit': pricePerUnit,
      'note': note,
      'quantityOrdered': quantityOrdered,
      'quantityReceived': quantityReceived,
    }.withoutNulls,
  );

  return firestoreData;
}

class DraftItemsRecordDocumentEquality implements Equality<DraftItemsRecord> {
  const DraftItemsRecordDocumentEquality();

  @override
  bool equals(DraftItemsRecord? e1, DraftItemsRecord? e2) {
    return e1?.itemReference == e2?.itemReference &&
        e1?.itemName == e2?.itemName &&
        e1?.unit == e2?.unit &&
        e1?.pricePerUnit == e2?.pricePerUnit &&
        e1?.note == e2?.note &&
        e1?.quantityOrdered == e2?.quantityOrdered &&
        e1?.quantityReceived == e2?.quantityReceived;
  }

  @override
  int hash(DraftItemsRecord? e) => const ListEquality().hash([
        e?.itemReference,
        e?.itemName,
        e?.unit,
        e?.pricePerUnit,
        e?.note,
        e?.quantityOrdered,
        e?.quantityReceived
      ]);

  @override
  bool isValidKey(Object? o) => o is DraftItemsRecord;
}
