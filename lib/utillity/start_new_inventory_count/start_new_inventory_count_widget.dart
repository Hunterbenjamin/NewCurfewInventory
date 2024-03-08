import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'start_new_inventory_count_model.dart';
export 'start_new_inventory_count_model.dart';

class StartNewInventoryCountWidget extends StatefulWidget {
  const StartNewInventoryCountWidget({
    super.key,
    this.inventoryItems,
    required this.activeCountTurnOn,
  });

  final List<InventoryItemsRecord>? inventoryItems;
  final Future Function(DocumentReference? newCountReference)?
      activeCountTurnOn;

  @override
  State<StartNewInventoryCountWidget> createState() =>
      _StartNewInventoryCountWidgetState();
}

class _StartNewInventoryCountWidgetState
    extends State<StartNewInventoryCountWidget> {
  late StartNewInventoryCountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartNewInventoryCountModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 350.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/EmptyOrderImage.png',
                  height: 100.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                'There is no count session\nin progress.\n\nClick the \"Start Count\" button\nto begin.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  var inventoryCountsRecordReference =
                      InventoryCountsRecord.collection.doc();
                  await inventoryCountsRecordReference
                      .set(createInventoryCountsRecordData(
                    countDate: getCurrentTimestamp,
                    departmentReference:
                        FFAppState().departmentAppState.departmentReference,
                    status: 'In Progress',
                  ));
                  _model.newInventoryCount =
                      InventoryCountsRecord.getDocumentFromData(
                          createInventoryCountsRecordData(
                            countDate: getCurrentTimestamp,
                            departmentReference: FFAppState()
                                .departmentAppState
                                .departmentReference,
                            status: 'In Progress',
                          ),
                          inventoryCountsRecordReference);
                  await actions.startNewInventoryCount(
                    widget.inventoryItems!.toList(),
                    _model.newInventoryCount!.reference,
                  );
                  await widget.activeCountTurnOn?.call(
                    _model.newInventoryCount?.reference,
                  );

                  setState(() {});
                },
                text: 'Start Count',
                options: FFButtonOptions(
                  width: 150.0,
                  height: 45.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
