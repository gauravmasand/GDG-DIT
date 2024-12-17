import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdg_dit/authentication/auth_3_create/auth3_create_model.dart';
import 'package:gdg_dit/flutter_flow/flutter_flow_drop_down.dart';
import 'package:gdg_dit/flutter_flow/form_field_controller.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> profileUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final profileUsersRecord = profileUsersRecordList.isNotEmpty
            ? profileUsersRecordList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: SafeArea(
                top: true,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Row(
                          children: [
                            Text(
                              'Profile',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.black),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (ctx) {
                                    return EditProfile();
                                  }));
                                },
                                icon: Icon(Icons.edit))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF4285F4),
                                      Color(0xFF34A853),
                                      Color(0xFFFBBC05),
                                      Color(0xFFEA4335)
                                    ],
                                    stops: [0.0, 0.33, 0.66, 1.0],
                                    begin: AlignmentDirectional(1.0, 0.0),
                                    end: AlignmentDirectional(-1.0, 0),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Do not do any action till it is updating',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              allowPhoto: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              safeSetState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              var downloadUrls = <String>[];
                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }

                                            await profileUsersRecord!.reference
                                                .update(createUsersRecordData(
                                              photoUrl: _model.uploadedFileUrl,
                                            ));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Done Updated Successfully',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            child: Image.network(
                                              profileUsersRecord!.photoUrl,
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      profileUsersRecord?.displayName,
                                      'Name',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        profileUsersRecord?.email,
                                        'mail@mail.com',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 400.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    -1.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'About you',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              profileUsersRecord
                                                  ?.techStackExpertise,
                                              'TechStack',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Divider(
                                          height: 32.0,
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Text(
                                          'Social plartforms',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await launchURL(
                                              profileUsersRecord!.linkedin);
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/174857.png',
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await launchURL(
                                              profileUsersRecord!.github);
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/25231.png',
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await launchURL(
                                              profileUsersRecord!.portfolio);
                                        },
                                        child: Text(
                                          '🔗',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 25.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 10.0))
                                        .addToStart(SizedBox(width: 16.0))
                                        .addToEnd(SizedBox(width: 16.0)),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.goNamedAuth(
                                            'auth_WelcomeScreen',
                                            context.mounted);
                                      },
                                      text: 'Logout',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late ProfileModel _model;
  TextEditingController _name = TextEditingController();
  TextEditingController _passoutyear = TextEditingController();
  TextEditingController _bio = TextEditingController();
  TextEditingController _tech = TextEditingController();
  TextEditingController _insta = TextEditingController();
  TextEditingController _linkedin = TextEditingController();
  TextEditingController _github = TextEditingController();
  late Auth3CreateModel _model2;

  @override
  void initState() {
    _model2 = createModel(context, () => Auth3CreateModel());
    super.initState();
  }

  void _saveChanges(String uid) async {
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'display_name': _name.text,
      'passOutYear': _passoutyear.text,
      'techStackExpertise': _tech.text,
      'github': _github.text,
      'linkedin': _linkedin.text,
      'department': _model2.departmentSignupValue
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        actions: [
          TextButton(
            onPressed: () {
              _saveChanges(FirebaseAuth.instance.currentUser!.uid);
            },
            child: Text(
              "Save",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: queryUsersRecord(
              queryBuilder: (usersRecord) => usersRecord.where(
                'uid',
                isEqualTo: currentUserUid,
              ),
              singleRecord: true,
            ),
            builder: (ctx, snapshot) {
              List<UsersRecord> profileUsersRecordList = snapshot.data!;
              final profileUsersRecord = profileUsersRecordList.isNotEmpty
                  ? profileUsersRecordList.first
                  : null;
              _name.text = profileUsersRecord!.displayName;
              _bio.text = profileUsersRecord.shortDescription;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(profileUsersRecord.photoUrl ?? ''),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () async {
                                // Image picker logic
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.grey[200],
                                child: Icon(Icons.camera_alt, size: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    buildTextField("Name", _name),
                    // buildTextField("Bio", _bio, maxLines: 4),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Department'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FlutterFlowDropDown<String>(
                            controller:
                                _model2.departmentSignupValueController ??=
                                    FormFieldController<String>(null),
                            options: [
                              'Electronics & Telecommunication',
                              'Computer Engineering',
                              'Information Technology',
                              'Instrumentation Engineering',
                              'Mechanical Engineering',
                              'Civil Engineering',
                              'Electrical Engineering',
                              'Automation and Robotics',
                              'Artificial Intelligence & Data Science'
                            ],
                            onChanged: (val) => safeSetState(
                                () => _model2.departmentSignupValue = val),
                            width: double.infinity,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  lineHeight: 1.5,
                                ),
                            hintText: 'Select Department',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ],
                      ),
                    ),
                    buildTextField("Tech Expertise", _tech),
                    buildTextField("Passout Year", _passoutyear),
                    SizedBox(height: 20),
                    Text(
                      'Social Handles',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(height: 20),
                    buildSocialTextField(
                        _linkedin, "Linkedin", "assets/images/174857.png"),
                    buildSocialTextField(
                        _github, "GitHub", "assets/images/25231.png"),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSocialTextField(TextEditingController controller, String platform,
      String assetImagePath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: ImageIcon(AssetImage(assetImagePath)),
          hintText: platform,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
