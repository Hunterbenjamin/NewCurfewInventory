import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderItemsRecord extends FirestoreRecord {
  OrderItemsRecord._(
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

  // "received" field.
  bool? _received;
  bool get received => _received ?? false;
  bool hasReceived() => _received != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _itemReference = snapshotData['itemReference'] as DocumentReference?;
    _itemName = snapshotData['itemName'] as String?;
    _unit = snapshotData['unit'] as String?;
    _pricePerUnit = castToType<int>(snapshotData['pricePerUnit']);
    _note = snapshotData['note'] as String?;
    _quantityOrdered = castToType<double>(snapshotData['quantityOrdered']);
    _quantityReceived = castToType<double>(snapshotData['quantityReceived']);
    _received = snapshotData['received'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('order_items')
          : FirebaseFirestore.instance.collectionGroup('order_items');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('order_items').doc(id);

  static Stream<OrderItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderItemsRecord.fromSnapshot(s));

  static Future<OrderItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderItemsRecord.fromSnapshot(s));

  static OrderItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderItemsRecordData({
  DocumentReference? itemReference,
  String? itemName,
  String? unit,
  int? pricePerUnit,
  String? note,
  double? quantityOrdered,
  double? quantityReceived,
  bool? received,
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
      'received': received,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderItemsRecordDocumentEquality implements Equality<OrderItemsRecord> {
  const OrderItemsRecordDocumentEquality();

  @override
  bool equals(OrderItemsRecord? e1, OrderItemsRecord? e2) {
    return e1?.itemReference == e2?.itemReference &&
        e1?.itemName == e2?.itemName &&
        e1?.unit == e2?.unit &&
        e1?.pricePerUnit == e2?.pricePerUnit &&
        e1?.note == e2?.note &&
        e1?.quantityOrdered == e2?.quantityOrdered &&
        e1?.quantityReceived == e2?.quantityReceived &&
        e1?.received == e2?.received;
  }

  @override
  int hash(OrderItemsRecord? e) => const ListEquality().hash([
        e?.itemReference,
        e?.itemName,
        e?.unit,
        e?.pricePerUnit,
        e?.note,
        e?.quantityOrdered,
        e?.quantityReceived,
        e?.received
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderItemsRecord;
}
