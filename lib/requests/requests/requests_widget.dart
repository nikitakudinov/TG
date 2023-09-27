import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'requests_model.dart';
export 'requests_model.dart';

class RequestsWidget extends StatefulWidget {
  const RequestsWidget({Key? key}) : super(key: key);

  @override
  _RequestsWidgetState createState() => _RequestsWidgetState();
}

class _RequestsWidgetState extends State<RequestsWidget> {
  late RequestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<RequestRecord>>(
                stream: queryRequestRecord(
                  queryBuilder: (requestRecord) => requestRecord
                      .where('toUser', isEqualTo: currentUserReference)
                      .where('type', isEqualTo: 'Пиглашение в команду'),
                  singleRecord: true,
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
                  List<RequestRecord> listViewRequestRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final listViewRequestRecord =
                      listViewRequestRecordList.isNotEmpty
                          ? listViewRequestRecordList.first
                          : null;
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Команда ${listViewRequestRecord?.fromTeamName} приглашает вас вступить в ее ряды. Вы согласны?',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await listViewRequestRecord!.reference
                                        .delete();
                                  },
                                  text: 'нет',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                                    await listViewRequestRecord!.fromTeam!
                                        .update({
                                      'members': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    });

                                    await listViewRequestRecord!.toUser!
                                        .update(createUserRecordData(
                                      memberOfTeamPATH:
                                          listViewRequestRecord?.fromTeam,
                                      memberOfTeamNAME:
                                          listViewRequestRecord?.fromTeamName,
                                      memberOfTeamTAG:
                                          listViewRequestRecord?.fromTeamTAG,
                                      memberOfTeamTeamRole: 'Игрок команды',
                                      memberOfTeamLineUp: false,
                                    ));
                                    await listViewRequestRecord!.reference
                                        .delete();
                                  },
                                  text: 'да',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              StreamBuilder<List<RequestRecord>>(
                stream: queryRequestRecord(
                  queryBuilder: (requestRecord) => requestRecord
                      .where('toUser', isEqualTo: currentUserReference)
                      .where('type',
                          isEqualTo:
                              'Пиглашение в команду организаторов турнира'),
                  singleRecord: true,
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
                  List<RequestRecord> listViewRequestRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final listViewRequestRecord =
                      listViewRequestRecordList.isNotEmpty
                          ? listViewRequestRecordList.first
                          : null;
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Турнир${listViewRequestRecord?.fromTournamentName} приглашает вас вступить в  ряды организаторов турнира. Вы согласны?',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await listViewRequestRecord!.reference
                                        .delete();
                                  },
                                  text: 'нет',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                                    await listViewRequestRecord!.fromTournament!
                                        .update({
                                      'OrganizatorsTeam': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    });

                                    await listViewRequestRecord!.toUser!
                                        .update({
                                      'memberOfTheTournamentOrganizingTeam':
                                          FieldValue.arrayUnion([
                                        listViewRequestRecord?.fromTournament
                                      ]),
                                    });
                                    await listViewRequestRecord!.reference
                                        .delete();
                                  },
                                  text: 'да',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              StreamBuilder<List<RequestRecord>>(
                stream: queryRequestRecord(
                  queryBuilder: (requestRecord) => requestRecord
                      .where('toUser', isEqualTo: currentUserReference)
                      .where('type', isEqualTo: 'Заявка на участие в турнире'),
                  singleRecord: true,
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
                  List<RequestRecord> listViewRequestRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final listViewRequestRecord =
                      listViewRequestRecordList.isNotEmpty
                          ? listViewRequestRecordList.first
                          : null;
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Команда${listViewRequestRecord?.fromTeamName}Желает стать участником турнира. Вы согласны?',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await listViewRequestRecord!.reference
                                        .delete();
                                  },
                                  text: 'нет',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                                    await listViewRequestRecord!.toTournament!
                                        .update({
                                      'Members': FieldValue.arrayUnion([
                                        getTournamentMemberFirestoreData(
                                          createTournamentMemberStruct(
                                            name: listViewRequestRecord
                                                ?.fromTeamName,
                                            tag: listViewRequestRecord
                                                ?.fromTeamTAG,
                                            teamReference:
                                                listViewRequestRecord?.fromTeam,
                                            logotype: listViewRequestRecord
                                                ?.fromTeamLogotype,
                                            country: listViewRequestRecord
                                                ?.fromTeamCountry,
                                            flag: listViewRequestRecord
                                                ?.fromTeamFlag,
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    });

                                    await listViewRequestRecord!.fromTeam!
                                        .update({
                                      'memberOfTournament':
                                          FieldValue.arrayUnion([
                                        listViewRequestRecord?.toTournament
                                      ]),
                                    });
                                    await listViewRequestRecord!.reference
                                        .delete();
                                  },
                                  text: 'да',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              StreamBuilder<List<RequestRecord>>(
                stream: queryRequestRecord(
                  queryBuilder: (requestRecord) => requestRecord.where(
                      'toTournamentOrganizators',
                      arrayContains: currentUserReference),
                  singleRecord: true,
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
                  List<RequestRecord> listViewRequestRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final listViewRequestRecord =
                      listViewRequestRecordList.isNotEmpty
                          ? listViewRequestRecordList.first
                          : null;
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Отчет о сыграном матче от команды${listViewRequestRecord?.fromTeamName}в рамкках турнира ${listViewRequestRecord?.toTurnamentName}',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {},
                                  text: 'нет',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                                    _model.matchData =
                                        await MatchRecord.getDocumentOnce(
                                            listViewRequestRecord!
                                                .matchReference!);
                                    _model.tournamentData =
                                        await TournamentRecord.getDocumentOnce(
                                            _model.matchData!
                                                .gameForTournamentRef!);
                                    _model.matchWinerData =
                                        await TeamRecord.getDocumentOnce(
                                            _model.matchData!.matchWiner!);

                                    await listViewRequestRecord!.matchReference!
                                        .update(createMatchRecordData(
                                      status: 'Матч сыгран',
                                    ));
                                    while ((_model.matchData
                                                ?.gameForTournamentRound ==
                                            '1') &&
                                        (_model.matchData?.pair == '1')) {
                                      _model.nextMatchDataFromRound1Pair1 =
                                          await queryMatchRecordOnce(
                                        queryBuilder: (matchRecord) =>
                                            matchRecord
                                                .where('gameForTournamentRef',
                                                    isEqualTo: _model
                                                        .tournamentData
                                                        ?.reference)
                                                .where('gameForTournamentRound',
                                                    isEqualTo: '2')
                                                .where('pair', isEqualTo: '1'),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.nextMatchDataFromRound1Pair1!
                                          .reference
                                          .update(createMatchRecordData(
                                        rival1: createTournamentMemberStruct(
                                          logotype:
                                              _model.matchWinerData?.logotype,
                                          name: _model.matchWinerData?.name,
                                          tag: _model.matchWinerData?.tag,
                                          teamReference:
                                              _model.matchWinerData?.reference,
                                          country: '',
                                          flag: '',
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      await listViewRequestRecord!.reference
                                          .delete();
                                    }
                                    while ((_model.matchData
                                                ?.gameForTournamentRound ==
                                            '1') &&
                                        (_model.matchData?.pair == '2')) {
                                      _model.nextMatchDataFromRound1Pair2 =
                                          await queryMatchRecordOnce(
                                        queryBuilder: (matchRecord) =>
                                            matchRecord
                                                .where('gameForTournamentRef',
                                                    isEqualTo: _model
                                                        .tournamentData
                                                        ?.reference)
                                                .where('gameForTournamentRound',
                                                    isEqualTo: '2')
                                                .where('pair', isEqualTo: '1'),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.nextMatchDataFromRound1Pair2!
                                          .reference
                                          .update(createMatchRecordData(
                                        rival2: createTournamentMemberStruct(
                                          logotype:
                                              _model.matchWinerData?.logotype,
                                          name: _model.matchWinerData?.name,
                                          tag: _model.matchWinerData?.tag,
                                          teamReference:
                                              _model.matchWinerData?.reference,
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      await listViewRequestRecord!.reference
                                          .delete();
                                    }
                                    while ((_model.matchData
                                                ?.gameForTournamentRound ==
                                            '1') &&
                                        (_model.matchData?.pair == '3')) {
                                      _model.nextMatchDataFromRound1Pair3 =
                                          await queryMatchRecordOnce(
                                        queryBuilder: (matchRecord) =>
                                            matchRecord
                                                .where('gameForTournamentRef',
                                                    isEqualTo: _model
                                                        .tournamentData
                                                        ?.reference)
                                                .where('gameForTournamentRound',
                                                    isEqualTo: '2')
                                                .where('pair', isEqualTo: '2'),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.nextMatchDataFromRound1Pair3!
                                          .reference
                                          .update(createMatchRecordData(
                                        rival1: createTournamentMemberStruct(
                                          logotype:
                                              _model.matchWinerData?.logotype,
                                          name: _model.matchWinerData?.name,
                                          tag: _model.matchWinerData?.tag,
                                          teamReference:
                                              _model.matchWinerData?.reference,
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      await listViewRequestRecord!.reference
                                          .delete();
                                    }
                                    while ((_model.matchData
                                                ?.gameForTournamentRound ==
                                            '1') &&
                                        (_model.matchData?.pair == '4')) {
                                      _model.nextMatchDataFromRound1Pair4 =
                                          await queryMatchRecordOnce(
                                        queryBuilder: (matchRecord) =>
                                            matchRecord
                                                .where('gameForTournamentRef',
                                                    isEqualTo: _model
                                                        .tournamentData
                                                        ?.reference)
                                                .where('gameForTournamentRound',
                                                    isEqualTo: '2')
                                                .where('pair', isEqualTo: '2'),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.nextMatchDataFromRound1Pair4!
                                          .reference
                                          .update(createMatchRecordData(
                                        rival2: createTournamentMemberStruct(
                                          logotype:
                                              _model.matchWinerData?.logotype,
                                          name: _model.matchWinerData?.name,
                                          tag: _model.matchWinerData?.tag,
                                          teamReference:
                                              _model.matchWinerData?.reference,
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      await listViewRequestRecord!.reference
                                          .delete();
                                    }
                                    while ((_model.matchData
                                                ?.gameForTournamentRound ==
                                            '1') &&
                                        (_model.matchData?.pair == '5')) {
                                      _model.nextMatchDataFromRound1Pair5 =
                                          await queryMatchRecordOnce(
                                        queryBuilder: (matchRecord) =>
                                            matchRecord
                                                .where('gameForTournamentRef',
                                                    isEqualTo: _model
                                                        .tournamentData
                                                        ?.reference)
                                                .where('gameForTournamentRound',
                                                    isEqualTo: '2')
                                                .where('pair', isEqualTo: '3'),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.nextMatchDataFromRound1Pair5!
                                          .reference
                                          .update(createMatchRecordData(
                                        rival1: createTournamentMemberStruct(
                                          logotype:
                                              _model.matchWinerData?.logotype,
                                          name: _model.matchWinerData?.name,
                                          tag: _model.matchWinerData?.tag,
                                          teamReference:
                                              _model.matchWinerData?.reference,
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      await listViewRequestRecord!.reference
                                          .delete();
                                    }
                                    while ((_model.matchData
                                                ?.gameForTournamentRound ==
                                            '1') &&
                                        (_model.matchData?.pair == '6')) {
                                      _model.nextMatchDataFromRound1Pair6 =
                                          await queryMatchRecordOnce(
                                        queryBuilder: (matchRecord) =>
                                            matchRecord
                                                .where('gameForTournamentRef',
                                                    isEqualTo: _model
                                                        .tournamentData
                                                        ?.reference)
                                                .where('gameForTournamentRound',
                                                    isEqualTo: '2')
                                                .where('pair', isEqualTo: '3'),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.nextMatchDataFromRound1Pair6!
                                          .reference
                                          .update(createMatchRecordData(
                                        rival2: createTournamentMemberStruct(
                                          logotype:
                                              _model.matchWinerData?.logotype,
                                          name: _model.matchWinerData?.name,
                                          tag: _model.matchWinerData?.tag,
                                          teamReference:
                                              _model.matchWinerData?.reference,
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      await listViewRequestRecord!.reference
                                          .delete();
                                    }
                                    while ((_model.matchData
                                                ?.gameForTournamentRound ==
                                            '1') &&
                                        (_model.matchData?.pair == '7')) {
                                      _model.nextMatchDataFromRound1Pair7 =
                                          await queryMatchRecordOnce(
                                        queryBuilder: (matchRecord) =>
                                            matchRecord
                                                .where('gameForTournamentRef',
                                                    isEqualTo: _model
                                                        .tournamentData
                                                        ?.reference)
                                                .where('gameForTournamentRound',
                                                    isEqualTo: '2')
                                                .where('pair', isEqualTo: '4'),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.nextMatchDataFromRound1Pair7!
                                          .reference
                                          .update(createMatchRecordData(
                                        rival1: createTournamentMemberStruct(
                                          logotype:
                                              _model.matchWinerData?.logotype,
                                          name: _model.matchWinerData?.name,
                                          tag: _model.matchWinerData?.tag,
                                          teamReference:
                                              _model.matchWinerData?.reference,
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      await listViewRequestRecord!.reference
                                          .delete();
                                    }
                                    while ((_model.matchData
                                                ?.gameForTournamentRound ==
                                            '1') &&
                                        (_model.matchData?.pair == '8')) {
                                      _model.nextMatchDataFromRound1Pair8 =
                                          await queryMatchRecordOnce(
                                        queryBuilder: (matchRecord) =>
                                            matchRecord
                                                .where('gameForTournamentRef',
                                                    isEqualTo: _model
                                                        .tournamentData
                                                        ?.reference)
                                                .where('gameForTournamentRound',
                                                    isEqualTo: '2')
                                                .where('pair', isEqualTo: '4'),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      await _model.nextMatchDataFromRound1Pair8!
                                          .reference
                                          .update(createMatchRecordData(
                                        rival2: createTournamentMemberStruct(
                                          logotype:
                                              _model.matchWinerData?.logotype,
                                          name: _model.matchWinerData?.name,
                                          tag: _model.matchWinerData?.tag,
                                          teamReference:
                                              _model.matchWinerData?.reference,
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      await listViewRequestRecord!.reference
                                          .delete();
                                    }

                                    setState(() {});
                                  },
                                  text: 'да',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
