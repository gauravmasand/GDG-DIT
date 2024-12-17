import 'package:gdg_dit/commons/pallete.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'leader_board_model.dart';
export 'leader_board_model.dart';
import 'package:firebase_database/firebase_database.dart';

final db = FirebaseDatabase.instance;

class LeaderBoardWidget extends StatefulWidget {
  const LeaderBoardWidget({super.key});

  @override
  State<LeaderBoardWidget> createState() => _LeaderBoardWidgetState();
}

class _LeaderBoardWidgetState extends State<LeaderBoardWidget> {
  late LeaderBoardModel _model;
  var showAll = false;
  late List<Map<dynamic, dynamic>> leaderboard = [];
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaderBoardModel());
    getEventData();
    // print(leaderboard[1]['name']);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  void getEventData() {
    db.ref('leaderboard').once().then((DatabaseEvent event) {
      final rawData = event.snapshot.value;

      if (rawData != null && rawData is Map) {
        Map<String, dynamic> eventsData = Map<String, dynamic>.from(rawData);

        List<Map<String, dynamic>> tempLeaderboard = [];

        eventsData.forEach((eventName, eventDetails) {
          if (eventDetails is Map && eventDetails.containsKey('scores')) {
            List<dynamic> scores = eventDetails['scores'] ?? [];

            scores.forEach((scoreEntry) {
              if (scoreEntry is Map) {
                tempLeaderboard.add({
                  'event': eventName,
                  'name': scoreEntry['name'] ?? 'Unknown',
                  'username': scoreEntry['username'] ?? 'Unknown',
                  'sept': scoreEntry['sept'] ?? 0.0,
                  'oct': scoreEntry['oct'] ?? 0.0,
                  'nov': scoreEntry['nov'] ?? 0.0,
                  'total': scoreEntry['total'] ?? 0.0,
                });
              }
            });
          }
        });

        tempLeaderboard.sort((a, b) => b['total'].compareTo(a['total']));

        setState(() {
          leaderboard = tempLeaderboard;
        });

        print("Leaderboard updated with ${leaderboard.length} entries.");
      } else {
        print("No leaderboard data found.");
      }
    }).catchError((error) {
      print("Error fetching leaderboard data: $error");
    });
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
            leaderboard.isEmpty
                ? Container(
                    height: MediaQuery.sizeOf(context).height / 3,
                    child: Center(
                      child: Text('No data!Come back later...'),
                    ),
                  )
                : Container(
                    height: MediaQuery.sizeOf(context).height / 3,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        padding: EdgeInsets.all(10),
                        itemBuilder: (ctx, index) {
                          return Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 570.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 32.0,
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: leaderboardColors[index],
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
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
                                          leaderboard[index]['name'],
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
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0.0,
                                          color: leaderboardColors[index],
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Rank ${index + 1}',
                                                    style: TextStyle(),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ].addToEnd(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
            TextButton(
                onPressed: () {
                  if (showAll == true) {
                    setState(() {
                      showAll = false;
                    });
                  } else {
                    setState(() {
                      showAll = true;
                    });
                  }
                },
                child: Text('Show all'))
          ],
        ),
      ),
    );
  }
}
