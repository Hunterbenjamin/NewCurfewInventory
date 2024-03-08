// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PriceHistoryStruct extends FFFirebaseStruct {
  PriceHistoryStruct({
    DateTime? datePurchased,
    int? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _datePurchased = datePurchased,
        _price = price,
        super(firestoreUtilData);

  // "date_purchased" field.
  DateTime? _datePurchased;
  DateTime? get datePurchased => _datePurchased;
  set datePurchased(DateTime? val) => _datePurchased = val;
  bool hasDatePurchased() => _datePurchased != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;
  void incrementPrice(int amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static PriceHistoryStruct fromMap(Map<String, dynamic> data) =>
      PriceHistoryStruct(
        datePurchased: data['date_purchased'] as DateTime?,
        price: castToType<int>(data['price']),
      );

  static PriceHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? PriceHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date_purchased': _datePurchased,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date_purchased': serializeParam(
          _datePurchased,
          ParamType.DateTime,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
      }.withoutNulls;

  static PriceHistoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      PriceHistoryStruct(
        datePurchased: deserializeParam(
          data['date_purchased'],
          ParamType.DateTime,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PriceHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PriceHistoryStruct &&
        datePurchased == other.datePurchased &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([datePurchased, price]);
}

PriceHistoryStruct createPriceHistoryStruct({
  DateTime? datePurchased,
  int? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PriceHistoryStruct(
      datePurchased: datePurchased,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PriceHistoryStruct? updatePriceHistoryStruct(
  PriceHistoryStruct? priceHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    priceHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPriceHistoryStructData(
  Map<String, dynamic> firestoreData,
  PriceHistoryStruct? priceHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (priceHistory == null) {
    return;
  }
  if (priceHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && priceHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final priceHistoryData =
      getPriceHistoryFirestoreData(priceHistory, forFieldValue);
  final nestedData =
      priceHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = priceHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPriceHistoryFirestoreData(
  PriceHistoryStruct? priceHistory, [
  bool forFieldValue = false,
]) {
  if (priceHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(priceHistory.toMap());

  // Add any Firestore field values
  priceHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPriceHistoryListFirestoreData(
  List<PriceHistoryStruct>? priceHistorys,
) =>
    priceHistorys?.map((e) => getPriceHistoryFirestoreData(e, true)).toList() ??
    [];
