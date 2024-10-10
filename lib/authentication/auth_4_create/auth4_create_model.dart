import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'auth4_create_widget.dart' show Auth4CreateWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Auth4CreateModel extends FlutterFlowModel<Auth4CreateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for githubSignup widget.
  FocusNode? githubSignupFocusNode;
  TextEditingController? githubSignupTextController;
  String? Function(BuildContext, String?)? githubSignupTextControllerValidator;
  // State field(s) for linkedinSignup widget.
  FocusNode? linkedinSignupFocusNode;
  TextEditingController? linkedinSignupTextController;
  String? Function(BuildContext, String?)?
      linkedinSignupTextControllerValidator;
  // State field(s) for portfolioSignup widget.
  FocusNode? portfolioSignupFocusNode;
  TextEditingController? portfolioSignupTextController;
  String? Function(BuildContext, String?)?
      portfolioSignupTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    githubSignupFocusNode?.dispose();
    githubSignupTextController?.dispose();

    linkedinSignupFocusNode?.dispose();
    linkedinSignupTextController?.dispose();

    portfolioSignupFocusNode?.dispose();
    portfolioSignupTextController?.dispose();
  }
}
