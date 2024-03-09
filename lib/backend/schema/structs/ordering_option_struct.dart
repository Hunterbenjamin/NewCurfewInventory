// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderingOptionStruct extends FFFirebaseStruct {
  OrderingOptionStruct({
    DocumentReference? supplierReference,
    String? purchaseUnit,
    int? price,
    int? packSize,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _supplierReference = supplierReference,
        _purchaseUnit = purchaseUnit,
        _price = price,
        _packSize = packSize,
        super(firestoreUtilData);

  // "supplier_reference" field.
  DocumentReference? _supplierReference;
  DocumentReference? get supplierReference => _supplierReference;
  set supplierReference(DocumentReference? val) => _supplierReference = val;
  bool hasSupplierReference() => _supplierReference != null;

  // "purchase_unit" field.
  String? _purchaseUnit;
  String get purchaseUnit => _purchaseUnit ?? '';
  set purchaseUnit(String? val) => _purchaseUnit = val;
  bool hasPurchaseUnit() => _purchaseUnit != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;
  void incrementPrice(int amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "pack_size" field.
  int? _packSize;
  int get packSize => _packSize ?? 0;
  set packSize(int? val) => _packSize = val;
  void incrementPackSize(int amount) => _packSize = packSize + amount;
  bool hasPackSize() => _packSize != null;

  static OrderingOptionStruct fromMap(Map<String, dynamic> data) =>
      OrderingOptionStruct(
        supplierReference: data['supplier_reference'] as DocumentReference?,
        purchaseUnit: data['purchase_unit'] as String?,
        price: castToType<int>(data['price']),
        packSize: castToType<int>(data['pack_size']),
      );

  static OrderingOptionStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderingOptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'supplier_reference': _supplierReference,
        'purchase_unit': _purchaseUnit,
        'price': _price,
        'pack_size': _packSize,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'supplier_reference': serializeParam(
          _supplierReference,
          ParamType.DocumentReference,
        ),
        'purchase_unit': serializeParam(
          _purchaseUnit,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'pack_size': serializeParam(
          _packSize,
          ParamType.int,
        ),
      }.withoutNulls;

  static OrderingOptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderingOptionStruct(
        supplierReference: deserializeParam(
          data['supplier_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['suppliers'],
        ),
        purchaseUnit: deserializeParam(
          data['purchase_unit'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        packSize: deserializeParam(
          data['pack_size'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OrderingOptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderingOptionStruct &&
        supplierReference == other.supplierReference &&
        purchaseUnit == other.purchaseUnit &&
        price == other.price &&
        packSize == other.packSize;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([supplierReference, purchaseUnit, price, packSize]);
}

OrderingOptionStruct createOrderingOptionStruct({
  DocumentReference? supplierReference,
  String? purchaseUnit,
  int? price,
  int? packSize,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderingOptionStruct(
      supplierReference: supplierReference,
      purchaseUnit: purchaseUnit,
      price: price,
      packSize: packSize,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderingOptionStruct? updateOrderingOptionStruct(
  OrderingOptionStruct? orderingOption, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderingOption
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderingOptionStructData(
  Map<String, dynamic> firestoreData,
  OrderingOptionStruct? orderingOption,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderingOption == null) {
    return;
  }
  if (orderingOption.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderingOption.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderingOptionData =
      getOrderingOptionFirestoreData(orderingOption, forFieldValue);
  final nestedData =
      orderingOptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderingOption.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderingOptionFirestoreData(
  OrderingOptionStruct? orderingOption, [
  bool forFieldValue = false,
]) {
  if (orderingOption == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderingOption.toMap());

  // Add any Firestore field values
  orderingOption.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderingOptionListFirestoreData(
  List<OrderingOptionStruct>? orderingOptions,
) =>
    orderingOptions
        ?.map((e) => getOrderingOptionFirestoreData(e, true))
        .toList() ??
    [];
