import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_member_info_model.dart';
export 'team_member_info_model.dart';

class TeamMemberInfoWidget extends StatefulWidget {
  const TeamMemberInfoWidget({super.key});

  @override
  State<TeamMemberInfoWidget> createState() => _TeamMemberInfoWidgetState();
}

class _TeamMemberInfoWidgetState extends State<TeamMemberInfoWidget> {
  late TeamMemberInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamMemberInfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
