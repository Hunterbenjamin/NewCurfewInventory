// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryStruct extends FFFirebaseStruct {
  CategoryStruct({
    String? categoryName,
    DocumentReference? categoryReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoryName = categoryName,
        _categoryReference = categoryReference,
        super(firestoreUtilData);

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  set categoryName(String? val) => _categoryName = val;
  bool hasCategoryName() => _categoryName != null;

  // "category_reference" field.
  DocumentReference? _categoryReference;
  DocumentReference? get categoryReference => _categoryReference;
  set categoryReference(DocumentReference? val) => _categoryReference = val;
  bool hasCategoryReference() => _categoryReference != null;

  static CategoryStruct fromMap(Map<String, dynamic> data) => CategoryStruct(
        categoryName: data['category_name'] as String?,
        categoryReference: data['category_reference'] as DocumentReference?,
      );

  static CategoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CategoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'category_name': _categoryName,
        'category_reference': _categoryReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category_name': serializeParam(
          _categoryName,
          ParamType.String,
        ),
        'category_reference': serializeParam(
          _categoryReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoryStruct(
        categoryName: deserializeParam(
          data['category_name'],
          ParamType.String,
          false,
        ),
        categoryReference: deserializeParam(
          data['category_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['categories'],
        ),
      );

  @override
  String toString() => 'CategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoryStruct &&
        categoryName == other.categoryName &&
        categoryReference == other.categoryReference;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([categoryName, categoryReference]);
}

CategoryStruct createCategoryStruct({
  String? categoryName,
  DocumentReference? categoryReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoryStruct(
      categoryName: categoryName,
      categoryReference: categoryReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoryStruct? updateCategoryStruct(
  CategoryStruct? category, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    category
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoryStructData(
  Map<String, dynamic> firestoreData,
  CategoryStruct? category,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (category == null) {
    return;
  }
  if (category.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && category.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoryData = getCategoryFirestoreData(category, forFieldValue);
  final nestedData = categoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = category.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoryFirestoreData(
  CategoryStruct? category, [
  bool forFieldValue = false,
]) {
  if (category == null) {
    return {};
  }
  final firestoreData = mapToFirestore(category.toMap());

  // Add any Firestore field values
  category.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoryListFirestoreData(
  List<CategoryStruct>? categorys,
) =>
    categorys?.map((e) => getCategoryFirestoreData(e, true)).toList() ?? [];
