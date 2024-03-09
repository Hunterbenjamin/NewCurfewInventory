import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bottomsheets/new_order_bottom_sheet/new_order_bottom_sheet_widget.dart';
import '/components/draft_item_component/draft_item_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_order_model.dart';
export 'new_order_model.dart';

class NewOrderWidget extends StatefulWidget {
  const NewOrderWidget({super.key});

  @override
  State<NewOrderWidget> createState() => _NewOrderWidgetState();
}

class _NewOrderWidgetState extends State<NewOrderWidget> {
  late NewOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewOrderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.inventoryItems = await queryInventoryItemsRecordOnce(
        queryBuilder: (inventoryItemsRecord) => inventoryItemsRecord
            .where(
              'departments',
              arrayContains: getDepartmentFirestoreData(
                FFAppState().departmentAppState,
                true,
              ),
            )
            .where(
              'purchased',
              isEqualTo: true,
            )
            .orderBy('itemName'),
      );
      _model.draftOrders = await queryOrdersRecordOnce(
        queryBuilder: (ordersRecord) => ordersRecord
            .where(
              'departmentReference',
              isEqualTo: FFAppState().departmentAppState.departmentReference,
            )
            .where(
              'status',
              isEqualTo: 'Draft',
            ),
      );
      _model.orderItems = await actions.getOrderItems(
        _model.draftOrders!.map((e) => e.reference).toList().toList(),
      );
      if ((_model.draftOrders != null && (_model.draftOrders)!.isNotEmpty) &&
          (_model.draftOrders!
              .where((e) => e.status == 'Draft')
              .toList()
              .isNotEmpty)) {
        setState(() {
          _model.activeOrderSession = true;
          _model.ordersPageState =
              _model.draftOrders!.toList().cast<OrdersRecord>();
        });
        setState(() {
          _model.orderItemsPageState =
              _model.orderItems!.toList().cast<OrderItemsRecord>();
        });
      }
      setState(() {
        _model.isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              if (_model.isEditing)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.isEditing = false;
                      _model.showBottomSheet = false;
                    });
                  },
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 28.0,
                  ),
                ),
              if (!_model.isEditing && !_model.showBottomSheet)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed('Dashboard');
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 28.0,
                  ),
                ),
            ],
          ),
          title: Text(
            'New Order',
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: !_model.isEditing &&
                        !_model.showBottomSheet &&
                        (_model.ordersPageState.isNotEmpty),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.isEditing = !_model.isEditing;
                        });
                      },
                      child: Icon(
                        Icons.edit_note,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          height: MediaQuery.sizeOf(context).height * 1.0,
          child: Stack(
            children: [
              Builder(
                builder: (context) {
                  final orderVar = _model.ordersPageState.toList();
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(orderVar.length, (orderVarIndex) {
                        final orderVarItem = orderVar[orderVarIndex];
                        return StreamBuilder<SuppliersRecord>(
                          stream: SuppliersRecord.getDocument(
                              orderVarItem.supplierReference!),
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
                            final containerSuppliersRecord = snapshot.data!;
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        containerSuppliersRecord.supplierName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final orderItem = _model
                                          .orderItemsPageState
                                          .where((e) =>
                                              e.parentReference ==
                                              orderVarItem.reference)
                                          .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: orderItem.length,
                                        itemBuilder: (context, orderItemIndex) {
                                          final orderItemItem =
                                              orderItem[orderItemIndex];
                                          return DraftItemComponentWidget(
                                            key: Key(
                                                'Keyfu9_${orderItemIndex}_of_${orderItem.length}'),
                                            isEditing: _model.isEditing,
                                            draftItem: orderItemItem,
                                            orderReference:
                                                orderVarItem.reference,
                                            removeItemAction: () async {
                                              setState(() {
                                                _model
                                                    .removeFromOrderItemsPageState(
                                                        orderItemItem);
                                              });
                                              if (_model.orderItemsPageState
                                                  .where((e) =>
                                                      e.parentReference ==
                                                      orderVarItem.reference)
                                                  .toList()
                                                  .isNotEmpty) {
                                                return;
                                              }

                                              await orderVarItem.reference
                                                  .delete();
                                              setState(() {
                                                _model
                                                    .removeFromOrdersPageState(
                                                        orderVarItem);
                                              });
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.goNamed(
                                          'OrderReview',
                                          queryParameters: {
                                            'draftOrders': serializeParam(
                                              _model.ordersPageState
                                                  .where((e) =>
                                                      e.reference ==
                                                      orderVarItem.reference)
                                                  .toList(),
                                              ParamType.Document,
                                              true,
                                            ),
                                            'listofInventoryItems':
                                                serializeParam(
                                              _model.inventoryItems,
                                              ParamType.Document,
                                              true,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'draftOrders': _model
                                                .ordersPageState
                                                .where((e) =>
                                                    e.reference ==
                                                    orderVarItem.reference)
                                                .toList(),
                                            'listofInventoryItems':
                                                _model.inventoryItems,
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'View Order',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 18.0,
                                                        ),
                                              ),
                                              Icon(
                                                Icons.navigate_next,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 30.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).addToEnd(SizedBox(height: 70.0)),
                    ),
                  );
                },
              ),
              if (!_model.isLoading && !(_model.ordersPageState.isNotEmpty))
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/EmptyOrderImage.png',
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'It\'s empty here',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Add your first item by \ntapping the \"Add Item\" button',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: NewOrderBottomSheetWidget(
                                        listofItems: _model.inventoryItems,
                                        newDraftOrders: _model.ordersPageState,
                                        addOrderAction: (orderToAdd) async {
                                          setState(() {
                                            _model.addToOrdersPageState(
                                                orderToAdd!);
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(
                                  () => _model.returnedItem = value));

                              setState(() {
                                _model.addToOrderItemsPageState(
                                    _model.returnedItem!);
                              });

                              setState(() {});
                            },
                            text: 'Add Item',
                            icon: Icon(
                              Icons.add,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: 200.0,
                              height: 45.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (_model.ordersPageState.isNotEmpty)
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.goNamed(
                                  'OrderReview',
                                  queryParameters: {
                                    'draftOrders': serializeParam(
                                      _model.ordersPageState,
                                      ParamType.Document,
                                      true,
                                    ),
                                    'listofInventoryItems': serializeParam(
                                      _model.inventoryItems,
                                      ParamType.Document,
                                      true,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'draftOrders': _model.ordersPageState,
                                    'listofInventoryItems':
                                        _model.inventoryItems,
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: 'View All Orders',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 18.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                          Flexible(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: NewOrderBottomSheetWidget(
                                          listofItems: _model.inventoryItems,
                                          newDraftOrders:
                                              _model.ordersPageState,
                                          addOrderAction: (orderToAdd) async {
                                            setState(() {
                                              _model.addToOrdersPageState(
                                                  orderToAdd!);
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(
                                    () => _model.returnedItemDocument = value));

                                setState(() {
                                  _model.addToOrderItemsPageState(
                                      _model.returnedItemDocument!);
                                });

                                setState(() {});
                              },
                              text: 'Add Item',
                              icon: Icon(
                                Icons.add,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 15.0))
                            .around(SizedBox(width: 15.0)),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
