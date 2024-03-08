import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemCountRecord extends FirestoreRecord {
  ItemCountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "itemUnit" field.
  String? _itemUnit;
  String get itemUnit => _itemUnit ?? '';
  bool hasItemUnit() => _itemUnit != null;

  // "itemQuantity" field.
  double? _itemQuantity;
  double get itemQuantity => _itemQuantity ?? 0.0;
  bool hasItemQuantity() => _itemQuantity != null;

  // "itemReference" field.
  DocumentReference? _itemReference;
  DocumentReference? get itemReference => _itemReference;
  bool hasItemReference() => _itemReference != null;

  // "counted" field.
  bool? _counted;
  bool get counted => _counted ?? false;
  bool hasCounted() => _counted != null;

  // "itemCategory" field.
  String? _itemCategory;
  String get itemCategory => _itemCategory ?? '';
  bool hasItemCategory() => _itemCategory != null;

  // "itemStorage" field.
  String? _itemStorage;
  String get itemStorage => _itemStorage ?? '';
  bool hasItemStorage() => _itemStorage != null;

  // "itemCurrentValue" field.
  int? _itemCurrentValue;
  int get itemCurrentValue => _itemCurrentValue ?? 0;
  bool hasItemCurrentValue() => _itemCurrentValue != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _itemName = snapshotData['itemName'] as String?;
    _itemUnit = snapshotData['itemUnit'] as String?;
    _itemQuantity = castToType<double>(snapshotData['itemQuantity']);
    _itemReference = snapshotData['itemReference'] as DocumentReference?;
    _counted = snapshotData['counted'] as bool?;
    _itemCategory = snapshotData['itemCategory'] as String?;
    _itemStorage = snapshotData['itemStorage'] as String?;
    _itemCurrentValue = castToType<int>(snapshotData['itemCurrentValue']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('item_count')
          : FirebaseFirestore.instance.collectionGroup('item_count');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('item_count').doc(id);

  static Stream<ItemCountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemCountRecord.fromSnapshot(s));

  static Future<ItemCountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemCountRecord.fromSnapshot(s));

  static ItemCountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItemCountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemCountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemCountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemCountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemCountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemCountRecordData({
  String? itemName,
  String? itemUnit,
  double? itemQuantity,
  DocumentReference? itemReference,
  bool? counted,
  String? itemCategory,
  String? itemStorage,
  int? itemCurrentValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemName': itemName,
      'itemUnit': itemUnit,
      'itemQuantity': itemQuantity,
      'itemReference': itemReference,
      'counted': counted,
      'itemCategory': itemCategory,
      'itemStorage': itemStorage,
      'itemCurrentValue': itemCurrentValue,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemCountRecordDocumentEquality implements Equality<ItemCountRecord> {
  const ItemCountRecordDocumentEquality();

  @override
  bool equals(ItemCountRecord? e1, ItemCountRecord? e2) {
    return e1?.itemName == e2?.itemName &&
        e1?.itemUnit == e2?.itemUnit &&
        e1?.itemQuantity == e2?.itemQuantity &&
        e1?.itemReference == e2?.itemReference &&
        e1?.counted == e2?.counted &&
        e1?.itemCategory == e2?.itemCategory &&
        e1?.itemStorage == e2?.itemStorage &&
        e1?.itemCurrentValue == e2?.itemCurrentValue;
  }

  @override
  int hash(ItemCountRecord? e) => const ListEquality().hash([
        e?.itemName,
        e?.itemUnit,
        e?.itemQuantity,
        e?.itemReference,
        e?.counted,
        e?.itemCategory,
        e?.itemStorage,
        e?.itemCurrentValue
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemCountRecord;
}
