import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'auth2_create_widget.dart' show Auth2CreateWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Auth2CreateModel extends FlutterFlowModel<Auth2CreateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddressSignup widget.
  FocusNode? emailAddressSignupFocusNode;
  TextEditingController? emailAddressSignupTextController;
  String? Function(BuildContext, String?)?
      emailAddressSignupTextControllerValidator;
  // State field(s) for passwordSignup widget.
  FocusNode? passwordSignupFocusNode;
  TextEditingController? passwordSignupTextController;
  late bool passwordSignupVisibility;
  String? Function(BuildContext, String?)?
      passwordSignupTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordSignupVisibility = false;
  }

  @override
  void dispose() {
    emailAddressSignupFocusNode?.dispose();
    emailAddressSignupTextController?.dispose();

    passwordSignupFocusNode?.dispose();
    passwordSignupTextController?.dispose();
  }
}
