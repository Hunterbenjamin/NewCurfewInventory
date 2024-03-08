import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_detail_component_model.dart';
export 'order_detail_component_model.dart';

class OrderDetailComponentWidget extends StatefulWidget {
  const OrderDetailComponentWidget({
    super.key,
    required this.orderItem,
    bool? isReceiving,
    bool? isCompleted,
    required this.textFieldCallback,
  })  : this.isReceiving = isReceiving ?? false,
        this.isCompleted = isCompleted ?? false;

  final OrderItemsRecord? orderItem;
  final bool isReceiving;
  final bool isCompleted;
  final Future Function()? textFieldCallback;

  @override
  State<OrderDetailComponentWidget> createState() =>
      _OrderDetailComponentWidgetState();
}

class _OrderDetailComponentWidgetState
    extends State<OrderDetailComponentWidget> {
  late OrderDetailComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderDetailComponentModel());

    _model.textController ??= TextEditingController(
        text: (widget.orderItem?.received == true
                ? widget.orderItem?.quantityReceived
                : null)
            ?.toString());
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      constraints: BoxConstraints(
                        maxWidth: 100.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.orderItem?.itemName,
                            'name',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 18.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          widget.orderItem!.quantityOrdered.toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 18.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: () {
                              if ((_model.textFieldFocusNode?.hasFocus ??
                                      false) &&
                                  widget.isReceiving) {
                                return FlutterFlowTheme.of(context).info;
                              } else if (widget.isReceiving) {
                                return FlutterFlowTheme.of(context)
                                    .secondaryText;
                              } else {
                                return Colors.transparent;
                              }
                            }(),
                          ),
                        ),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 100),
                            () async {
                              if (_model.textController.text != null &&
                                  _model.textController.text != '') {
                                await widget.orderItem!.reference
                                    .update(createOrderItemsRecordData(
                                  quantityReceived: double.tryParse(
                                      _model.textController.text),
                                  received: true,
                                ));
                              } else {
                                await widget.orderItem!.reference
                                    .update(createOrderItemsRecordData(
                                  quantityReceived: double.tryParse(
                                      _model.textController.text),
                                  received: false,
                                ));
                              }

                              await widget.textFieldCallback?.call();
                            },
                          ),
                          textInputAction: TextInputAction.next,
                          readOnly: !widget.isReceiving || widget.isCompleted,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 18.0,
                                ),
                            hintText: () {
                              if (widget.isReceiving &&
                                  (_model.textFieldFocusNode?.hasFocus ??
                                      false)) {
                                return null;
                              } else if (widget.isReceiving) {
                                return '0.00';
                              } else {
                                return null;
                              }
                            }(),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 18.0,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 18.0,
                                  ),
                          textAlign: TextAlign.center,
                          maxLength: 10,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.orderItem?.unit,
                              'unit',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 18.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent4,
          ),
        ],
      ),
    );
  }
}
