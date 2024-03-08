import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_send_order_model.dart';
export 'button_send_order_model.dart';

class ButtonSendOrderWidget extends StatefulWidget {
  const ButtonSendOrderWidget({
    super.key,
    required this.buttonAction,
    this.icon,
    this.startingText,
    this.endingTest,
  });

  final Future Function()? buttonAction;
  final Widget? icon;
  final String? startingText;
  final String? endingTest;

  @override
  State<ButtonSendOrderWidget> createState() => _ButtonSendOrderWidgetState();
}

class _ButtonSendOrderWidgetState extends State<ButtonSendOrderWidget> {
  late ButtonSendOrderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonSendOrderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: _model.wasClicked
          ? null
          : () async {
              await widget.buttonAction?.call();
              setState(() {
                _model.wasClicked = true;
              });
            },
      text: _model.wasClicked ? widget.endingTest! : widget.startingText!,
      icon: widget.icon,
      options: FFButtonOptions(
        width: 150.0,
        height: 45.0,
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Roboto',
              color: FlutterFlowTheme.of(context).secondary,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
        disabledColor: FlutterFlowTheme.of(context).accent4,
        disabledTextColor: FlutterFlowTheme.of(context).secondaryText,
      ),
    );
  }
}
