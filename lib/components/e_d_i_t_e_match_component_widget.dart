import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_d_i_t_e_match_component_model.dart';
export 'e_d_i_t_e_match_component_model.dart';

class EDITEMatchComponentWidget extends StatefulWidget {
  const EDITEMatchComponentWidget({
    Key? key,
    required this.matchReference,
  }) : super(key: key);

  final DocumentReference? matchReference;

  @override
  _EDITEMatchComponentWidgetState createState() =>
      _EDITEMatchComponentWidgetState();
}

class _EDITEMatchComponentWidgetState extends State<EDITEMatchComponentWidget> {
  late EDITEMatchComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EDITEMatchComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<MatchRecord>(
      stream: MatchRecord.getDocument(widget.matchReference!),
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
        final baseMatchRecord = snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.tournamentsList = await queryTournamentRecordOnce();
                    setState(() {
                      _model.tournamentListVISIBILITY = true;
                    });

                    setState(() {});
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'ТУРНИР',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      baseMatchRecord.gameForTournamentName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (_model.tournamentListVISIBILITY)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Builder(
                        builder: (context) {
                          final tournamentList =
                              _model.tournamentsList?.toList() ?? [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: tournamentList.length,
                            itemBuilder: (context, tournamentListIndex) {
                              final tournamentListItem =
                                  tournamentList[tournamentListIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.tournamentListVISIBILITY = false;
                                  });

                                  await widget.matchReference!
                                      .update(createMatchRecordData(
                                    gameForTournamentRef:
                                        tournamentListItem.reference,
                                    gameForTournamentName:
                                        tournamentListItem.name,
                                  ));
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 0.0, 10.0),
                                      child: Text(
                                        tournamentListItem.name,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'РАУНД',
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue1 ??=
                                      baseMatchRecord.gameForTournamentRound,
                                ),
                                options: ['1', '2', '3', '4'],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue1 = val),
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).labelSmall,
                                hintText:
                                    baseMatchRecord.gameForTournamentRound,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    40.0, 0.0, 0.0, 0.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ПАРА',
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController2 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue2 ??=
                                      baseMatchRecord.pair,
                                ),
                                options: [
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7',
                                  '8'
                                ],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue2 = val),
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).labelSmall,
                                hintText: baseMatchRecord.pair,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    50.0, 0.0, 0.0, 0.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.teamsListVISIBILITY = true;
                                _model.selectedSlotVALUE = '1';
                              });
                              _model.tournamentMembersOnlyList =
                                  await queryTeamRecordOnce(
                                queryBuilder: (teamRecord) => teamRecord.where(
                                    'memberOfTournament',
                                    arrayContains:
                                        baseMatchRecord.gameForTournamentRef),
                              );

                              setState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'СОПЕРНИК 1',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              baseMatchRecord.rival1.logotype,
                                              width: 30.0,
                                              height: 30.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '[${baseMatchRecord.rival1.tag}] ${baseMatchRecord.rival1.name}'
                                              .maybeHandleOverflow(
                                            maxChars: 30,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'ПОБЕДЫ',
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                            FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController3 ??=
                                  FormFieldController<String>(
                                _model.dropDownValue3 ??=
                                    baseMatchRecord.rival1Wins,
                              ),
                              options: ['1', '2', '3', '4', '5'],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue3 = val),
                              width: 40.0,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).labelSmall,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 0.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'СОПЕРНИК 2',
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            baseMatchRecord.rival2.logotype,
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          '[${baseMatchRecord.rival2.tag}] ${baseMatchRecord.rival2.name}'
                                              .maybeHandleOverflow(
                                            maxChars: 30,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'ПОБЫДЫ',
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController4 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue4 ??=
                                      baseMatchRecord.rival2Wins,
                                ),
                                options: ['1', '2', '3', '4', '5'],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue4 = val),
                                width: 40.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).labelSmall,
                                hintText: baseMatchRecord.rival2Wins,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 0.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (_model.teamsListVISIBILITY)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Builder(
                        builder: (context) {
                          final teamList =
                              _model.tournamentMembersOnlyList?.toList() ?? [];
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: teamList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, teamListIndex) {
                              final teamListItem = teamList[teamListIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.selectedSlotVALUE == '1') {
                                    setState(() {
                                      _model.teamsListVISIBILITY = false;
                                    });

                                    await widget.matchReference!
                                        .update(createMatchRecordData(
                                      rival1: createTournamentMemberStruct(
                                        logotype: teamListItem.logotype,
                                        name: teamListItem.name,
                                        tag: teamListItem.tag,
                                        teamReference: teamListItem.reference,
                                        clearUnsetFields: false,
                                      ),
                                    ));
                                  } else {
                                    setState(() {
                                      _model.teamsListVISIBILITY = false;
                                    });

                                    await widget.matchReference!
                                        .update(createMatchRecordData(
                                      rival2: createTournamentMemberStruct(
                                        logotype: teamListItem.logotype,
                                        name: teamListItem.name,
                                        tag: teamListItem.tag,
                                        teamReference: teamListItem.reference,
                                        clearUnsetFields: false,
                                      ),
                                    ));
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        child: Image.network(
                                          teamListItem.logotype,
                                          width: 35.0,
                                          height: 35.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '[${teamListItem.tag}] ${teamListItem.name}',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}