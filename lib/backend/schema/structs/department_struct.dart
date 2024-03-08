// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentStruct extends FFFirebaseStruct {
  DepartmentStruct({
    String? departmentName,
    DocumentReference? departmentReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _departmentName = departmentName,
        _departmentReference = departmentReference,
        super(firestoreUtilData);

  // "department_name" field.
  String? _departmentName;
  String get departmentName => _departmentName ?? '';
  set departmentName(String? val) => _departmentName = val;
  bool hasDepartmentName() => _departmentName != null;

  // "department_reference" field.
  DocumentReference? _departmentReference;
  DocumentReference? get departmentReference => _departmentReference;
  set departmentReference(DocumentReference? val) => _departmentReference = val;
  bool hasDepartmentReference() => _departmentReference != null;

  static DepartmentStruct fromMap(Map<String, dynamic> data) =>
      DepartmentStruct(
        departmentName: data['department_name'] as String?,
        departmentReference: data['department_reference'] as DocumentReference?,
      );

  static DepartmentStruct? maybeFromMap(dynamic data) => data is Map
      ? DepartmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'department_name': _departmentName,
        'department_reference': _departmentReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'department_name': serializeParam(
          _departmentName,
          ParamType.String,
        ),
        'department_reference': serializeParam(
          _departmentReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static DepartmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      DepartmentStruct(
        departmentName: deserializeParam(
          data['department_name'],
          ParamType.String,
          false,
        ),
        departmentReference: deserializeParam(
          data['department_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['departments'],
        ),
      );

  @override
  String toString() => 'DepartmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DepartmentStruct &&
        departmentName == other.departmentName &&
        departmentReference == other.departmentReference;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([departmentName, departmentReference]);
}

DepartmentStruct createDepartmentStruct({
  String? departmentName,
  DocumentReference? departmentReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DepartmentStruct(
      departmentName: departmentName,
      departmentReference: departmentReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DepartmentStruct? updateDepartmentStruct(
  DepartmentStruct? department, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    department
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDepartmentStructData(
  Map<String, dynamic> firestoreData,
  DepartmentStruct? department,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (department == null) {
    return;
  }
  if (department.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && department.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final departmentData = getDepartmentFirestoreData(department, forFieldValue);
  final nestedData = departmentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = department.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDepartmentFirestoreData(
  DepartmentStruct? department, [
  bool forFieldValue = false,
]) {
  if (department == null) {
    return {};
  }
  final firestoreData = mapToFirestore(department.toMap());

  // Add any Firestore field values
  department.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDepartmentListFirestoreData(
  List<DepartmentStruct>? departments,
) =>
    departments?.map((e) => getDepartmentFirestoreData(e, true)).toList() ?? [];
