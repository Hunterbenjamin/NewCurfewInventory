import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StorageRecord extends FirestoreRecord {
  StorageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "locationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "departmentReference" field.
  DocumentReference? _departmentReference;
  DocumentReference? get departmentReference => _departmentReference;
  bool hasDepartmentReference() => _departmentReference != null;

  void _initializeFields() {
    _locationName = snapshotData['locationName'] as String?;
    _departmentReference =
        snapshotData['departmentReference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('storage');

  static Stream<StorageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StorageRecord.fromSnapshot(s));

  static Future<StorageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StorageRecord.fromSnapshot(s));

  static StorageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StorageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StorageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StorageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StorageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StorageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStorageRecordData({
  String? locationName,
  DocumentReference? departmentReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'locationName': locationName,
      'departmentReference': departmentReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class StorageRecordDocumentEquality implements Equality<StorageRecord> {
  const StorageRecordDocumentEquality();

  @override
  bool equals(StorageRecord? e1, StorageRecord? e2) {
    return e1?.locationName == e2?.locationName &&
        e1?.departmentReference == e2?.departmentReference;
  }

  @override
  int hash(StorageRecord? e) =>
      const ListEquality().hash([e?.locationName, e?.departmentReference]);

  @override
  bool isValidKey(Object? o) => o is StorageRecord;
}
