import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_match_model.dart';
export 'add_match_model.dart';

class AddMatchWidget extends StatefulWidget {
  const AddMatchWidget({
    Key? key,
    this.tournamentReference,
  }) : super(key: key);

  final DocumentReference? tournamentReference;

  @override
  _AddMatchWidgetState createState() => _AddMatchWidgetState();
}

class _AddMatchWidgetState extends State<AddMatchWidget> {
  late AddMatchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMatchModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      setState(() {
                        _model.rival1ListOfTeamsVISIBILITY = true;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Соперник 1',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  _model.selectedRival1TeamLogotypeVALUE,
                                  '1',
                                ),
                                width: 45.0,
                                height: 45.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                _model.selectedRival1TeamNameVALUE,
                                'Не выбран',
                              ),
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (_model.rival1ListOfTeamsVISIBILITY)
                  StreamBuilder<TournamentRecord>(
                    stream: TournamentRecord.getDocument(
                        widget.tournamentReference!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final rival1ListOfTeamsTournamentRecord = snapshot.data!;
                      return Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final tournamentMembers =
                                rival1ListOfTeamsTournamentRecord.members
                                    .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: tournamentMembers.length,
                              itemBuilder: (context, tournamentMembersIndex) {
                                final tournamentMembersItem =
                                    tournamentMembers[tournamentMembersIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.selectedRival1TeamNameVALUE =
                                          tournamentMembersItem.name;
                                      _model.selectedRival1TeamLogotypeVALUE =
                                          tournamentMembersItem.logotype;
                                      _model.selectedRival1TeamReferenceVALUE =
                                          tournamentMembersItem.teamReference;
                                      _model.rival1ListOfTeamsVISIBILITY =
                                          false;
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          tournamentMembersItem.logotype,
                                          width: 45.0,
                                          height: 45.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        tournamentMembersItem.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      setState(() {
                        _model.rival1ListOfTeamsVISIBILITY = true;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Соперник 2',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                _model.selectedRival2TeamLogotypeVALUE!,
                                width: 45.0,
                                height: 45.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                _model.selectedRival2TeamNameVALUE,
                                'Не выбрано',
                              ),
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (_model.rival1ListOfTeamsVISIBILITY)
                  StreamBuilder<TournamentRecord>(
                    stream: TournamentRecord.getDocument(
                        widget.tournamentReference!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final rival2ListOfTeamsTournamentRecord = snapshot.data!;
                      return Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final tournamentMembers =
                                rival2ListOfTeamsTournamentRecord.members
                                    .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: tournamentMembers.length,
                              itemBuilder: (context, tournamentMembersIndex) {
                                final tournamentMembersItem =
                                    tournamentMembers[tournamentMembersIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.rival1ListOfTeamsVISIBILITY =
                                          false;
                                      _model.selectedRival2TeamNameVALUE =
                                          tournamentMembersItem.name;
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          tournamentMembersItem.logotype,
                                          width: 45.0,
                                          height: 45.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        tournamentMembersItem.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
