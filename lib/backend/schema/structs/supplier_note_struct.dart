// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupplierNoteStruct extends FFFirebaseStruct {
  SupplierNoteStruct({
    String? supplierNote,
    DocumentReference? supplierReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _supplierNote = supplierNote,
        _supplierReference = supplierReference,
        super(firestoreUtilData);

  // "supplier_note" field.
  String? _supplierNote;
  String get supplierNote => _supplierNote ?? '';
  set supplierNote(String? val) => _supplierNote = val;
  bool hasSupplierNote() => _supplierNote != null;

  // "supplier_reference" field.
  DocumentReference? _supplierReference;
  DocumentReference? get supplierReference => _supplierReference;
  set supplierReference(DocumentReference? val) => _supplierReference = val;
  bool hasSupplierReference() => _supplierReference != null;

  static SupplierNoteStruct fromMap(Map<String, dynamic> data) =>
      SupplierNoteStruct(
        supplierNote: data['supplier_note'] as String?,
        supplierReference: data['supplier_reference'] as DocumentReference?,
      );

  static SupplierNoteStruct? maybeFromMap(dynamic data) => data is Map
      ? SupplierNoteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'supplier_note': _supplierNote,
        'supplier_reference': _supplierReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'supplier_note': serializeParam(
          _supplierNote,
          ParamType.String,
        ),
        'supplier_reference': serializeParam(
          _supplierReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static SupplierNoteStruct fromSerializableMap(Map<String, dynamic> data) =>
      SupplierNoteStruct(
        supplierNote: deserializeParam(
          data['supplier_note'],
          ParamType.String,
          false,
        ),
        supplierReference: deserializeParam(
          data['supplier_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['suppliers'],
        ),
      );

  @override
  String toString() => 'SupplierNoteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SupplierNoteStruct &&
        supplierNote == other.supplierNote &&
        supplierReference == other.supplierReference;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([supplierNote, supplierReference]);
}

SupplierNoteStruct createSupplierNoteStruct({
  String? supplierNote,
  DocumentReference? supplierReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SupplierNoteStruct(
      supplierNote: supplierNote,
      supplierReference: supplierReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SupplierNoteStruct? updateSupplierNoteStruct(
  SupplierNoteStruct? supplierNoteStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    supplierNoteStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSupplierNoteStructData(
  Map<String, dynamic> firestoreData,
  SupplierNoteStruct? supplierNoteStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (supplierNoteStruct == null) {
    return;
  }
  if (supplierNoteStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && supplierNoteStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final supplierNoteStructData =
      getSupplierNoteFirestoreData(supplierNoteStruct, forFieldValue);
  final nestedData =
      supplierNoteStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      supplierNoteStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSupplierNoteFirestoreData(
  SupplierNoteStruct? supplierNoteStruct, [
  bool forFieldValue = false,
]) {
  if (supplierNoteStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(supplierNoteStruct.toMap());

  // Add any Firestore field values
  supplierNoteStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSupplierNoteListFirestoreData(
  List<SupplierNoteStruct>? supplierNoteStructs,
) =>
    supplierNoteStructs
        ?.map((e) => getSupplierNoteFirestoreData(e, true))
        .toList() ??
    [];
