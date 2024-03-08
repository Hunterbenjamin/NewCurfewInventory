// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitStruct extends FFFirebaseStruct {
  UnitStruct({
    String? unitGeneral,
    String? unitSpecific,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _unitGeneral = unitGeneral,
        _unitSpecific = unitSpecific,
        super(firestoreUtilData);

  // "unit_general" field.
  String? _unitGeneral;
  String get unitGeneral => _unitGeneral ?? '';
  set unitGeneral(String? val) => _unitGeneral = val;
  bool hasUnitGeneral() => _unitGeneral != null;

  // "unit_specific" field.
  String? _unitSpecific;
  String get unitSpecific => _unitSpecific ?? '';
  set unitSpecific(String? val) => _unitSpecific = val;
  bool hasUnitSpecific() => _unitSpecific != null;

  static UnitStruct fromMap(Map<String, dynamic> data) => UnitStruct(
        unitGeneral: data['unit_general'] as String?,
        unitSpecific: data['unit_specific'] as String?,
      );

  static UnitStruct? maybeFromMap(dynamic data) =>
      data is Map ? UnitStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'unit_general': _unitGeneral,
        'unit_specific': _unitSpecific,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'unit_general': serializeParam(
          _unitGeneral,
          ParamType.String,
        ),
        'unit_specific': serializeParam(
          _unitSpecific,
          ParamType.String,
        ),
      }.withoutNulls;

  static UnitStruct fromSerializableMap(Map<String, dynamic> data) =>
      UnitStruct(
        unitGeneral: deserializeParam(
          data['unit_general'],
          ParamType.String,
          false,
        ),
        unitSpecific: deserializeParam(
          data['unit_specific'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UnitStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UnitStruct &&
        unitGeneral == other.unitGeneral &&
        unitSpecific == other.unitSpecific;
  }

  @override
  int get hashCode => const ListEquality().hash([unitGeneral, unitSpecific]);
}

UnitStruct createUnitStruct({
  String? unitGeneral,
  String? unitSpecific,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UnitStruct(
      unitGeneral: unitGeneral,
      unitSpecific: unitSpecific,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UnitStruct? updateUnitStruct(
  UnitStruct? unit, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    unit
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUnitStructData(
  Map<String, dynamic> firestoreData,
  UnitStruct? unit,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (unit == null) {
    return;
  }
  if (unit.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && unit.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final unitData = getUnitFirestoreData(unit, forFieldValue);
  final nestedData = unitData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = unit.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUnitFirestoreData(
  UnitStruct? unit, [
  bool forFieldValue = false,
]) {
  if (unit == null) {
    return {};
  }
  final firestoreData = mapToFirestore(unit.toMap());

  // Add any Firestore field values
  unit.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUnitListFirestoreData(
  List<UnitStruct>? units,
) =>
    units?.map((e) => getUnitFirestoreData(e, true)).toList() ?? [];
