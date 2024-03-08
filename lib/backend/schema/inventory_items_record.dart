import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventoryItemsRecord extends FirestoreRecord {
  InventoryItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "category" field.
  CategoryStruct? _category;
  CategoryStruct get category => _category ?? CategoryStruct();
  bool hasCategory() => _category != null;

  // "departments" field.
  List<DepartmentStruct>? _departments;
  List<DepartmentStruct> get departments => _departments ?? const [];
  bool hasDepartments() => _departments != null;

  // "suppliers" field.
  List<SupplierStruct>? _suppliers;
  List<SupplierStruct> get suppliers => _suppliers ?? const [];
  bool hasSuppliers() => _suppliers != null;

  // "orderingOptions" field.
  List<OrderingOptionStruct>? _orderingOptions;
  List<OrderingOptionStruct> get orderingOptions =>
      _orderingOptions ?? const [];
  bool hasOrderingOptions() => _orderingOptions != null;

  // "unitConversion" field.
  UnitConversionStruct? _unitConversion;
  UnitConversionStruct get unitConversion =>
      _unitConversion ?? UnitConversionStruct();
  bool hasUnitConversion() => _unitConversion != null;

  // "purchased" field.
  bool? _purchased;
  bool get purchased => _purchased ?? false;
  bool hasPurchased() => _purchased != null;

  // "currentPrice" field.
  int? _currentPrice;
  int get currentPrice => _currentPrice ?? 0;
  bool hasCurrentPrice() => _currentPrice != null;

  // "unit" field.
  UnitStruct? _unit;
  UnitStruct get unit => _unit ?? UnitStruct();
  bool hasUnit() => _unit != null;

  void _initializeFields() {
    _itemName = snapshotData['itemName'] as String?;
    _category = CategoryStruct.maybeFromMap(snapshotData['category']);
    _departments = getStructList(
      snapshotData['departments'],
      DepartmentStruct.fromMap,
    );
    _suppliers = getStructList(
      snapshotData['suppliers'],
      SupplierStruct.fromMap,
    );
    _orderingOptions = getStructList(
      snapshotData['orderingOptions'],
      OrderingOptionStruct.fromMap,
    );
    _unitConversion =
        UnitConversionStruct.maybeFromMap(snapshotData['unitConversion']);
    _purchased = snapshotData['purchased'] as bool?;
    _currentPrice = castToType<int>(snapshotData['currentPrice']);
    _unit = UnitStruct.maybeFromMap(snapshotData['unit']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inventory_items');

  static Stream<InventoryItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InventoryItemsRecord.fromSnapshot(s));

  static Future<InventoryItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InventoryItemsRecord.fromSnapshot(s));

  static InventoryItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventoryItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventoryItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventoryItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InventoryItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventoryItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventoryItemsRecordData({
  String? itemName,
  CategoryStruct? category,
  UnitConversionStruct? unitConversion,
  bool? purchased,
  int? currentPrice,
  UnitStruct? unit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemName': itemName,
      'category': CategoryStruct().toMap(),
      'unitConversion': UnitConversionStruct().toMap(),
      'purchased': purchased,
      'currentPrice': currentPrice,
      'unit': UnitStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "category" field.
  addCategoryStructData(firestoreData, category, 'category');

  // Handle nested data for "unitConversion" field.
  addUnitConversionStructData(firestoreData, unitConversion, 'unitConversion');

  // Handle nested data for "unit" field.
  addUnitStructData(firestoreData, unit, 'unit');

  return firestoreData;
}

class InventoryItemsRecordDocumentEquality
    implements Equality<InventoryItemsRecord> {
  const InventoryItemsRecordDocumentEquality();

  @override
  bool equals(InventoryItemsRecord? e1, InventoryItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.itemName == e2?.itemName &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.departments, e2?.departments) &&
        listEquality.equals(e1?.suppliers, e2?.suppliers) &&
        listEquality.equals(e1?.orderingOptions, e2?.orderingOptions) &&
        e1?.unitConversion == e2?.unitConversion &&
        e1?.purchased == e2?.purchased &&
        e1?.currentPrice == e2?.currentPrice &&
        e1?.unit == e2?.unit;
  }

  @override
  int hash(InventoryItemsRecord? e) => const ListEquality().hash([
        e?.itemName,
        e?.category,
        e?.departments,
        e?.suppliers,
        e?.orderingOptions,
        e?.unitConversion,
        e?.purchased,
        e?.currentPrice,
        e?.unit
      ]);

  @override
  bool isValidKey(Object? o) => o is InventoryItemsRecord;
}
