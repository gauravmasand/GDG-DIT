import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'auth_forgot_password_widget.dart' show AuthForgotPasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthForgotPasswordModel
    extends FlutterFlowModel<AuthForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddressForgotPassword widget.
  FocusNode? emailAddressForgotPasswordFocusNode;
  TextEditingController? emailAddressForgotPasswordTextController;
  String? Function(BuildContext, String?)?
      emailAddressForgotPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressForgotPasswordFocusNode?.dispose();
    emailAddressForgotPasswordTextController?.dispose();
  }
}
