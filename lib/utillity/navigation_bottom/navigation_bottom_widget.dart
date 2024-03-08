import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigation_bottom_model.dart';
export 'navigation_bottom_model.dart';

class NavigationBottomWidget extends StatefulWidget {
  const NavigationBottomWidget({
    super.key,
    int? selectedPageIndex,
    bool? hidden,
  })  : this.selectedPageIndex = selectedPageIndex ?? 1,
        this.hidden = hidden ?? false;

  final int selectedPageIndex;
  final bool hidden;

  @override
  State<NavigationBottomWidget> createState() => _NavigationBottomWidgetState();
}

class _NavigationBottomWidgetState extends State<NavigationBottomWidget> {
  late NavigationBottomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBottomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent4,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: valueOrDefault<Color>(
                          widget.selectedPageIndex == 1
                              ? FlutterFlowTheme.of(context).accent1
                              : FlutterFlowTheme.of(context).accent2,
                          FlutterFlowTheme.of(context).accent2,
                        ),
                        size: 26.0,
                      ),
                      Text(
                        'Home',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: valueOrDefault<Color>(
                                widget.selectedPageIndex == 1
                                    ? FlutterFlowTheme.of(context).accent1
                                    : FlutterFlowTheme.of(context).accent2,
                                FlutterFlowTheme.of(context).accent2,
                              ),
                              fontSize: 12.0,
                            ),
                      ),
                      SizedBox(
                        width: 40.0,
                        child: Divider(
                          height: 10.0,
                          thickness: 2.0,
                          color: valueOrDefault<Color>(
                            widget.selectedPageIndex == 1
                                ? FlutterFlowTheme.of(context).accent1
                                : FlutterFlowTheme.of(context).accent2,
                            FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      'Inventory',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.apps,
                        color: valueOrDefault<Color>(
                          widget.selectedPageIndex == 2
                              ? FlutterFlowTheme.of(context).accent1
                              : FlutterFlowTheme.of(context).accent2,
                          FlutterFlowTheme.of(context).accent2,
                        ),
                        size: 26.0,
                      ),
                      Text(
                        'Inventory',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: valueOrDefault<Color>(
                                widget.selectedPageIndex == 2
                                    ? FlutterFlowTheme.of(context).accent1
                                    : FlutterFlowTheme.of(context).accent2,
                                FlutterFlowTheme.of(context).accent2,
                              ),
                              fontSize: 12.0,
                            ),
                      ),
                      SizedBox(
                        width: 40.0,
                        child: Divider(
                          height: 10.0,
                          thickness: 2.0,
                          color: valueOrDefault<Color>(
                            widget.selectedPageIndex == 2
                                ? FlutterFlowTheme.of(context).accent1
                                : FlutterFlowTheme.of(context).accent2,
                            FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'NewOrder',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: valueOrDefault<Color>(
                          widget.selectedPageIndex == 3
                              ? FlutterFlowTheme.of(context).accent1
                              : FlutterFlowTheme.of(context).accent2,
                          FlutterFlowTheme.of(context).accent2,
                        ),
                        size: 26.0,
                      ),
                      Text(
                        'New Order',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: valueOrDefault<Color>(
                                widget.selectedPageIndex == 3
                                    ? FlutterFlowTheme.of(context).accent1
                                    : FlutterFlowTheme.of(context).accent2,
                                FlutterFlowTheme.of(context).accent2,
                              ),
                              fontSize: 12.0,
                            ),
                      ),
                      SizedBox(
                        width: 40.0,
                        child: Divider(
                          height: 10.0,
                          thickness: 2.0,
                          color: valueOrDefault<Color>(
                            widget.selectedPageIndex == 3
                                ? FlutterFlowTheme.of(context).accent1
                                : FlutterFlowTheme.of(context).accent2,
                            FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'Orders',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        color: valueOrDefault<Color>(
                          widget.selectedPageIndex == 4
                              ? FlutterFlowTheme.of(context).accent1
                              : FlutterFlowTheme.of(context).accent2,
                          FlutterFlowTheme.of(context).accent2,
                        ),
                        size: 26.0,
                      ),
                      Text(
                        'Orders',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: valueOrDefault<Color>(
                                widget.selectedPageIndex == 4
                                    ? FlutterFlowTheme.of(context).accent1
                                    : FlutterFlowTheme.of(context).accent2,
                                FlutterFlowTheme.of(context).accent2,
                              ),
                              fontSize: 12.0,
                            ),
                      ),
                      SizedBox(
                        width: 40.0,
                        child: Divider(
                          height: 10.0,
                          thickness: 2.0,
                          color: valueOrDefault<Color>(
                            widget.selectedPageIndex == 4
                                ? FlutterFlowTheme.of(context).accent1
                                : FlutterFlowTheme.of(context).accent2,
                            FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
            ),
          ),
        ],
      ),
    );
  }
}
