import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DraftOrdersRecord extends FirestoreRecord {
  DraftOrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "departmentReference" field.
  DocumentReference? _departmentReference;
  DocumentReference? get departmentReference => _departmentReference;
  bool hasDepartmentReference() => _departmentReference != null;

  void _initializeFields() {
    _departmentReference =
        snapshotData['departmentReference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('draft_orders');

  static Stream<DraftOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DraftOrdersRecord.fromSnapshot(s));

  static Future<DraftOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DraftOrdersRecord.fromSnapshot(s));

  static DraftOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DraftOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DraftOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DraftOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DraftOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DraftOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDraftOrdersRecordData({
  DocumentReference? departmentReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'departmentReference': departmentReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class DraftOrdersRecordDocumentEquality implements Equality<DraftOrdersRecord> {
  const DraftOrdersRecordDocumentEquality();

  @override
  bool equals(DraftOrdersRecord? e1, DraftOrdersRecord? e2) {
    return e1?.departmentReference == e2?.departmentReference;
  }

  @override
  int hash(DraftOrdersRecord? e) =>
      const ListEquality().hash([e?.departmentReference]);

  @override
  bool isValidKey(Object? o) => o is DraftOrdersRecord;
}
