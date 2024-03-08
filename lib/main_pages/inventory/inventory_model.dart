import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/count_inventory_component/count_inventory_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/utillity/start_new_inventory_count/start_new_inventory_count_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'inventory_widget.dart' show InventoryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InventoryModel extends FlutterFlowModel<InventoryWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  bool isEditing = false;

  bool activeCountSession = false;

  DocumentReference? inventoryCountsReference;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Inventory widget.
  InventoryCountsRecord? countReference;
  // Stores action output result for [Firestore Query - Query a collection] action in Inventory widget.
  List<InventoryItemsRecord>? inventoryItems;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for startNewInventoryCount component.
  late StartNewInventoryCountModel startNewInventoryCountModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    startNewInventoryCountModel =
        createModel(context, () => StartNewInventoryCountModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    startNewInventoryCountModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
