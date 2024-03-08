// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupplierStruct extends FFFirebaseStruct {
  SupplierStruct({
    String? supplierName,
    DocumentReference? supplierReference,
    bool? isPreferred,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _supplierName = supplierName,
        _supplierReference = supplierReference,
        _isPreferred = isPreferred,
        super(firestoreUtilData);

  // "supplier_name" field.
  String? _supplierName;
  String get supplierName => _supplierName ?? '';
  set supplierName(String? val) => _supplierName = val;
  bool hasSupplierName() => _supplierName != null;

  // "supplier_reference" field.
  DocumentReference? _supplierReference;
  DocumentReference? get supplierReference => _supplierReference;
  set supplierReference(DocumentReference? val) => _supplierReference = val;
  bool hasSupplierReference() => _supplierReference != null;

  // "is_preferred" field.
  bool? _isPreferred;
  bool get isPreferred => _isPreferred ?? false;
  set isPreferred(bool? val) => _isPreferred = val;
  bool hasIsPreferred() => _isPreferred != null;

  static SupplierStruct fromMap(Map<String, dynamic> data) => SupplierStruct(
        supplierName: data['supplier_name'] as String?,
        supplierReference: data['supplier_reference'] as DocumentReference?,
        isPreferred: data['is_preferred'] as bool?,
      );

  static SupplierStruct? maybeFromMap(dynamic data) =>
      data is Map ? SupplierStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'supplier_name': _supplierName,
        'supplier_reference': _supplierReference,
        'is_preferred': _isPreferred,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'supplier_name': serializeParam(
          _supplierName,
          ParamType.String,
        ),
        'supplier_reference': serializeParam(
          _supplierReference,
          ParamType.DocumentReference,
        ),
        'is_preferred': serializeParam(
          _isPreferred,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SupplierStruct fromSerializableMap(Map<String, dynamic> data) =>
      SupplierStruct(
        supplierName: deserializeParam(
          data['supplier_name'],
          ParamType.String,
          false,
        ),
        supplierReference: deserializeParam(
          data['supplier_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['suppliers'],
        ),
        isPreferred: deserializeParam(
          data['is_preferred'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SupplierStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SupplierStruct &&
        supplierName == other.supplierName &&
        supplierReference == other.supplierReference &&
        isPreferred == other.isPreferred;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([supplierName, supplierReference, isPreferred]);
}

SupplierStruct createSupplierStruct({
  String? supplierName,
  DocumentReference? supplierReference,
  bool? isPreferred,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SupplierStruct(
      supplierName: supplierName,
      supplierReference: supplierReference,
      isPreferred: isPreferred,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SupplierStruct? updateSupplierStruct(
  SupplierStruct? supplier, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    supplier
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSupplierStructData(
  Map<String, dynamic> firestoreData,
  SupplierStruct? supplier,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (supplier == null) {
    return;
  }
  if (supplier.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && supplier.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final supplierData = getSupplierFirestoreData(supplier, forFieldValue);
  final nestedData = supplierData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = supplier.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSupplierFirestoreData(
  SupplierStruct? supplier, [
  bool forFieldValue = false,
]) {
  if (supplier == null) {
    return {};
  }
  final firestoreData = mapToFirestore(supplier.toMap());

  // Add any Firestore field values
  supplier.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSupplierListFirestoreData(
  List<SupplierStruct>? suppliers,
) =>
    suppliers?.map((e) => getSupplierFirestoreData(e, true)).toList() ?? [];
