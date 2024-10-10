import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'auth5_create_widget.dart' show Auth5CreateWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Auth5CreateModel extends FlutterFlowModel<Auth5CreateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for techStackExpertise widget.
  FocusNode? techStackExpertiseFocusNode;
  TextEditingController? techStackExpertiseTextController;
  String? Function(BuildContext, String?)?
      techStackExpertiseTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    techStackExpertiseFocusNode?.dispose();
    techStackExpertiseTextController?.dispose();
  }
}
