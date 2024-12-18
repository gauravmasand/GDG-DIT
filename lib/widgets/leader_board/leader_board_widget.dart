import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'leader_board_model.dart';
export 'leader_board_model.dart';

class LeaderBoardWidget extends StatefulWidget {
  const LeaderBoardWidget({super.key});

  @override
  State<LeaderBoardWidget> createState() => _LeaderBoardWidgetState();
}

class _LeaderBoardWidgetState extends State<LeaderBoardWidget> {
  late LeaderBoardModel _model;

  final List<Color> colors = [
    Color(0xFF4285F4), // Blue
    Color(0xFF34A853), // Green
    Color(0xFFFBBC05), // Yellow
    Color(0xFFEA4335), // Red
  ];

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaderBoardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 970.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 0.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: Text(
                'DevChef',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Inter Tight',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 12.0, 0.0),
              child: Text(
                'Leaderboard | GDSC x DevKraft',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.fromLTRB(
                0,
                16.0,
                0,
                16.0,
              ),
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 6,
              itemBuilder: (context, index) {
                // Get the color based on the index
                Color itemColor = colors[index % colors.length];

                return index!=5 ? Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 570.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 32.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: itemColor,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                  width: 60.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Bhavesh Rathod',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '1x Month Winner',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.0,
                                color: itemColor,
                                offset: Offset(
                                  -2.0,
                                  0.0,
                                ),
                              )
                            ],
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                26.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: RichText(
                                    textScaler:
                                    MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Rank ${index+1}',
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  indent: 0.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ].addToEnd(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ) : InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('DevChefLeaderBoardPage');
                  },
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 570.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.0,
                          color: FlutterFlowTheme.of(context).alternate,
                          offset: Offset(
                            0.0,
                            1.0,
                          ),
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 32.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.asset(
                                  'assets/images/Google__G__logo.svg.png',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Others, Show all',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              // children: [
              //   Container(
              //     width: double.infinity,
              //     constraints: BoxConstraints(
              //       maxWidth: 570.0,
              //     ),
              //     decoration: BoxDecoration(
              //       color: FlutterFlowTheme.of(context).secondaryBackground,
              //     ),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.max,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           mainAxisSize: MainAxisSize.max,
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Container(
              //               width: 32.0,
              //               height: 32.0,
              //               decoration: BoxDecoration(
              //                 color: FlutterFlowTheme.of(context)
              //                     .secondaryBackground,
              //                 shape: BoxShape.circle,
              //                 border: Border.all(
              //                   color: Color(0xFF4285F4),
              //                   width: 2.0,
              //                 ),
              //               ),
              //               child: Padding(
              //                 padding: EdgeInsets.all(2.0),
              //                 child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(40.0),
              //                   child: Image.network(
              //                     'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
              //                     width: 60.0,
              //                     height: 60.0,
              //                     fit: BoxFit.cover,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             Expanded(
              //               child: Padding(
              //                 padding: EdgeInsetsDirectional.fromSTEB(
              //                     12.0, 0.0, 0.0, 0.0),
              //                 child: Text(
              //                   'Bhavesh Rathod',
              //                   style: FlutterFlowTheme.of(context)
              //                       .bodyMedium
              //                       .override(
              //                     fontFamily: 'Inter',
              //                     letterSpacing: 0.0,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             Text(
              //               '1x Month Winner',
              //               style: FlutterFlowTheme.of(context)
              //                   .labelSmall
              //                   .override(
              //                 fontFamily: 'Inter',
              //                 letterSpacing: 0.0,
              //               ),
              //             ),
              //           ],
              //         ),
              //         Padding(
              //           padding:
              //           EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
              //           child: Container(
              //             width: double.infinity,
              //             decoration: BoxDecoration(
              //               color: FlutterFlowTheme.of(context)
              //                   .secondaryBackground,
              //               boxShadow: [
              //                 BoxShadow(
              //                   blurRadius: 0.0,
              //                   color: Color(0xFF4285F4),
              //                   offset: Offset(
              //                     -2.0,
              //                     0.0,
              //                   ),
              //                 )
              //               ],
              //               border: Border.all(
              //                 color: FlutterFlowTheme.of(context)
              //                     .secondaryBackground,
              //                 width: 1.0,
              //               ),
              //             ),
              //             child: Padding(
              //               padding: EdgeInsetsDirectional.fromSTEB(
              //                   26.0, 0.0, 0.0, 0.0),
              //               child: Column(
              //                 mainAxisSize: MainAxisSize.max,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Padding(
              //                     padding: EdgeInsetsDirectional.fromSTEB(
              //                         0.0, 0.0, 0.0, 12.0),
              //                     child: RichText(
              //                       textScaler:
              //                       MediaQuery.of(context).textScaler,
              //                       text: TextSpan(
              //                         children: [
              //                           TextSpan(
              //                             text: 'Rank 1',
              //                             style: TextStyle(),
              //                           )
              //                         ],
              //                         style: FlutterFlowTheme.of(context)
              //                             .labelMedium
              //                             .override(
              //                           fontFamily: 'Inter',
              //                           letterSpacing: 0.0,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   Divider(
              //                     height: 1.0,
              //                     thickness: 1.0,
              //                     indent: 0.0,
              //                     color: FlutterFlowTheme.of(context).alternate,
              //                   ),
              //                 ].addToEnd(SizedBox(height: 12.0)),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              //   InkWell(
              //     splashColor: Colors.transparent,
              //     focusColor: Colors.transparent,
              //     hoverColor: Colors.transparent,
              //     highlightColor: Colors.transparent,
              //     onTap: () async {
              //       context.pushNamed('DevChefLeaderBoardPage');
              //     },
              //     child: Container(
              //       width: double.infinity,
              //       constraints: BoxConstraints(
              //         maxWidth: 570.0,
              //       ),
              //       decoration: BoxDecoration(
              //         color: FlutterFlowTheme.of(context).secondaryBackground,
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 0.0,
              //             color: FlutterFlowTheme.of(context).alternate,
              //             offset: Offset(
              //               0.0,
              //               1.0,
              //             ),
              //           )
              //         ],
              //       ),
              //       child: Padding(
              //         padding:
              //         EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 8.0),
              //         child: Row(
              //           mainAxisSize: MainAxisSize.max,
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Container(
              //               width: 32.0,
              //               height: 32.0,
              //               decoration: BoxDecoration(
              //                 color: FlutterFlowTheme.of(context)
              //                     .secondaryBackground,
              //                 shape: BoxShape.circle,
              //                 border: Border.all(
              //                   color: FlutterFlowTheme.of(context).primary,
              //                   width: 2.0,
              //                 ),
              //               ),
              //               child: Padding(
              //                 padding: EdgeInsets.all(2.0),
              //                 child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(40.0),
              //                   child: Image.asset(
              //                     'assets/images/Google__G__logo.svg.png',
              //                     width: 32.0,
              //                     height: 32.0,
              //                     fit: BoxFit.cover,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             Expanded(
              //               child: Padding(
              //                 padding: EdgeInsetsDirectional.fromSTEB(
              //                     12.0, 0.0, 0.0, 0.0),
              //                 child: Row(
              //                   mainAxisSize: MainAxisSize.max,
              //                   mainAxisAlignment:
              //                   MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       'Others, Show all',
              //                       style: FlutterFlowTheme.of(context)
              //                           .bodyMedium
              //                           .override(
              //                         fontFamily: 'Inter',
              //                         letterSpacing: 0.0,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ].divide(SizedBox(height: 0.0)),
            ),

            SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}
