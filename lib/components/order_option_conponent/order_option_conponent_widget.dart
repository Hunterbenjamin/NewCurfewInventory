import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_option_conponent_model.dart';
export 'order_option_conponent_model.dart';

class OrderOptionConponentWidget extends StatefulWidget {
  const OrderOptionConponentWidget({
    super.key,
    this.supplierReference,
    required this.orderOption,
    this.selectedIndex,
    this.thisItemIndex,
    required this.itemUnit,
  });

  final DocumentReference? supplierReference;
  final OrderingOptionStruct? orderOption;
  final int? selectedIndex;
  final int? thisItemIndex;
  final String? itemUnit;

  @override
  State<OrderOptionConponentWidget> createState() =>
      _OrderOptionConponentWidgetState();
}

class _OrderOptionConponentWidgetState
    extends State<OrderOptionConponentWidget> {
  late OrderOptionConponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderOptionConponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 45.0,
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                widget.selectedIndex == widget.thisItemIndex
                    ? Color(0xFFE4EAEF)
                    : FlutterFlowTheme.of(context).secondaryBackground,
                FlutterFlowTheme.of(context).secondaryBackground,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: StreamBuilder<SuppliersRecord>(
                        stream: SuppliersRecord.getDocument(
                            widget.supplierReference!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final textSuppliersRecord = snapshot.data!;
                          return Text(
                            textSuppliersRecord.supplierName,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 16.0,
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.orderOption?.packSize?.toString()} ${widget.itemUnit}${widget.orderOption!.packSize > 1 ? 's' : ' '} ${widget.orderOption!.packSize > 1 ? '(${widget.orderOption?.purchaseUnit})' : '  '}',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
