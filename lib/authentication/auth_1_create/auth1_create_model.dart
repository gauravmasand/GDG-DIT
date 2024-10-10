import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'auth1_create_widget.dart' show Auth1CreateWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Auth1CreateModel extends FlutterFlowModel<Auth1CreateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for displayNameSignup widget.
  FocusNode? displayNameSignupFocusNode;
  TextEditingController? displayNameSignupTextController;
  String? Function(BuildContext, String?)?
      displayNameSignupTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    displayNameSignupFocusNode?.dispose();
    displayNameSignupTextController?.dispose();
  }
}
