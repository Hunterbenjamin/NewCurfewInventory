import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuppliersRecord extends FirestoreRecord {
  SuppliersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "supplierName" field.
  String? _supplierName;
  String get supplierName => _supplierName ?? '';
  bool hasSupplierName() => _supplierName != null;

  // "salesRep" field.
  String? _salesRep;
  String get salesRep => _salesRep ?? '';
  bool hasSalesRep() => _salesRep != null;

  // "contactInfo" field.
  ContactInfoStruct? _contactInfo;
  ContactInfoStruct get contactInfo => _contactInfo ?? ContactInfoStruct();
  bool hasContactInfo() => _contactInfo != null;

  void _initializeFields() {
    _supplierName = snapshotData['supplierName'] as String?;
    _salesRep = snapshotData['salesRep'] as String?;
    _contactInfo = ContactInfoStruct.maybeFromMap(snapshotData['contactInfo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('suppliers');

  static Stream<SuppliersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuppliersRecord.fromSnapshot(s));

  static Future<SuppliersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuppliersRecord.fromSnapshot(s));

  static SuppliersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuppliersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuppliersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuppliersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuppliersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuppliersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuppliersRecordData({
  String? supplierName,
  String? salesRep,
  ContactInfoStruct? contactInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'supplierName': supplierName,
      'salesRep': salesRep,
      'contactInfo': ContactInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "contactInfo" field.
  addContactInfoStructData(firestoreData, contactInfo, 'contactInfo');

  return firestoreData;
}

class SuppliersRecordDocumentEquality implements Equality<SuppliersRecord> {
  const SuppliersRecordDocumentEquality();

  @override
  bool equals(SuppliersRecord? e1, SuppliersRecord? e2) {
    return e1?.supplierName == e2?.supplierName &&
        e1?.salesRep == e2?.salesRep &&
        e1?.contactInfo == e2?.contactInfo;
  }

  @override
  int hash(SuppliersRecord? e) =>
      const ListEquality().hash([e?.supplierName, e?.salesRep, e?.contactInfo]);

  @override
  bool isValidKey(Object? o) => o is SuppliersRecord;
}
