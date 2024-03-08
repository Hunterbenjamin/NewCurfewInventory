import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CashPurchasesRecord extends FirestoreRecord {
  CashPurchasesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "departmentReference" field.
  DocumentReference? _departmentReference;
  DocumentReference? get departmentReference => _departmentReference;
  bool hasDepartmentReference() => _departmentReference != null;

  // "store" field.
  String? _store;
  String get store => _store ?? '';
  bool hasStore() => _store != null;

  // "totalSpent" field.
  int? _totalSpent;
  int get totalSpent => _totalSpent ?? 0;
  bool hasTotalSpent() => _totalSpent != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "receiptImage" field.
  String? _receiptImage;
  String get receiptImage => _receiptImage ?? '';
  bool hasReceiptImage() => _receiptImage != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _departmentReference =
        snapshotData['departmentReference'] as DocumentReference?;
    _store = snapshotData['store'] as String?;
    _totalSpent = castToType<int>(snapshotData['totalSpent']);
    _category = snapshotData['category'] as String?;
    _receiptImage = snapshotData['receiptImage'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cash_purchases');

  static Stream<CashPurchasesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CashPurchasesRecord.fromSnapshot(s));

  static Future<CashPurchasesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CashPurchasesRecord.fromSnapshot(s));

  static CashPurchasesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CashPurchasesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CashPurchasesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CashPurchasesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CashPurchasesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CashPurchasesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCashPurchasesRecordData({
  DocumentReference? departmentReference,
  String? store,
  int? totalSpent,
  String? category,
  String? receiptImage,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'departmentReference': departmentReference,
      'store': store,
      'totalSpent': totalSpent,
      'category': category,
      'receiptImage': receiptImage,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class CashPurchasesRecordDocumentEquality
    implements Equality<CashPurchasesRecord> {
  const CashPurchasesRecordDocumentEquality();

  @override
  bool equals(CashPurchasesRecord? e1, CashPurchasesRecord? e2) {
    return e1?.departmentReference == e2?.departmentReference &&
        e1?.store == e2?.store &&
        e1?.totalSpent == e2?.totalSpent &&
        e1?.category == e2?.category &&
        e1?.receiptImage == e2?.receiptImage &&
        e1?.date == e2?.date;
  }

  @override
  int hash(CashPurchasesRecord? e) => const ListEquality().hash([
        e?.departmentReference,
        e?.store,
        e?.totalSpent,
        e?.category,
        e?.receiptImage,
        e?.date
      ]);

  @override
  bool isValidKey(Object? o) => o is CashPurchasesRecord;
}
