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

Future<List<OrderItemsRecord>> getOrderItems(
    List<DocumentReference> orderReferences) async {
  List<OrderItemsRecord> orderItems = [];

  for (var orderRef in orderReferences) {
    var querySnapshot = await orderRef.collection('order_items').get();

    var orderItemsForOrder = querySnapshot.docs
        .map((doc) => OrderItemsRecord.fromSnapshot(doc))
        .toList();

    orderItems.addAll(orderItemsForOrder);
  }

  return orderItems;
}
