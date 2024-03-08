import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bottomsheets/new_order_bottom_sheet/new_order_bottom_sheet_widget.dart';
import '/components/draft_item_component/draft_item_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'new_order_widget.dart' show NewOrderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewOrderModel extends FlutterFlowModel<NewOrderWidget> {
  ///  Local state fields for this page.

  bool isEditing = false;

  bool activeOrderSession = false;

  bool isLoading = true;

  bool showBottomSheet = false;

  List<OrdersRecord> ordersPageState = [];
  void addToOrdersPageState(OrdersRecord item) => ordersPageState.add(item);
  void removeFromOrdersPageState(OrdersRecord item) =>
      ordersPageState.remove(item);
  void removeAtIndexFromOrdersPageState(int index) =>
      ordersPageState.removeAt(index);
  void insertAtIndexInOrdersPageState(int index, OrdersRecord item) =>
      ordersPageState.insert(index, item);
  void updateOrdersPageStateAtIndex(
          int index, Function(OrdersRecord) updateFn) =>
      ordersPageState[index] = updateFn(ordersPageState[index]);

  List<OrderItemsRecord> orderItemsPageState = [];
  void addToOrderItemsPageState(OrderItemsRecord item) =>
      orderItemsPageState.add(item);
  void removeFromOrderItemsPageState(OrderItemsRecord item) =>
      orderItemsPageState.remove(item);
  void removeAtIndexFromOrderItemsPageState(int index) =>
      orderItemsPageState.removeAt(index);
  void insertAtIndexInOrderItemsPageState(int index, OrderItemsRecord item) =>
      orderItemsPageState.insert(index, item);
  void updateOrderItemsPageStateAtIndex(
          int index, Function(OrderItemsRecord) updateFn) =>
      orderItemsPageState[index] = updateFn(orderItemsPageState[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in NewOrder widget.
  List<InventoryItemsRecord>? inventoryItems;
  // Stores action output result for [Firestore Query - Query a collection] action in NewOrder widget.
  List<OrdersRecord>? draftOrders;
  // Stores action output result for [Custom Action - getOrderItems] action in NewOrder widget.
  List<OrderItemsRecord>? orderItems;
  // Stores action output result for [Bottom Sheet - NewOrderBottomSheet] action in Button widget.
  OrderItemsRecord? returnedItem;
  // Stores action output result for [Bottom Sheet - NewOrderBottomSheet] action in Button widget.
  OrderItemsRecord? returnedItemDocument;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future addOrderItem(BuildContext context) async {}

  /// Additional helper methods are added here.
}
