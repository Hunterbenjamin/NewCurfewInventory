import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "departmentReference" field.
  DocumentReference? _departmentReference;
  DocumentReference? get departmentReference => _departmentReference;
  bool hasDepartmentReference() => _departmentReference != null;

  // "supplierReference" field.
  DocumentReference? _supplierReference;
  DocumentReference? get supplierReference => _supplierReference;
  bool hasSupplierReference() => _supplierReference != null;

  // "dateSent" field.
  DateTime? _dateSent;
  DateTime? get dateSent => _dateSent;
  bool hasDateSent() => _dateSent != null;

  // "dateCompleted" field.
  DateTime? _dateCompleted;
  DateTime? get dateCompleted => _dateCompleted;
  bool hasDateCompleted() => _dateCompleted != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "orderNotes" field.
  String? _orderNotes;
  String get orderNotes => _orderNotes ?? '';
  bool hasOrderNotes() => _orderNotes != null;

  // "orderID" field.
  String? _orderID;
  String get orderID => _orderID ?? '';
  bool hasOrderID() => _orderID != null;

  void _initializeFields() {
    _departmentReference =
        snapshotData['departmentReference'] as DocumentReference?;
    _supplierReference =
        snapshotData['supplierReference'] as DocumentReference?;
    _dateSent = snapshotData['dateSent'] as DateTime?;
    _dateCompleted = snapshotData['dateCompleted'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _orderNotes = snapshotData['orderNotes'] as String?;
    _orderID = snapshotData['orderID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DocumentReference? departmentReference,
  DocumentReference? supplierReference,
  DateTime? dateSent,
  DateTime? dateCompleted,
  String? status,
  String? orderNotes,
  String? orderID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'departmentReference': departmentReference,
      'supplierReference': supplierReference,
      'dateSent': dateSent,
      'dateCompleted': dateCompleted,
      'status': status,
      'orderNotes': orderNotes,
      'orderID': orderID,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.departmentReference == e2?.departmentReference &&
        e1?.supplierReference == e2?.supplierReference &&
        e1?.dateSent == e2?.dateSent &&
        e1?.dateCompleted == e2?.dateCompleted &&
        e1?.status == e2?.status &&
        e1?.orderNotes == e2?.orderNotes &&
        e1?.orderID == e2?.orderID;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.departmentReference,
        e?.supplierReference,
        e?.dateSent,
        e?.dateCompleted,
        e?.status,
        e?.orderNotes,
        e?.orderID
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
