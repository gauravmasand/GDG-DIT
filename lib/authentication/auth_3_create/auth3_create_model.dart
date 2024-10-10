import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'auth3_create_widget.dart' show Auth3CreateWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Auth3CreateModel extends FlutterFlowModel<Auth3CreateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for passOutYearSignup widget.
  FocusNode? passOutYearSignupFocusNode;
  TextEditingController? passOutYearSignupTextController;
  String? Function(BuildContext, String?)?
      passOutYearSignupTextControllerValidator;
  // State field(s) for departmentSignup widget.
  String? departmentSignupValue;
  FormFieldController<String>? departmentSignupValueController;
  // State field(s) for batchSignup widget.
  FocusNode? batchSignupFocusNode;
  TextEditingController? batchSignupTextController;
  String? Function(BuildContext, String?)? batchSignupTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    passOutYearSignupFocusNode?.dispose();
    passOutYearSignupTextController?.dispose();

    batchSignupFocusNode?.dispose();
    batchSignupTextController?.dispose();
  }
}
