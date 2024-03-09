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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inventory_model.dart';
export 'inventory_model.dart';

class InventoryWidget extends StatefulWidget {
  const InventoryWidget({super.key});

  @override
  State<InventoryWidget> createState() => _InventoryWidgetState();
}

class _InventoryWidgetState extends State<InventoryWidget> {
  late InventoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventoryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.countReference = await queryInventoryCountsRecordOnce(
        queryBuilder: (inventoryCountsRecord) => inventoryCountsRecord
            .where(
              'departmentReference',
              isEqualTo: FFAppState().departmentAppState.departmentReference,
            )
            .where(
              'status',
              isNotEqualTo: 'Completed',
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if ((_model.countReference?.reference != null) &&
          (_model.countReference?.departmentReference ==
              FFAppState().departmentAppState.departmentReference)) {
        setState(() {
          _model.activeCountSession = true;
          _model.inventoryCountsReference = _model.countReference?.reference;
        });
      } else {
        _model.inventoryItems = await queryInventoryItemsRecordOnce(
          queryBuilder: (inventoryItemsRecord) => inventoryItemsRecord
              .where(
                'departments',
                arrayContains: getDepartmentFirestoreData(
                  FFAppState().departmentAppState,
                  true,
                ),
              )
              .orderBy('itemName'),
        );
      }

      setState(() {
        _model.isLoading = false;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ItemCountRecord>>(
      stream: queryItemCountRecord(
        parent: _model.inventoryCountsReference,
        queryBuilder: (itemCountRecord) => itemCountRecord.orderBy('itemName'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ItemCountRecord> inventoryItemCountRecordList = snapshot.data!;
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
                  if (!_model.isEditing)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed(
                            'Dashboard',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 28.0,
                        ),
                      ),
                    ),
                  if (_model.isEditing)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.isEditing = false;
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 28.0,
                      ),
                    ),
                ],
              ),
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '${FFAppState().departmentAppState.departmentName} Inventory',
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                      if (!_model.isLoading && _model.activeCountSession)
                        Text(
                          '${inventoryItemCountRecordList.where((e) => e.counted).toList().length.toString()} of ${inventoryItemCountRecordList.length.toString()} counted',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).accent2,
                                  ),
                        ),
                    ],
                  ),
                ],
              ),
              actions: [
                Visibility(
                  visible: !_model.isEditing,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      setState(() {
                        _model.isEditing = true;
                      });
                    },
                    child: Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(),
                      child: Icon(
                        Icons.edit_note,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    if (!_model.isLoading && _model.activeCountSession)
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final inventoryVar =
                                    inventoryItemCountRecordList
                                        .map((e) => e)
                                        .toList();
                                return ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    155.0,
                                    0,
                                    0,
                                  ),
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  itemCount: inventoryVar.length,
                                  itemBuilder: (context, inventoryVarIndex) {
                                    final inventoryVarItem =
                                        inventoryVar[inventoryVarIndex];
                                    return Visibility(
                                      visible: () {
                                            if ((_model.textController.text ==
                                                        null ||
                                                    _model.textController
                                                            .text ==
                                                        '') &&
                                                (_model.dropDownValue2 ==
                                                        null ||
                                                    _model.dropDownValue2 ==
                                                        '')) {
                                              return (_model.dropDownValue1 ==
                                                      null ||
                                                  _model.dropDownValue1 == '');
                                            } else if ((_model.textController
                                                            .text ==
                                                        null ||
                                                    _model.textController
                                                            .text ==
                                                        '') &&
                                                valueOrDefault<bool>(
                                                  _model.dropDownValue2 ==
                                                      'true',
                                                  false,
                                                )) {
                                              return ((_model.dropDownValue1 ==
                                                          null ||
                                                      _model.dropDownValue1 ==
                                                          '') &&
                                                  (inventoryVarItem.counted ==
                                                      true));
                                            } else if ((_model.textController
                                                            .text ==
                                                        null ||
                                                    _model.textController
                                                            .text ==
                                                        '') &&
                                                (_model.dropDownValue2 ==
                                                    'false')) {
                                              return ((_model.dropDownValue1 ==
                                                          null ||
                                                      _model.dropDownValue1 ==
                                                          '') &&
                                                  (inventoryVarItem.counted ==
                                                      false));
                                            } else {
                                              return false;
                                            }
                                          }() ||
                                          () {
                                            if ((_model.textController.text ==
                                                        null ||
                                                    _model.textController
                                                            .text ==
                                                        '') &&
                                                (_model.dropDownValue2 ==
                                                        null ||
                                                    _model.dropDownValue2 ==
                                                        '')) {
                                              return (inventoryVarItem
                                                      .itemCategory ==
                                                  _model.dropDownValue1);
                                            } else if ((_model.textController
                                                            .text ==
                                                        null ||
                                                    _model.textController
                                                            .text ==
                                                        '') &&
                                                valueOrDefault<bool>(
                                                  _model.dropDownValue2 ==
                                                      'true',
                                                  false,
                                                )) {
                                              return ((inventoryVarItem
                                                          .itemCategory ==
                                                      _model.dropDownValue1) &&
                                                  (inventoryVarItem.counted ==
                                                      true));
                                            } else if ((_model.textController
                                                            .text ==
                                                        null ||
                                                    _model.textController
                                                            .text ==
                                                        '') &&
                                                (_model.dropDownValue2 ==
                                                    'false')) {
                                              return ((inventoryVarItem
                                                          .itemCategory ==
                                                      _model.dropDownValue1) &&
                                                  (inventoryVarItem.counted ==
                                                      false));
                                            } else {
                                              return false;
                                            }
                                          }() ||
                                          (_model.textController.text != null &&
                                                  _model.textController.text !=
                                                      ''
                                              ? functions.showSearchResults(
                                                  _model.textController.text,
                                                  inventoryVarItem.itemName)
                                              : false),
                                      child: CountInventoryComponentWidget(
                                        key: Key(
                                            'Keyyor_${inventoryVarIndex}_of_${inventoryVar.length}'),
                                        isEditing: _model.isEditing,
                                        itemCount: inventoryVarItem,
                                        turnEditModeOff: () async {},
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  child: Container(
                                    height: 155.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownValueController1 ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: functions
                                                          .getUniqueCategories(
                                                              inventoryItemCountRecordList
                                                                  .toList()),
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .dropDownValue1 =
                                                              val),
                                                      height: 45.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                              ),
                                                      hintText: 'Category',
                                                      icon: Icon(
                                                        Icons.filter_list,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderWidth: 1.0,
                                                      borderRadius: 5.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownValueController2 ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options:
                                                          List<String>.from([
                                                        'true',
                                                        'false'
                                                      ]),
                                                      optionLabels: [
                                                        'Counted',
                                                        'Not Counted'
                                                      ],
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .dropDownValue2 =
                                                              val),
                                                      height: 45.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                              ),
                                                      hintText: 'Counted',
                                                      icon: Icon(
                                                        Icons.filter_list,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderWidth: 1.0,
                                                      borderRadius: 5.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
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
                                                    setState(() {
                                                      _model
                                                          .dropDownValueController1
                                                          ?.reset();
                                                      _model
                                                          .dropDownValueController2
                                                          ?.reset();
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.refresh_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 26.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            height: 45.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController',
                                                  Duration(milliseconds: 100),
                                                  () => setState(() {}),
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: 'Search',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                      ),
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
                                                            5.0),
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
                                                            5.0),
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
                                                            5.0),
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
                                                            5.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                  suffixIcon:
                                                      _model.textController!
                                                              .text.isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .textController
                                                                    ?.clear();
                                                                setState(() {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 26.0,
                                                              ),
                                                            )
                                                          : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 16.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            height: 35.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              border: Border.all(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Name',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 5,
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Quantity',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Unit',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          height: 1.0,
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    if (!_model.isLoading && !_model.activeCountSession)
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.startNewInventoryCountModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: StartNewInventoryCountWidget(
                              inventoryItems: _model.inventoryItems,
                              activeCountTurnOn: (newCountReference) async {
                                setState(() {
                                  _model.activeCountSession = true;
                                  _model.inventoryCountsReference =
                                      newCountReference;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
