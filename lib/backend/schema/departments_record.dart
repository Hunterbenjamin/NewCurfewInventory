import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentsRecord extends FirestoreRecord {
  DepartmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "departmentName" field.
  String? _departmentName;
  String get departmentName => _departmentName ?? '';
  bool hasDepartmentName() => _departmentName != null;

  void _initializeFields() {
    _departmentName = snapshotData['departmentName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('departments');

  static Stream<DepartmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DepartmentsRecord.fromSnapshot(s));

  static Future<DepartmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DepartmentsRecord.fromSnapshot(s));

  static DepartmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DepartmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DepartmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DepartmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DepartmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DepartmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDepartmentsRecordData({
  String? departmentName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'departmentName': departmentName,
    }.withoutNulls,
  );

  return firestoreData;
}

class DepartmentsRecordDocumentEquality implements Equality<DepartmentsRecord> {
  const DepartmentsRecordDocumentEquality();

  @override
  bool equals(DepartmentsRecord? e1, DepartmentsRecord? e2) {
    return e1?.departmentName == e2?.departmentName;
  }

  @override
  int hash(DepartmentsRecord? e) =>
      const ListEquality().hash([e?.departmentName]);

  @override
  bool isValidKey(Object? o) => o is DepartmentsRecord;
}
