// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderItemStruct extends FFFirebaseStruct {
  OrderItemStruct({
    DocumentReference? itemReference,
    String? itemName,
    String? unit,
    int? pricePerUnit,
    String? note,
    double? quantityOrdered,
    double? quantityReceived,
    OrderingOptionStruct? orderOption,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemReference = itemReference,
        _itemName = itemName,
        _unit = unit,
        _pricePerUnit = pricePerUnit,
        _note = note,
        _quantityOrdered = quantityOrdered,
        _quantityReceived = quantityReceived,
        _orderOption = orderOption,
        super(firestoreUtilData);

  // "item_reference" field.
  DocumentReference? _itemReference;
  DocumentReference? get itemReference => _itemReference;
  set itemReference(DocumentReference? val) => _itemReference = val;
  bool hasItemReference() => _itemReference != null;

  // "item_name" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  set itemName(String? val) => _itemName = val;
  bool hasItemName() => _itemName != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;
  bool hasUnit() => _unit != null;

  // "price_per_unit" field.
  int? _pricePerUnit;
  int get pricePerUnit => _pricePerUnit ?? 0;
  set pricePerUnit(int? val) => _pricePerUnit = val;
  void incrementPricePerUnit(int amount) =>
      _pricePerUnit = pricePerUnit + amount;
  bool hasPricePerUnit() => _pricePerUnit != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;
  bool hasNote() => _note != null;

  // "quantity_ordered" field.
  double? _quantityOrdered;
  double get quantityOrdered => _quantityOrdered ?? 0.0;
  set quantityOrdered(double? val) => _quantityOrdered = val;
  void incrementQuantityOrdered(double amount) =>
      _quantityOrdered = quantityOrdered + amount;
  bool hasQuantityOrdered() => _quantityOrdered != null;

  // "quantity_received" field.
  double? _quantityReceived;
  double get quantityReceived => _quantityReceived ?? 0.0;
  set quantityReceived(double? val) => _quantityReceived = val;
  void incrementQuantityReceived(double amount) =>
      _quantityReceived = quantityReceived + amount;
  bool hasQuantityReceived() => _quantityReceived != null;

  // "order_option" field.
  OrderingOptionStruct? _orderOption;
  OrderingOptionStruct get orderOption =>
      _orderOption ?? OrderingOptionStruct();
  set orderOption(OrderingOptionStruct? val) => _orderOption = val;
  void updateOrderOption(Function(OrderingOptionStruct) updateFn) =>
      updateFn(_orderOption ??= OrderingOptionStruct());
  bool hasOrderOption() => _orderOption != null;

  static OrderItemStruct fromMap(Map<String, dynamic> data) => OrderItemStruct(
        itemReference: data['item_reference'] as DocumentReference?,
        itemName: data['item_name'] as String?,
        unit: data['unit'] as String?,
        pricePerUnit: castToType<int>(data['price_per_unit']),
        note: data['note'] as String?,
        quantityOrdered: castToType<double>(data['quantity_ordered']),
        quantityReceived: castToType<double>(data['quantity_received']),
        orderOption: OrderingOptionStruct.maybeFromMap(data['order_option']),
      );

  static OrderItemStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'item_reference': _itemReference,
        'item_name': _itemName,
        'unit': _unit,
        'price_per_unit': _pricePerUnit,
        'note': _note,
        'quantity_ordered': _quantityOrdered,
        'quantity_received': _quantityReceived,
        'order_option': _orderOption?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'item_reference': serializeParam(
          _itemReference,
          ParamType.DocumentReference,
        ),
        'item_name': serializeParam(
          _itemName,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'price_per_unit': serializeParam(
          _pricePerUnit,
          ParamType.int,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'quantity_ordered': serializeParam(
          _quantityOrdered,
          ParamType.double,
        ),
        'quantity_received': serializeParam(
          _quantityReceived,
          ParamType.double,
        ),
        'order_option': serializeParam(
          _orderOption,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static OrderItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderItemStruct(
        itemReference: deserializeParam(
          data['item_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['inventory_items'],
        ),
        itemName: deserializeParam(
          data['item_name'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        pricePerUnit: deserializeParam(
          data['price_per_unit'],
          ParamType.int,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        quantityOrdered: deserializeParam(
          data['quantity_ordered'],
          ParamType.double,
          false,
        ),
        quantityReceived: deserializeParam(
          data['quantity_received'],
          ParamType.double,
          false,
        ),
        orderOption: deserializeStructParam(
          data['order_option'],
          ParamType.DataStruct,
          false,
          structBuilder: OrderingOptionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OrderItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderItemStruct &&
        itemReference == other.itemReference &&
        itemName == other.itemName &&
        unit == other.unit &&
        pricePerUnit == other.pricePerUnit &&
        note == other.note &&
        quantityOrdered == other.quantityOrdered &&
        quantityReceived == other.quantityReceived &&
        orderOption == other.orderOption;
  }

  @override
  int get hashCode => const ListEquality().hash([
        itemReference,
        itemName,
        unit,
        pricePerUnit,
        note,
        quantityOrdered,
        quantityReceived,
        orderOption
      ]);
}

OrderItemStruct createOrderItemStruct({
  DocumentReference? itemReference,
  String? itemName,
  String? unit,
  int? pricePerUnit,
  String? note,
  double? quantityOrdered,
  double? quantityReceived,
  OrderingOptionStruct? orderOption,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderItemStruct(
      itemReference: itemReference,
      itemName: itemName,
      unit: unit,
      pricePerUnit: pricePerUnit,
      note: note,
      quantityOrdered: quantityOrdered,
      quantityReceived: quantityReceived,
      orderOption:
          orderOption ?? (clearUnsetFields ? OrderingOptionStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderItemStruct? updateOrderItemStruct(
  OrderItemStruct? orderItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderItemStructData(
  Map<String, dynamic> firestoreData,
  OrderItemStruct? orderItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderItem == null) {
    return;
  }
  if (orderItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderItemData = getOrderItemFirestoreData(orderItem, forFieldValue);
  final nestedData = orderItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderItemFirestoreData(
  OrderItemStruct? orderItem, [
  bool forFieldValue = false,
]) {
  if (orderItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderItem.toMap());

  // Handle nested data for "order_option" field.
  addOrderingOptionStructData(
    firestoreData,
    orderItem.hasOrderOption() ? orderItem.orderOption : null,
    'order_option',
    forFieldValue,
  );

  // Add any Firestore field values
  orderItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderItemListFirestoreData(
  List<OrderItemStruct>? orderItems,
) =>
    orderItems?.map((e) => getOrderItemFirestoreData(e, true)).toList() ?? [];
