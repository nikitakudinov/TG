import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_matchv2_copy_model.dart';
export 'add_matchv2_copy_model.dart';

class AddMatchv2CopyWidget extends StatefulWidget {
  const AddMatchv2CopyWidget({Key? key}) : super(key: key);

  @override
  _AddMatchv2CopyWidgetState createState() => _AddMatchv2CopyWidgetState();
}

class _AddMatchv2CopyWidgetState extends State<AddMatchv2CopyWidget> {
  late AddMatchv2CopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMatchv2CopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Матч турнира',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.rival1VISIBILITY = false;
                                  _model.rival2VISIBILITY = false;
                                  _model.tournamentsListVISIBILITY = true;
                                  _model.rival1resultsVISIBILITY = false;
                                  _model.rival2resultsVISIBILITY = false;
                                  _model.dateAndTimeVISIBILITY = false;
                                  _model.rivalsAndResultsVISIBILITY = false;
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      _model.selectedTournamentNameVALUE,
                                      'Не выбран',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Раунд',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Container(
                                width: 70.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.roundValueController ??=
                                      FormFieldController<String>(null),
                                  options: ['1', '2', '4', '5', '6'],
                                  onChanged: (val) =>
                                      setState(() => _model.roundValue = val),
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: '1',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderWidth: 0.0,
                                  borderRadius: 0.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Пара',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Container(
                                width: 70.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.pairValueController ??=
                                      FormFieldController<String>(null),
                                  options: ['1', '2', '4', '5', '6', '7', '8'],
                                  onChanged: (val) =>
                                      setState(() => _model.pairValue = val),
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: '1',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderWidth: 0.0,
                                  borderRadius: 0.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
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
                  ],
                ),
              ),
            ],
          ),
          if (_model.dateAndTimeVISIBILITY)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Дата матча',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050),
                                  );

                                  TimeOfDay? _datePickedTime;
                                  if (_datePickedDate != null) {
                                    _datePickedTime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          getCurrentTimestamp),
                                    );
                                  }

                                  if (_datePickedDate != null &&
                                      _datePickedTime != null) {
                                    safeSetState(() {
                                      _model.datePicked = DateTime(
                                        _datePickedDate.year,
                                        _datePickedDate.month,
                                        _datePickedDate.day,
                                        _datePickedTime!.hour,
                                        _datePickedTime.minute,
                                      );
                                    });
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      dateTimeFormat(
                                          'd/M/y', _model.datePicked),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    Text(
                                      dateTimeFormat('Hm', _model.datePicked),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Encode Sans Condensed',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (_model.rivalsAndResultsVISIBILITY)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if ((_model.roundValue != null && _model.roundValue != '') &&
                    (_model.pairValue != null && _model.pairValue != '')) {
                  _model.matchData = await queryMatchRecordOnce(
                    queryBuilder: (matchRecord) => matchRecord
                        .where('gameForTournamentRef',
                            isEqualTo: _model.selectedTournamentPathVALUE)
                        .where('gameForTournamentRound',
                            isEqualTo: _model.roundValue)
                        .where('pair', isEqualTo: _model.pairValue),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);
                }

                setState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (valueOrDefault<bool>(
                          _model.rival1VISIBILITY,
                          false,
                        ))
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.teamsListVISABILITY = true;
                                _model.selectedSlot = 1;
                                _model.rival2VISIBILITY = false;
                                _model.rival2resultsVISIBILITY = false;
                              });
                              _model.tournamentsListStream =
                                  await TournamentRecord.getDocumentOnce(
                                      _model.selectedTournamentPathVALUE!);

                              setState(() {});
                            },
                            child: Container(
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Text(
                                          'Соперник 1',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            _model.selectedTeam1LogotypeVALUE,
                                            'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                                          ),
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        _model.selectedTeam1TagVALUE,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        _model.selectedTeam1NameVALUE,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          _model.rival2VISIBILITY,
                          false,
                        ))
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.teamsListVISABILITY = true;
                                _model.selectedSlot = 2;
                              });
                              _model.tournamentsListStreamCopy =
                                  await TournamentRecord.getDocumentOnce(
                                      _model.selectedTournamentPathVALUE!);

                              setState(() {});
                            },
                            child: Container(
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Text(
                                          'Соперник 2',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            _model.selectedTeam2LogotypeVALUE,
                                            'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                                          ),
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        _model.selectedTeam2NameVALUE,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        _model.selectedTeam2TagVALUE,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (valueOrDefault<bool>(
                        _model.rival1resultsVISIBILITY,
                        false,
                      ))
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.wins1ValueController ??=
                                FormFieldController<String>(null),
                            options: ['1', '2', '3', '4', '5'],
                            onChanged: (val) =>
                                setState(() => _model.wins1Value = val),
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: '0',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderWidth: 0.0,
                            borderRadius: 0.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      if (valueOrDefault<bool>(
                        _model.rival2resultsVISIBILITY,
                        false,
                      ))
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.wins2ValueController ??=
                                FormFieldController<String>(null),
                            options: ['1', '2', '3', '4', '5'],
                            onChanged: (val) =>
                                setState(() => _model.wins2Value = val),
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: '0',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderWidth: 0.0,
                            borderRadius: 0.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
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
          if (valueOrDefault<bool>(
            _model.teamsListVISABILITY,
            false,
          ))
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(
                      builder: (context) {
                        final tournamentMembers =
                            _model.tournamentsListStream?.members?.toList() ??
                                [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
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
                                if (_model.selectedSlot == 1) {
                                  setState(() {
                                    _model.selectedTeam1PathVALUE =
                                        tournamentMembersItem.teamReference;
                                    _model.selectedTeam1NameVALUE =
                                        valueOrDefault<String>(
                                      tournamentMembersItem.name,
                                      '-',
                                    );
                                    _model.selectedTeam1TagVALUE =
                                        valueOrDefault<String>(
                                      tournamentMembersItem.tag,
                                      '-',
                                    );
                                    _model.selectedTeam1LogotypeVALUE =
                                        valueOrDefault<String>(
                                      tournamentMembersItem.logotype,
                                      'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                                    );
                                    _model.teamsListVISABILITY = false;
                                    _model.rival2VISIBILITY = true;
                                    _model.rival2resultsVISIBILITY = true;
                                    _model.addToSelectedTeams(
                                        TournamentMemberStruct(
                                      logotype: tournamentMembersItem.logotype,
                                      name: tournamentMembersItem.name,
                                      tag: tournamentMembersItem.tag,
                                      teamReference:
                                          tournamentMembersItem.teamReference,
                                    ));
                                  });
                                } else {
                                  setState(() {
                                    _model.selectedTeam2PathVALUE =
                                        tournamentMembersItem.teamReference;
                                    _model.selectedTeam2NameVALUE =
                                        valueOrDefault<String>(
                                      tournamentMembersItem.name,
                                      '-',
                                    );
                                    _model.selectedTeam2TagVALUE =
                                        valueOrDefault<String>(
                                      tournamentMembersItem.tag,
                                      '-',
                                    );
                                    _model.selectedTeam2LogotypeVALUE =
                                        valueOrDefault<String>(
                                      tournamentMembersItem.logotype,
                                      'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                                    );
                                    _model.teamsListVISABILITY = false;
                                    _model.addToSelectedTeams(
                                        TournamentMemberStruct(
                                      logotype: tournamentMembersItem.logotype,
                                      name: tournamentMembersItem.name,
                                      tag: tournamentMembersItem.tag,
                                      teamReference:
                                          tournamentMembersItem.teamReference,
                                    ));
                                  });
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        tournamentMembersItem.logotype,
                                        'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                                      ),
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Text(
                                      tournamentMembersItem.tag,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Text(
                                      tournamentMembersItem.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
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
          if (valueOrDefault<bool>(
            _model.tournamentsListVISIBILITY,
            false,
          ))
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: StreamBuilder<List<TournamentRecord>>(
                      stream: queryTournamentRecord(),
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
                        List<TournamentRecord> listViewTournamentRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewTournamentRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewTournamentRecord =
                                listViewTournamentRecordList[listViewIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.tournamentsListVISIBILITY = false;
                                  _model.rival1VISIBILITY = true;
                                  _model.rival1resultsVISIBILITY = true;
                                  _model.rival2VISIBILITY = true;
                                  _model.rival2resultsVISIBILITY = true;
                                  _model.dateAndTimeVISIBILITY = true;
                                  _model.rivalsAndResultsVISIBILITY = true;
                                  _model.selectedTournamentPathVALUE =
                                      listViewTournamentRecord.reference;
                                  _model.selectedTournamentNameVALUE =
                                      valueOrDefault<String>(
                                    listViewTournamentRecord.name,
                                    'Не выбран',
                                  );
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Text(
                                      listViewTournamentRecord.name,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
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
          if (_model.matchWinerVISIBILITY)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Visibility(
                          visible: _model.matchWinerVISIBILITY,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Победитель в матче',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.matchTeamsListVISIBILITY = true;
                                    });
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              _model.selectedWinerLogotypeVALUE,
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            _model.selectedWinerNameVALUE!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (_model.matchTeamsListVISIBILITY)
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(
                      builder: (context) {
                        final selectedTeamsLiost =
                            _model.selectedTeams.map((e) => e).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: selectedTeamsLiost.length,
                          itemBuilder: (context, selectedTeamsLiostIndex) {
                            final selectedTeamsLiostItem =
                                selectedTeamsLiost[selectedTeamsLiostIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.selectedWinerPathVALUE =
                                      selectedTeamsLiostItem.teamReference;
                                  _model.selectedWinerNameVALUE =
                                      selectedTeamsLiostItem.name;
                                  _model.selectedWinerTagVALUE =
                                      selectedTeamsLiostItem.tag;
                                  _model.selectedWinerLogotypeVALUE =
                                      selectedTeamsLiostItem.logotype;
                                  _model.matchTeamsListVISIBILITY = false;
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        selectedTeamsLiostItem.logotype,
                                        'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33',
                                      ),
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Text(
                                      selectedTeamsLiostItem.tag,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Text(
                                      selectedTeamsLiostItem.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Отмена',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                ),
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.selectedTournamentData =
                          await TournamentRecord.getDocumentOnce(
                              _model.selectedTournamentPathVALUE!);
                      _model.match = await queryMatchRecordOnce(
                        queryBuilder: (matchRecord) => matchRecord
                            .where('gameForTournamentRef',
                                isEqualTo: _model.selectedTournamentPathVALUE)
                            .where('gameForTournamentRound',
                                isEqualTo: _model.roundValue)
                            .where('pair', isEqualTo: _model.pairValue),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);

                      await RequestRecord.collection.doc().set({
                        ...createRequestRecordData(
                          type: 'Матч репорт',
                          fromTeam: currentUserDocument?.memberOfTeamPATH,
                          fromTeamName: valueOrDefault(
                              currentUserDocument?.memberOfTeamNAME, ''),
                          fromTeamTAG: valueOrDefault(
                              currentUserDocument?.memberOfTeamTAG, ''),
                          toTournament: _model.tournamentsListStream?.reference,
                          toTurnamentName: _model.selectedTournamentData?.name,
                        ),
                        'toTournamentOrganizators':
                            _model.selectedTournamentData?.organizatorsTeam,
                      });

                      setState(() {});
                    },
                    text: 'Отправить на модерацию',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
        ],
      ),
    );
  }
}
