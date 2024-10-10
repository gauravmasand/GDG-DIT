import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/leader_board/leader_board_widget.dart';
import 'dev_kraft_page_widget.dart' show DevKraftPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DevKraftPageModel extends FlutterFlowModel<DevKraftPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LeaderBoard component.
  late LeaderBoardModel leaderBoardModel;

  @override
  void initState(BuildContext context) {
    leaderBoardModel = createModel(context, () => LeaderBoardModel());
  }

  @override
  void dispose() {
    leaderBoardModel.dispose();
  }
}
