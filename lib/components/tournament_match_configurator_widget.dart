import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tournament_match_configurator_model.dart';
export 'tournament_match_configurator_model.dart';

class TournamentMatchConfiguratorWidget extends StatefulWidget {
  const TournamentMatchConfiguratorWidget({
    Key? key,
    required this.tournamentReference,
  }) : super(key: key);

  final DocumentReference? tournamentReference;

  @override
  _TournamentMatchConfiguratorWidgetState createState() =>
      _TournamentMatchConfiguratorWidgetState();
}

class _TournamentMatchConfiguratorWidgetState
    extends State<TournamentMatchConfiguratorWidget> {
  late TournamentMatchConfiguratorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TournamentMatchConfiguratorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<TournamentRecord>(
      stream: TournamentRecord.getDocument(widget.tournamentReference!),
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
        final baseCOLUMNTournamentRecord = snapshot.data!;
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (valueOrDefault<bool>(
                      _model.roundAndPairVISIBILITY,
                      false,
                    ))
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Пара',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(null),
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
                                    setState(() => _model.dropDownValue1 = val),
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: '-',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Раунд',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController2 ??=
                                    FormFieldController<String>(null),
                                options: ['1', '2', '3', '4'],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue2 = val),
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: '-',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 70.0)),
                      ),
                    if (valueOrDefault<bool>(
                      _model.rival1BUTTONVISIBILITY,
                      false,
                    ))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            _model.selectedSlotVALUE = '1';
                            _model.riva21BUTTONVISIBILITY = false;
                            _model.teamsLISTVISIBILITY = true;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (_model.selectedTeam1LogotypeVALUE != 'false')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  _model.selectedTeam1LogotypeVALUE,
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (_model.selectedTeam1NameVALUE == null ||
                                _model.selectedTeam1NameVALUE == '')
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 15.0),
                                  child: Text(
                                    'Выбрать соперника 1',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            if (_model.selectedTeam1NameVALUE != null &&
                                _model.selectedTeam1NameVALUE != '')
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    '[${_model.selectedTeam1TagVALUE}] ${_model.selectedTeam1NameVALUE}',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            if (_model.selectedTeam1NameVALUE != null &&
                                _model.selectedTeam1NameVALUE != '')
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: Color(0xFFFF0000),
                                  size: 15.0,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _model.selectedSlotVALUE = '';
                                    _model.selectedTeam1PathVALUE = null;
                                    _model.selectedTeam1NameVALUE = '';
                                    _model.selectedTeam1TagVALUE = '';
                                    _model.selectedTeam1LogotypeVALUE = 'false';
                                  });
                                },
                              ),
                          ],
                        ),
                      ),
                    if (valueOrDefault<bool>(
                      _model.riva21BUTTONVISIBILITY,
                      false,
                    ))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            _model.selectedSlotVALUE = '2';
                            _model.teamsLISTVISIBILITY = true;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.selectedTeam2LogotypeVALUE != 'false')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  _model.selectedTeam2LogotypeVALUE,
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (_model.selectedTeam2NameVALUE == null ||
                                _model.selectedTeam2NameVALUE == '')
                              Expanded(
                                child: Text(
                                  'Выбрать соперника 2',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            if (_model.selectedTeam2NameVALUE != null &&
                                _model.selectedTeam2NameVALUE != '')
                              Expanded(
                                child: Text(
                                  '[${_model.selectedTeam2TagVALUE}] ${_model.selectedTeam2NameVALUE}',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            if (_model.selectedTeam2NameVALUE != null &&
                                _model.selectedTeam2NameVALUE != '')
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: Color(0xFFFF0000),
                                  size: 15.0,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _model.selectedSlotVALUE = '';
                                    _model.selectedTeam2PathVALUE = null;
                                    _model.selectedTeam2NameVALUE = '';
                                    _model.selectedTeam2TagVALUE = '';
                                    _model.selectedTeam2LogotypeVALUE = 'false';
                                  });
                                },
                              ),
                          ],
                        ),
                      ),
                    if (_model.teamsLISTVISIBILITY)
                      Builder(
                        builder: (context) {
                          final membersList = baseCOLUMNTournamentRecord.members
                              .where((e) =>
                                  (e.name != _model.selectedTeam1NameVALUE) &&
                                  (e.name != _model.selectedTeam2NameVALUE))
                              .toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: membersList.length,
                            itemBuilder: (context, membersListIndex) {
                              final membersListItem =
                                  membersList[membersListIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.selectedSlotVALUE == '1') {
                                    setState(() {
                                      _model.selectedTeam1PathVALUE =
                                          membersListItem.teamReference;
                                      _model.selectedTeam1NameVALUE =
                                          membersListItem.name;
                                      _model.selectedTeam1TagVALUE =
                                          membersListItem.tag;
                                      _model.selectedTeam1LogotypeVALUE =
                                          membersListItem.logotype;
                                    });
                                  } else {
                                    setState(() {
                                      _model.selectedTeam2PathVALUE =
                                          membersListItem.teamReference;
                                      _model.selectedTeam2NameVALUE =
                                          membersListItem.name;
                                      _model.selectedTeam2TagVALUE =
                                          membersListItem.tag;
                                      _model.selectedTeam2LogotypeVALUE =
                                          membersListItem.logotype;
                                    });
                                  }

                                  setState(() {
                                    _model.riva21BUTTONVISIBILITY = true;
                                    _model.teamsLISTVISIBILITY = false;
                                  });
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        membersListItem.logotype,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          membersListItem.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await _model.selectedMatchReference!
                      .update(createMatchRecordData(
                    status: 'Определены соперники',
                    rival1: createTournamentMemberStruct(
                      logotype: _model.selectedTeam1LogotypeVALUE,
                      name: _model.selectedTeam1NameVALUE,
                      tag: _model.selectedTeam1TagVALUE,
                      teamReference: _model.selectedTeam1PathVALUE,
                      clearUnsetFields: false,
                    ),
                    rival2: createTournamentMemberStruct(
                      logotype: _model.selectedTeam2LogotypeVALUE,
                      name: _model.selectedTeam2NameVALUE,
                      tag: _model.selectedTeam2TagVALUE,
                      teamReference: _model.selectedTeam2PathVALUE,
                      clearUnsetFields: false,
                    ),
                  ));
                },
                text: 'Изменить матч',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Encode Sans Condensed',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '1',
                        pair: '1',
                      ));
                  _model.matchDataOfPair1Round1 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '1')
                        .where('gameForTournamentRound', isEqualTo: '1'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round1Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair1Round1?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '1',
                        pair: '2',
                      ));
                  _model.matchDataOfPair2Round1 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '2')
                        .where('gameForTournamentRound', isEqualTo: '1'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round1Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair2Round1?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '1',
                        pair: '3',
                      ));
                  _model.matchDataOfPair3Round1 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '3')
                        .where('gameForTournamentRound', isEqualTo: '1'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round1Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair3Round1?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '1',
                        pair: '4',
                      ));
                  _model.matchDataOfPair4Round1 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '4')
                        .where('gameForTournamentRound', isEqualTo: '1'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round1Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair4Round1?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '1',
                        pair: '5',
                      ));
                  _model.matchDataOfPair5Round1 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '5')
                        .where('gameForTournamentRound', isEqualTo: '1'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round1Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair5Round1?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '1',
                        pair: '6',
                      ));
                  _model.matchDataOfPair6Round1 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '6')
                        .where('gameForTournamentRound', isEqualTo: '1'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round1Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair6Round1?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '1',
                        pair: '7',
                      ));
                  _model.matchDataOfPair7Round1 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '7')
                        .where('gameForTournamentRound', isEqualTo: '1'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round1Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair7Round1?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '1',
                        pair: '8',
                      ));
                  _model.matchDataOfPair8Round1 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '8')
                        .where('gameForTournamentRound', isEqualTo: '1'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round1Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair8Round1?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '2',
                        pair: '1',
                      ));
                  _model.matchDataOfPair1Round2 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '1')
                        .where('gameForTournamentRound', isEqualTo: '2'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round2Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair1Round2?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '2',
                        pair: '2',
                      ));
                  _model.matchDataOfPair2Round2 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '2')
                        .where('gameForTournamentRound', isEqualTo: '2'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round2Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair2Round2?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '2',
                        pair: '3',
                      ));
                  _model.matchDataOfPair3Round2 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '3')
                        .where('gameForTournamentRound', isEqualTo: '2'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round2Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair3Round2?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '2',
                        pair: '4',
                      ));
                  _model.matchDataOfPair4Round2 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '4')
                        .where('gameForTournamentRound', isEqualTo: '2'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round2Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair4Round2?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '3',
                        pair: '1',
                      ));
                  _model.matchDataOfPair1Round3 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '1')
                        .where('gameForTournamentRound', isEqualTo: '3'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round3Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair1Round3?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '3',
                        pair: '2',
                      ));
                  _model.matchDataOfPair2Round3 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '2')
                        .where('gameForTournamentRound', isEqualTo: '3'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round3Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair2Round3?.reference]),
                  });

                  await MatchRecord.collection.doc().set(createMatchRecordData(
                        status: 'Добавлен в турнир',
                        gameForTournamentRef:
                            baseCOLUMNTournamentRecord.reference,
                        gameForTournamentName: baseCOLUMNTournamentRecord.name,
                        rival1: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        rival2: createTournamentMemberStruct(
                          logotype:
                              'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                          name: 'Не определен',
                          clearUnsetFields: false,
                          create: true,
                        ),
                        gameForTournamentRound: '4',
                        pair: '1',
                      ));
                  _model.matchDataOfPair1Round4 = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('pair', isEqualTo: '1')
                        .where('gameForTournamentRound', isEqualTo: '4'),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await widget.tournamentReference!.update({
                    'Round4Matches': FieldValue.arrayUnion(
                        [_model.matchDataOfPair1Round4?.reference]),
                  });

                  setState(() {});
                },
                text: 'Создать сетку матчей',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Encode Sans Condensed',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 220.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: StreamBuilder<List<MatchRecord>>(
                            stream: queryMatchRecord(
                              queryBuilder: (matchRecord) => matchRecord
                                  .where('gameForTournamentRef',
                                      isEqualTo:
                                          baseCOLUMNTournamentRecord.reference)
                                  .where('gameForTournamentRound',
                                      isEqualTo: '1')
                                  .orderBy('pair'),
                            ),
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
                              List<MatchRecord> listViewMatchRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewMatchRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewMatchRecord =
                                      listViewMatchRecordList[listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.rival1BUTTONVISIBILITY = true;
                                        _model.riva21BUTTONVISIBILITY = true;
                                        _model.selectedMatchReference =
                                            listViewMatchRecord.reference;
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Пара ${listViewMatchRecord.pair}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    listViewMatchRecord
                                                        .rival1.logotype,
                                                    width: 30.0,
                                                    height: 30.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      listViewMatchRecord
                                                          .rival1.name
                                                          .maybeHandleOverflow(
                                                              maxChars: 10),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    listViewMatchRecord
                                                        .rival2.logotype,
                                                    width: 30.0,
                                                    height: 30.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      listViewMatchRecord
                                                          .rival2.name
                                                          .maybeHandleOverflow(
                                                              maxChars: 10),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Счет',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              listViewMatchRecord.rival1Wins,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge,
                                            ),
                                            Text(
                                              listViewMatchRecord.rival2Wins,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Encode Sans Condensed',
                                                        lineHeight: 1.6,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final round2matchesListRefs =
                                  baseCOLUMNTournamentRecord.round2Matches
                                      .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: round2matchesListRefs.length,
                                itemBuilder:
                                    (context, round2matchesListRefsIndex) {
                                  final round2matchesListRefsItem =
                                      round2matchesListRefs[
                                          round2matchesListRefsIndex];
                                  return StreamBuilder<MatchRecord>(
                                    stream: MatchRecord.getDocument(
                                        round2matchesListRefsItem),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final rowMatchRecord = snapshot.data!;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.rival1BUTTONVISIBILITY =
                                                true;
                                            _model.riva21BUTTONVISIBILITY =
                                                true;
                                          });
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Пара ${rowMatchRecord.pair}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        rowMatchRecord
                                                            .rival1.logotype,
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          rowMatchRecord
                                                              .rival1.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        rowMatchRecord
                                                            .rival2.logotype,
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          rowMatchRecord
                                                              .rival2.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final round3matchesListRefs =
                                  baseCOLUMNTournamentRecord.round3Matches
                                      .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: round3matchesListRefs.length,
                                itemBuilder:
                                    (context, round3matchesListRefsIndex) {
                                  final round3matchesListRefsItem =
                                      round3matchesListRefs[
                                          round3matchesListRefsIndex];
                                  return StreamBuilder<MatchRecord>(
                                    stream: MatchRecord.getDocument(
                                        round3matchesListRefsItem),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final rowMatchRecord = snapshot.data!;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.rival1BUTTONVISIBILITY =
                                                true;
                                            _model.riva21BUTTONVISIBILITY =
                                                true;
                                          });
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Пара ${rowMatchRecord.pair}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        rowMatchRecord
                                                            .rival1.logotype,
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          rowMatchRecord
                                                              .rival1.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        rowMatchRecord
                                                            .rival2.logotype,
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          rowMatchRecord
                                                              .rival2.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final round4matchesListRefs =
                                  baseCOLUMNTournamentRecord.round4Matches
                                      .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: round4matchesListRefs.length,
                                itemBuilder:
                                    (context, round4matchesListRefsIndex) {
                                  final round4matchesListRefsItem =
                                      round4matchesListRefs[
                                          round4matchesListRefsIndex];
                                  return StreamBuilder<MatchRecord>(
                                    stream: MatchRecord.getDocument(
                                        round4matchesListRefsItem),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final rowMatchRecord = snapshot.data!;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.rival1BUTTONVISIBILITY =
                                                true;
                                            _model.riva21BUTTONVISIBILITY =
                                                true;
                                          });
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Пара ${rowMatchRecord.pair}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        rowMatchRecord
                                                            .rival1.logotype,
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          rowMatchRecord
                                                              .rival1.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        rowMatchRecord
                                                            .rival2.logotype,
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          rowMatchRecord
                                                              .rival2.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
