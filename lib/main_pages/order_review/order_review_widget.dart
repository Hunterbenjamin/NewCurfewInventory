import '/backend/backend.dart';
import '/components/order_review_component/order_review_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_review_model.dart';
export 'order_review_model.dart';

class OrderReviewWidget extends StatefulWidget {
  const OrderReviewWidget({
    super.key,
    this.draftOrders,
    required this.listofInventoryItems,
  });

  final List<OrdersRecord>? draftOrders;
  final List<InventoryItemsRecord>? listofInventoryItems;

  @override
  State<OrderReviewWidget> createState() => _OrderReviewWidgetState();
}

class _OrderReviewWidgetState extends State<OrderReviewWidget> {
  late OrderReviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderReviewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('NewOrder');
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).secondary,
              size: 28.0,
            ),
          ),
          title: Text(
            'Order Review',
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Visibility(
          visible: !_model.isLoading,
          child: Builder(
            builder: (context) {
              final orderVar = widget.draftOrders?.toList() ?? [];
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(orderVar.length, (orderVarIndex) {
                  final orderVarItem = orderVar[orderVarIndex];
                  return OrderReviewComponentWidget(
                    key: Key('Key1j7_${orderVarIndex}_of_${orderVar.length}'),
                    orderDocument: orderVarItem,
                  );
                })
                    .divide(SizedBox(height: 15.0))
                    .addToStart(SizedBox(height: 10.0)),
              );
            },
          ),
        ),
      ),
    );
  }
}
