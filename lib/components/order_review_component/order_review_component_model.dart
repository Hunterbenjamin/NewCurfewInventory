import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bottomsheets/bottom_sheet_notes/bottom_sheet_notes_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/utillity/button_send_order/button_send_order_widget.dart';
import 'order_review_component_widget.dart' show OrderReviewComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderReviewComponentModel
    extends FlutterFlowModel<OrderReviewComponentWidget> {
  ///  Local state fields for this component.

  String? exsistingNote;

  bool wasClicked = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in OrderReviewComponent widget.
  SuppliersRecord? supplierDocument;
  // Model for Button1.
  late ButtonSendOrderModel button1Model;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    button1Model = createModel(context, () => ButtonSendOrderModel());
  }

  @override
  void dispose() {
    button1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
