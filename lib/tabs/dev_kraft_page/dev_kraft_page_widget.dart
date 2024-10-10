import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/leader_board/leader_board_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dev_kraft_page_model.dart';
export 'dev_kraft_page_model.dart';

class DevKraftPageWidget extends StatefulWidget {
  const DevKraftPageWidget({super.key});

  @override
  State<DevKraftPageWidget> createState() => _DevKraftPageWidgetState();
}

class _DevKraftPageWidgetState extends State<DevKraftPageWidget> {
  late DevKraftPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevKraftPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryText,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/DevChef_Posters_(4).png',
                    width: 140.0,
                    height: 60.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                  child: Container(
                    height: 230.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primaryText,
                          FlutterFlowTheme.of(context).primaryText,
                          FlutterFlowTheme.of(context).secondaryBackground,
                          FlutterFlowTheme.of(context).secondaryBackground
                        ],
                        stops: [0.0, 0.75, 0.9, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/DevChef_Posters_(7).png',
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment(0.0, -0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.leaderBoardModel,
                    updateCallback: () => safeSetState(() {}),
                    child: LeaderBoardWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
