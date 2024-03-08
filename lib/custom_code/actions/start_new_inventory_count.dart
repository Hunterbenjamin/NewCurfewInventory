// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future startNewInventoryCount(
  List<InventoryItemsRecord> inventoryItems,
  DocumentReference inventoryCount,
) async {
  // for each item in inventoryItems create a document in inventoryCount subcollect, item_count
  for (var item in inventoryItems) {
    await inventoryCount.collection('item_count').add({
      'itemName': item.itemName,
      'itemReference': item.reference,
      'itemQuantity': null,
      'counted': false,
      'itemUnit': item.unit.unitSpecific,
      'itemCategory': item.category.categoryName,
      'itemCurrentValue': item.currentPrice,
    });
  }
}
