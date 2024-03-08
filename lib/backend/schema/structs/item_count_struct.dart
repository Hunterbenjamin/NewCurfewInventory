// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemCountStruct extends FFFirebaseStruct {
  ItemCountStruct({
    String? itemName,
    String? itemUnit,
    DocumentReference? itemReference,
    double? itemCount,
    bool? counted,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemName = itemName,
        _itemUnit = itemUnit,
        _itemReference = itemReference,
        _itemCount = itemCount,
        _counted = counted,
        super(firestoreUtilData);

  // "item_name" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  set itemName(String? val) => _itemName = val;
  bool hasItemName() => _itemName != null;

  // "item_unit" field.
  String? _itemUnit;
  String get itemUnit => _itemUnit ?? '';
  set itemUnit(String? val) => _itemUnit = val;
  bool hasItemUnit() => _itemUnit != null;

  // "item_reference" field.
  DocumentReference? _itemReference;
  DocumentReference? get itemReference => _itemReference;
  set itemReference(DocumentReference? val) => _itemReference = val;
  bool hasItemReference() => _itemReference != null;

  // "item_count" field.
  double? _itemCount;
  double get itemCount => _itemCount ?? 0.0;
  set itemCount(double? val) => _itemCount = val;
  void incrementItemCount(double amount) => _itemCount = itemCount + amount;
  bool hasItemCount() => _itemCount != null;

  // "counted" field.
  bool? _counted;
  bool get counted => _counted ?? false;
  set counted(bool? val) => _counted = val;
  bool hasCounted() => _counted != null;

  static ItemCountStruct fromMap(Map<String, dynamic> data) => ItemCountStruct(
        itemName: data['item_name'] as String?,
        itemUnit: data['item_unit'] as String?,
        itemReference: data['item_reference'] as DocumentReference?,
        itemCount: castToType<double>(data['item_count']),
        counted: data['counted'] as bool?,
      );

  static ItemCountStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemCountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'item_name': _itemName,
        'item_unit': _itemUnit,
        'item_reference': _itemReference,
        'item_count': _itemCount,
        'counted': _counted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'item_name': serializeParam(
          _itemName,
          ParamType.String,
        ),
        'item_unit': serializeParam(
          _itemUnit,
          ParamType.String,
        ),
        'item_reference': serializeParam(
          _itemReference,
          ParamType.DocumentReference,
        ),
        'item_count': serializeParam(
          _itemCount,
          ParamType.double,
        ),
        'counted': serializeParam(
          _counted,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ItemCountStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemCountStruct(
        itemName: deserializeParam(
          data['item_name'],
          ParamType.String,
          false,
        ),
        itemUnit: deserializeParam(
          data['item_unit'],
          ParamType.String,
          false,
        ),
        itemReference: deserializeParam(
          data['item_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['inventory_items'],
        ),
        itemCount: deserializeParam(
          data['item_count'],
          ParamType.double,
          false,
        ),
        counted: deserializeParam(
          data['counted'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ItemCountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemCountStruct &&
        itemName == other.itemName &&
        itemUnit == other.itemUnit &&
        itemReference == other.itemReference &&
        itemCount == other.itemCount &&
        counted == other.counted;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([itemName, itemUnit, itemReference, itemCount, counted]);
}

ItemCountStruct createItemCountStruct({
  String? itemName,
  String? itemUnit,
  DocumentReference? itemReference,
  double? itemCount,
  bool? counted,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemCountStruct(
      itemName: itemName,
      itemUnit: itemUnit,
      itemReference: itemReference,
      itemCount: itemCount,
      counted: counted,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemCountStruct? updateItemCountStruct(
  ItemCountStruct? itemCountStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemCountStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemCountStructData(
  Map<String, dynamic> firestoreData,
  ItemCountStruct? itemCountStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemCountStruct == null) {
    return;
  }
  if (itemCountStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemCountStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemCountStructData =
      getItemCountFirestoreData(itemCountStruct, forFieldValue);
  final nestedData =
      itemCountStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemCountStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemCountFirestoreData(
  ItemCountStruct? itemCountStruct, [
  bool forFieldValue = false,
]) {
  if (itemCountStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemCountStruct.toMap());

  // Add any Firestore field values
  itemCountStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemCountListFirestoreData(
  List<ItemCountStruct>? itemCountStructs,
) =>
    itemCountStructs?.map((e) => getItemCountFirestoreData(e, true)).toList() ??
    [];
