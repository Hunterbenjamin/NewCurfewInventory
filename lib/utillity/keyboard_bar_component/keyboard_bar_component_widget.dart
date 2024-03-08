import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'keyboard_bar_component_model.dart';
export 'keyboard_bar_component_model.dart';

class KeyboardBarComponentWidget extends StatefulWidget {
  const KeyboardBarComponentWidget({
    super.key,
    required this.pressDone,
  });

  final Future Function()? pressDone;

  @override
  State<KeyboardBarComponentWidget> createState() =>
      _KeyboardBarComponentWidgetState();
}

class _KeyboardBarComponentWidgetState
    extends State<KeyboardBarComponentWidget> {
  late KeyboardBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KeyboardBarComponentModel());
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
      height: 35.0,
      decoration: BoxDecoration(
        color: Color(0xFFD2D4DA),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.pressDone?.call();
                  },
                  child: Text(
                    'Done',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).accent3,
                          fontSize: 16.0,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
