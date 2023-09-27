import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/data_list/data_list_widget.dart';
import '/components/user_picker/user_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_veiew_model.dart';
export 'team_veiew_model.dart';

class TeamVeiewWidget extends StatefulWidget {
  const TeamVeiewWidget({
    Key? key,
    this.teamReference,
  }) : super(key: key);

  final DocumentReference? teamReference;

  @override
  _TeamVeiewWidgetState createState() => _TeamVeiewWidgetState();
}

class _TeamVeiewWidgetState extends State<TeamVeiewWidget> {
  late TeamVeiewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamVeiewModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<TeamRecord>(
      stream: TeamRecord.getDocument(widget.teamReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final teamVeiewTeamRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: Text(
                'Page Title',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Roboto Condensed',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [
                Visibility(
                  visible:
                      (teamVeiewTeamRecord.owner == currentUserReference) &&
                          (functions
                                  .countTeamMembers(teamVeiewTeamRecord.members
                                      .map((e) => e.id)
                                      .toList())
                                  .toString() ==
                              '0'),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.delete_forever,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await teamVeiewTeamRecord.owner!.update({
                        ...createUserRecordData(
                          alreadyCreatTeam: false,
                        ),
                        'ownerOfTeamPATH': FieldValue.delete(),
                      });
                      await FirebaseStorage.instance
                          .refFromURL(teamVeiewTeamRecord.logotype)
                          .delete();
                      await widget.teamReference!.delete();
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.userPickerModel,
                    updateCallback: () => setState(() {}),
                    child: UserPickerWidget(
                      teamReference: widget.teamReference!,
                      userReference: currentUserReference!,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.dataListModel,
                    updateCallback: () => setState(() {}),
                    child: DataListWidget(
                      teamReference: widget.teamReference,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
