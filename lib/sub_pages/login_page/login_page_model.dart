import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  // State field(s) for emailAddressSignUp widget.
  FocusNode? emailAddressSignUpFocusNode;
  TextEditingController? emailAddressSignUpController;
  String? Function(BuildContext, String?)?
      emailAddressSignUpControllerValidator;
  // State field(s) for passwordSignUp widget.
  FocusNode? passwordSignUpFocusNode;
  TextEditingController? passwordSignUpController;
  late bool passwordSignUpVisibility;
  String? Function(BuildContext, String?)? passwordSignUpControllerValidator;
  // State field(s) for passwordSignUpConfirm widget.
  FocusNode? passwordSignUpConfirmFocusNode;
  TextEditingController? passwordSignUpConfirmController;
  late bool passwordSignUpConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordSignUpConfirmControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordSignUpVisibility = false;
    passwordSignUpConfirmVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    userNameFocusNode?.dispose();
    userNameController?.dispose();

    emailAddressSignUpFocusNode?.dispose();
    emailAddressSignUpController?.dispose();

    passwordSignUpFocusNode?.dispose();
    passwordSignUpController?.dispose();

    passwordSignUpConfirmFocusNode?.dispose();
    passwordSignUpConfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
