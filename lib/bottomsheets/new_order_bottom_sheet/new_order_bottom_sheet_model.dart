import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/order_option_conponent/order_option_conponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'new_order_bottom_sheet_widget.dart' show NewOrderBottomSheetWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewOrderBottomSheetModel
    extends FlutterFlowModel<NewOrderBottomSheetWidget> {
  ///  Local state fields for this component.

  InventoryItemsRecord? selectedItemDocument;

  bool itemSelected = false;

  OrderingOptionStruct? selectedOrderOption;
  void updateSelectedOrderOptionStruct(
          Function(OrderingOptionStruct) updateFn) =>
      updateFn(selectedOrderOption ??= OrderingOptionStruct());

  int? selectedOrderIndex;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for CounterField widget.
  FocusNode? counterFieldFocusNode;
  TextEditingController? counterFieldController;
  String? Function(BuildContext, String?)? counterFieldControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrderItemsRecord? newOrderItem1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? newDraftOrder2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrderItemsRecord? newOrderItem2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? newDraftOrder3;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrderItemsRecord? newOrderItem3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    counterFieldFocusNode?.dispose();
    counterFieldController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
