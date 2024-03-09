import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/order_option_conponent/order_option_conponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_order_bottom_sheet_model.dart';
export 'new_order_bottom_sheet_model.dart';

class NewOrderBottomSheetWidget extends StatefulWidget {
  const NewOrderBottomSheetWidget({
    super.key,
    this.listofItems,
    this.newDraftOrders,
    required this.addOrderAction,
  });

  final List<InventoryItemsRecord>? listofItems;
  final List<OrdersRecord>? newDraftOrders;
  final Future Function(OrdersRecord? orderToAdd)? addOrderAction;

  @override
  State<NewOrderBottomSheetWidget> createState() =>
      _NewOrderBottomSheetWidgetState();
}

class _NewOrderBottomSheetWidgetState extends State<NewOrderBottomSheetWidget> {
  late NewOrderBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewOrderBottomSheetModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.counterFieldController ??= TextEditingController(text: '2');
    _model.counterFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 700.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: StickyHeader(
                          overlapHeaders: false,
                          header: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Item',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Color(0xFF767679),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController1,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController1',
                                        Duration(milliseconds: 100),
                                        () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 16.0,
                                          ),
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          content: Visibility(
                            visible: !_model.itemSelected,
                            child: Builder(
                              builder: (context) {
                                final inventoryItem = widget.listofItems
                                        ?.map((e) => e)
                                        .toList()
                                        ?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: inventoryItem.length,
                                  itemBuilder: (context, inventoryItemIndex) {
                                    final inventoryItemItem =
                                        inventoryItem[inventoryItemIndex];
                                    return Visibility(
                                      visible: functions.showSearchResults(
                                          _model.textController1.text,
                                          inventoryItemItem.itemName),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.selectedItemDocument =
                                                inventoryItemItem;
                                          });
                                          setState(() {
                                            _model.textController1?.text =
                                                inventoryItemItem.itemName;
                                          });
                                          setState(() {
                                            _model.itemSelected = true;
                                          });
                                          setState(() {
                                            _model.selectedOrderOption =
                                                inventoryItemItem
                                                    .orderingOptions.first;
                                            _model.selectedOrderIndex = 0;
                                          });
                                        },
                                        child: Container(
                                          height: 45.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.circle_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  inventoryItemItem.itemName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      if (_model.itemSelected)
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 300.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Purchase Option',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF767679),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final orderOptionVar = _model
                                            .selectedItemDocument
                                            ?.orderingOptions
                                            ?.map((e) => e)
                                            .toList()
                                            ?.toList() ??
                                        [];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(orderOptionVar.length,
                                              (orderOptionVarIndex) {
                                        final orderOptionVarItem =
                                            orderOptionVar[orderOptionVarIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.selectedOrderIndex =
                                                  orderOptionVarIndex;
                                              _model.selectedOrderOption =
                                                  orderOptionVarItem;
                                            });
                                          },
                                          child: OrderOptionConponentWidget(
                                            key: Key(
                                                'Key241_${orderOptionVarIndex}_of_${orderOptionVar.length}'),
                                            supplierReference:
                                                orderOptionVarItem
                                                    .supplierReference,
                                            orderOption: orderOptionVarItem,
                                            selectedIndex:
                                                _model.selectedOrderIndex,
                                            thisItemIndex: orderOptionVarIndex,
                                            itemUnit: _model
                                                .selectedItemDocument!
                                                .unit
                                                .unitSpecific,
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (_model.itemSelected)
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 550.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Order Quantity',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF767679),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Container(
                                              width: 170.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        _model
                                                            .counterFieldController
                                                            ?.text = (double
                                                                    .parse(_model
                                                                        .counterFieldController
                                                                        .text) -
                                                                1)
                                                            .toString();
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons.minus,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (_model.counterFieldController
                                                                  .text ==
                                                              null ||
                                                          _model.counterFieldController
                                                                  .text ==
                                                              '') {
                                                        setState(() {
                                                          _model
                                                              .counterFieldController
                                                              ?.text = '1';
                                                        });
                                                      } else {
                                                        setState(() {
                                                          _model
                                                              .counterFieldController
                                                              ?.text = ((double
                                                                  var1) {
                                                            return '${var1 == var1.toInt() ? var1.toInt() : var1 + 1}';
                                                          }(
                                                              double.parse(_model
                                                                  .counterFieldController
                                                                  .text)));
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons.plus,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(),
                                              child: Container(
                                                width: 70.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .counterFieldController,
                                                  focusNode: _model
                                                      .counterFieldFocusNode,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 16.0,
                                                        ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 18.0,
                                                      ),
                                                  textAlign: TextAlign.center,
                                                  validator: _model
                                                      .counterFieldControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              _model.selectedOrderOption
                                                  ?.purchaseUnit,
                                              'unit',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 18.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          height: 65.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  setState(() {
                                    _model.itemSelected = false;
                                  });
                                  setState(() {
                                    _model.textController1?.clear();
                                    _model.counterFieldController?.text = '2';
                                  });
                                },
                                text: 'Cancel',
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 45.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.transparent,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (widget.newDraftOrders != null &&
                                      (widget.newDraftOrders)!.isNotEmpty) {
                                    if (widget.newDraftOrders!
                                        .where((e) =>
                                            e.supplierReference ==
                                            _model.selectedOrderOption
                                                ?.supplierReference)
                                        .toList()
                                        .isNotEmpty) {
                                      var orderItemsRecordReference1 =
                                          OrderItemsRecord.createDoc(widget
                                              .newDraftOrders!
                                              .where((e) =>
                                                  e.supplierReference ==
                                                  _model.selectedOrderOption
                                                      ?.supplierReference)
                                              .toList()
                                              .first
                                              .reference);
                                      await orderItemsRecordReference1
                                          .set(createOrderItemsRecordData(
                                        itemReference: _model
                                            .selectedItemDocument?.reference,
                                        itemName: _model
                                            .selectedItemDocument?.itemName,
                                        unit: _model
                                            .selectedOrderOption?.purchaseUnit,
                                        pricePerUnit: _model
                                            .selectedItemDocument?.currentPrice,
                                        quantityOrdered: double.tryParse(
                                            _model.counterFieldController.text),
                                      ));
                                      _model.newOrderItem1 =
                                          OrderItemsRecord.getDocumentFromData(
                                              createOrderItemsRecordData(
                                                itemReference: _model
                                                    .selectedItemDocument
                                                    ?.reference,
                                                itemName: _model
                                                    .selectedItemDocument
                                                    ?.itemName,
                                                unit: _model.selectedOrderOption
                                                    ?.purchaseUnit,
                                                pricePerUnit: _model
                                                    .selectedItemDocument
                                                    ?.currentPrice,
                                                quantityOrdered:
                                                    double.tryParse(_model
                                                        .counterFieldController
                                                        .text),
                                              ),
                                              orderItemsRecordReference1);
                                      Navigator.pop(
                                          context, _model.newOrderItem1);
                                    } else {
                                      var ordersRecordReference1 =
                                          OrdersRecord.collection.doc();
                                      await ordersRecordReference1
                                          .set(createOrdersRecordData(
                                        departmentReference: FFAppState()
                                            .departmentAppState
                                            .departmentReference,
                                        supplierReference: _model
                                            .selectedOrderOption
                                            ?.supplierReference,
                                        status: 'Draft',
                                        orderID: '10102',
                                      ));
                                      _model.newDraftOrder2 =
                                          OrdersRecord.getDocumentFromData(
                                              createOrdersRecordData(
                                                departmentReference:
                                                    FFAppState()
                                                        .departmentAppState
                                                        .departmentReference,
                                                supplierReference: _model
                                                    .selectedOrderOption
                                                    ?.supplierReference,
                                                status: 'Draft',
                                                orderID: '10102',
                                              ),
                                              ordersRecordReference1);
                                      await widget.addOrderAction?.call(
                                        _model.newDraftOrder2,
                                      );

                                      var orderItemsRecordReference2 =
                                          OrderItemsRecord.createDoc(
                                              _model.newDraftOrder2!.reference);
                                      await orderItemsRecordReference2
                                          .set(createOrderItemsRecordData(
                                        itemReference: _model
                                            .selectedItemDocument?.reference,
                                        itemName: _model
                                            .selectedItemDocument?.itemName,
                                        unit: _model
                                            .selectedOrderOption?.purchaseUnit,
                                        pricePerUnit: _model
                                            .selectedItemDocument?.currentPrice,
                                        quantityOrdered: double.tryParse(
                                            _model.counterFieldController.text),
                                      ));
                                      _model.newOrderItem2 =
                                          OrderItemsRecord.getDocumentFromData(
                                              createOrderItemsRecordData(
                                                itemReference: _model
                                                    .selectedItemDocument
                                                    ?.reference,
                                                itemName: _model
                                                    .selectedItemDocument
                                                    ?.itemName,
                                                unit: _model.selectedOrderOption
                                                    ?.purchaseUnit,
                                                pricePerUnit: _model
                                                    .selectedItemDocument
                                                    ?.currentPrice,
                                                quantityOrdered:
                                                    double.tryParse(_model
                                                        .counterFieldController
                                                        .text),
                                              ),
                                              orderItemsRecordReference2);
                                      Navigator.pop(
                                          context, _model.newOrderItem2);
                                    }
                                  } else {
                                    var ordersRecordReference2 =
                                        OrdersRecord.collection.doc();
                                    await ordersRecordReference2
                                        .set(createOrdersRecordData(
                                      departmentReference: FFAppState()
                                          .departmentAppState
                                          .departmentReference,
                                      supplierReference: _model
                                          .selectedOrderOption
                                          ?.supplierReference,
                                      status: 'Draft',
                                      orderID: '10102',
                                    ));
                                    _model.newDraftOrder3 =
                                        OrdersRecord.getDocumentFromData(
                                            createOrdersRecordData(
                                              departmentReference: FFAppState()
                                                  .departmentAppState
                                                  .departmentReference,
                                              supplierReference: _model
                                                  .selectedOrderOption
                                                  ?.supplierReference,
                                              status: 'Draft',
                                              orderID: '10102',
                                            ),
                                            ordersRecordReference2);
                                    await widget.addOrderAction?.call(
                                      _model.newDraftOrder3,
                                    );

                                    var orderItemsRecordReference3 =
                                        OrderItemsRecord.createDoc(
                                            _model.newDraftOrder3!.reference);
                                    await orderItemsRecordReference3
                                        .set(createOrderItemsRecordData(
                                      itemReference: _model
                                          .selectedItemDocument?.reference,
                                      itemName:
                                          _model.selectedItemDocument?.itemName,
                                      unit: _model
                                          .selectedOrderOption?.purchaseUnit,
                                      pricePerUnit: _model
                                          .selectedItemDocument?.currentPrice,
                                      quantityOrdered: double.tryParse(
                                          _model.counterFieldController.text),
                                    ));
                                    _model.newOrderItem3 =
                                        OrderItemsRecord.getDocumentFromData(
                                            createOrderItemsRecordData(
                                              itemReference: _model
                                                  .selectedItemDocument
                                                  ?.reference,
                                              itemName: _model
                                                  .selectedItemDocument
                                                  ?.itemName,
                                              unit: _model.selectedOrderOption
                                                  ?.purchaseUnit,
                                              pricePerUnit: _model
                                                  .selectedItemDocument
                                                  ?.currentPrice,
                                              quantityOrdered: double.tryParse(
                                                  _model.counterFieldController
                                                      .text),
                                            ),
                                            orderItemsRecordReference3);
                                    Navigator.pop(
                                        context, _model.newOrderItem3);
                                  }

                                  setState(() {});
                                },
                                text: 'Add to Order',
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 45.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
