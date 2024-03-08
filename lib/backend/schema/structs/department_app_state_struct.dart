// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentAppStateStruct extends FFFirebaseStruct {
  DepartmentAppStateStruct({
    String? departmentName,
    DocumentReference? departmentReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _departmentName = departmentName,
        _departmentReference = departmentReference,
        super(firestoreUtilData);

  // "departmentName" field.
  String? _departmentName;
  String get departmentName => _departmentName ?? '';
  set departmentName(String? val) => _departmentName = val;
  bool hasDepartmentName() => _departmentName != null;

  // "department_reference" field.
  DocumentReference? _departmentReference;
  DocumentReference? get departmentReference => _departmentReference;
  set departmentReference(DocumentReference? val) => _departmentReference = val;
  bool hasDepartmentReference() => _departmentReference != null;

  static DepartmentAppStateStruct fromMap(Map<String, dynamic> data) =>
      DepartmentAppStateStruct(
        departmentName: data['departmentName'] as String?,
        departmentReference: data['department_reference'] as DocumentReference?,
      );

  static DepartmentAppStateStruct? maybeFromMap(dynamic data) => data is Map
      ? DepartmentAppStateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'departmentName': _departmentName,
        'department_reference': _departmentReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'departmentName': serializeParam(
          _departmentName,
          ParamType.String,
        ),
        'department_reference': serializeParam(
          _departmentReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static DepartmentAppStateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DepartmentAppStateStruct(
        departmentName: deserializeParam(
          data['departmentName'],
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
  String toString() => 'DepartmentAppStateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DepartmentAppStateStruct &&
        departmentName == other.departmentName &&
        departmentReference == other.departmentReference;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([departmentName, departmentReference]);
}

DepartmentAppStateStruct createDepartmentAppStateStruct({
  String? departmentName,
  DocumentReference? departmentReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DepartmentAppStateStruct(
      departmentName: departmentName,
      departmentReference: departmentReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DepartmentAppStateStruct? updateDepartmentAppStateStruct(
  DepartmentAppStateStruct? departmentAppState, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    departmentAppState
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDepartmentAppStateStructData(
  Map<String, dynamic> firestoreData,
  DepartmentAppStateStruct? departmentAppState,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (departmentAppState == null) {
    return;
  }
  if (departmentAppState.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && departmentAppState.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final departmentAppStateData =
      getDepartmentAppStateFirestoreData(departmentAppState, forFieldValue);
  final nestedData =
      departmentAppStateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      departmentAppState.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDepartmentAppStateFirestoreData(
  DepartmentAppStateStruct? departmentAppState, [
  bool forFieldValue = false,
]) {
  if (departmentAppState == null) {
    return {};
  }
  final firestoreData = mapToFirestore(departmentAppState.toMap());

  // Add any Firestore field values
  departmentAppState.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDepartmentAppStateListFirestoreData(
  List<DepartmentAppStateStruct>? departmentAppStates,
) =>
    departmentAppStates
        ?.map((e) => getDepartmentAppStateFirestoreData(e, true))
        .toList() ??
    [];
