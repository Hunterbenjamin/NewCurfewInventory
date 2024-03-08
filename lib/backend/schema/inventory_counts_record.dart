import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventoryCountsRecord extends FirestoreRecord {
  InventoryCountsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "countDate" field.
  DateTime? _countDate;
  DateTime? get countDate => _countDate;
  bool hasCountDate() => _countDate != null;

  // "departmentReference" field.
  DocumentReference? _departmentReference;
  DocumentReference? get departmentReference => _departmentReference;
  bool hasDepartmentReference() => _departmentReference != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _countDate = snapshotData['countDate'] as DateTime?;
    _departmentReference =
        snapshotData['departmentReference'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inventory_counts');

  static Stream<InventoryCountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InventoryCountsRecord.fromSnapshot(s));

  static Future<InventoryCountsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InventoryCountsRecord.fromSnapshot(s));

  static InventoryCountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventoryCountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventoryCountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventoryCountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InventoryCountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventoryCountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventoryCountsRecordData({
  DateTime? countDate,
  DocumentReference? departmentReference,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'countDate': countDate,
      'departmentReference': departmentReference,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class InventoryCountsRecordDocumentEquality
    implements Equality<InventoryCountsRecord> {
  const InventoryCountsRecordDocumentEquality();

  @override
  bool equals(InventoryCountsRecord? e1, InventoryCountsRecord? e2) {
    return e1?.countDate == e2?.countDate &&
        e1?.departmentReference == e2?.departmentReference &&
        e1?.status == e2?.status;
  }

  @override
  int hash(InventoryCountsRecord? e) => const ListEquality()
      .hash([e?.countDate, e?.departmentReference, e?.status]);

  @override
  bool isValidKey(Object? o) => o is InventoryCountsRecord;
}
