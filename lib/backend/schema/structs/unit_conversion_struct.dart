// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitConversionStruct extends FFFirebaseStruct {
  UnitConversionStruct({
    double? conversionValue,
    String? conversionUnit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _conversionValue = conversionValue,
        _conversionUnit = conversionUnit,
        super(firestoreUtilData);

  // "conversion_value" field.
  double? _conversionValue;
  double get conversionValue => _conversionValue ?? 0.0;
  set conversionValue(double? val) => _conversionValue = val;
  void incrementConversionValue(double amount) =>
      _conversionValue = conversionValue + amount;
  bool hasConversionValue() => _conversionValue != null;

  // "conversion_unit" field.
  String? _conversionUnit;
  String get conversionUnit => _conversionUnit ?? '';
  set conversionUnit(String? val) => _conversionUnit = val;
  bool hasConversionUnit() => _conversionUnit != null;

  static UnitConversionStruct fromMap(Map<String, dynamic> data) =>
      UnitConversionStruct(
        conversionValue: castToType<double>(data['conversion_value']),
        conversionUnit: data['conversion_unit'] as String?,
      );

  static UnitConversionStruct? maybeFromMap(dynamic data) => data is Map
      ? UnitConversionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'conversion_value': _conversionValue,
        'conversion_unit': _conversionUnit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'conversion_value': serializeParam(
          _conversionValue,
          ParamType.double,
        ),
        'conversion_unit': serializeParam(
          _conversionUnit,
          ParamType.String,
        ),
      }.withoutNulls;

  static UnitConversionStruct fromSerializableMap(Map<String, dynamic> data) =>
      UnitConversionStruct(
        conversionValue: deserializeParam(
          data['conversion_value'],
          ParamType.double,
          false,
        ),
        conversionUnit: deserializeParam(
          data['conversion_unit'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UnitConversionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UnitConversionStruct &&
        conversionValue == other.conversionValue &&
        conversionUnit == other.conversionUnit;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([conversionValue, conversionUnit]);
}

UnitConversionStruct createUnitConversionStruct({
  double? conversionValue,
  String? conversionUnit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UnitConversionStruct(
      conversionValue: conversionValue,
      conversionUnit: conversionUnit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UnitConversionStruct? updateUnitConversionStruct(
  UnitConversionStruct? unitConversion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    unitConversion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUnitConversionStructData(
  Map<String, dynamic> firestoreData,
  UnitConversionStruct? unitConversion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (unitConversion == null) {
    return;
  }
  if (unitConversion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && unitConversion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final unitConversionData =
      getUnitConversionFirestoreData(unitConversion, forFieldValue);
  final nestedData =
      unitConversionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = unitConversion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUnitConversionFirestoreData(
  UnitConversionStruct? unitConversion, [
  bool forFieldValue = false,
]) {
  if (unitConversion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(unitConversion.toMap());

  // Add any Firestore field values
  unitConversion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUnitConversionListFirestoreData(
  List<UnitConversionStruct>? unitConversions,
) =>
    unitConversions
        ?.map((e) => getUnitConversionFirestoreData(e, true))
        .toList() ??
    [];
