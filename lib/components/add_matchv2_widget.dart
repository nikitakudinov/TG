import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_matchv2_model.dart';
export 'add_matchv2_model.dart';

class AddMatchv2Widget extends StatefulWidget {
  const AddMatchv2Widget({Key? key}) : super(key: key);

  @override
  _AddMatchv2WidgetState createState() => _AddMatchv2WidgetState();
}

class _AddMatchv2WidgetState extends State<AddMatchv2Widget> {
  late AddMatchv2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMatchv2Model());
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
                                  _model.tournamentsListVISIBILITY = true;
                                  _model.dateAndTimeVISIBILITY = false;
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
                          if (_model.roundsVISIBILITY)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Раунд',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
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
                                    onChanged: (val) async {
                                      setState(() => _model.roundValue = val);
                                      setState(() {
                                        _model.pairsVISIBILITY = true;
                                      });
                                    },
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
                          if (_model.pairsVISIBILITY)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Пара',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
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
                                    onChanged: (val) async {
                                      setState(() => _model.pairValue = val);
                                      if ((_model.roundValue != null &&
                                              _model.roundValue != '') &&
                                          (_model.pairValue != null &&
                                              _model.pairValue != '')) {
                                        _model.matchData =
                                            await queryMatchRecordOnce(
                                          queryBuilder: (matchRecord) => matchRecord
                                              .where('gameForTournamentRef',
                                                  isEqualTo: _model
                                                      .selectedTournamentPathVALUE)
                                              .where('gameForTournamentRound',
                                                  isEqualTo: _model.roundValue)
                                              .where('pair',
                                                  isEqualTo: _model.pairValue),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        if (_model.matchData?.status ==
                                            'На модерации') {
                                          setState(() {
                                            _model.messageMatchAlreadyReportedVISIBILITY =
                                                true;
                                            _model.rivalsAndResultsVISIBILITY =
                                                true;
                                            _model.tournamentVISIBILITY = false;
                                            _model.roundsVISIBILITY = false;
                                            _model.pairsVISIBILITY = false;
                                            _model.understandButtonVISIBILITY =
                                                true;
                                            _model.rival1VISIBILITY = true;
                                            _model.rival1resultsVISIBILITY =
                                                true;
                                            _model.rival2VISIBILITY = true;
                                            _model.rival2resultsVISIBILITY =
                                                true;
                                            _model.winsDISABLED = true;
                                          });
                                        } else {
                                          if ((_model.matchData?.rival1
                                                      ?.teamReference ==
                                                  currentUserDocument
                                                      ?.memberOfTeamPATH) ||
                                              (_model.matchData?.rival2
                                                      ?.teamReference ==
                                                  currentUserDocument
                                                      ?.memberOfTeamPATH)) {
                                            setState(() {
                                              _model.rivalsAndResultsVISIBILITY =
                                                  true;
                                              _model.rival1VISIBILITY = true;
                                              _model.rival1resultsVISIBILITY =
                                                  true;
                                              _model.rival2VISIBILITY = true;
                                              _model.rival2resultsVISIBILITY =
                                                  true;
                                              _model.roundsVISIBILITY = false;
                                              _model.pairsVISIBILITY = false;
                                              _model.buttonsVISIBILITY = true;
                                              _model.sandReportButtonVISIBILITY =
                                                  true;
                                            });
                                          } else {
                                            setState(() {
                                              _model.messageTeamIsNotMemberOfMatchVISIBILITY =
                                                  true;
                                              _model.rivalsAndResultsVISIBILITY =
                                                  true;
                                              _model.rival1resultsVISIBILITY =
                                                  false;
                                              _model.rival2resultsVISIBILITY =
                                                  false;
                                              _model.roundsVISIBILITY = false;
                                              _model.pairsVISIBILITY = false;
                                              _model.understandButtonVISIBILITY =
                                                  true;
                                            });
                                          }
                                        }
                                      }

                                      setState(() {});
                                    },
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
                                  _model.dateAndTimeVISIBILITY = true;
                                  _model.selectedTournamentPathVALUE =
                                      listViewTournamentRecord.reference;
                                  _model.selectedTournamentNameVALUE =
                                      valueOrDefault<String>(
                                    listViewTournamentRecord.name,
                                    'Не выбран',
                                  );
                                  _model.roundsVISIBILITY = true;
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
          if (_model.messageMatchAlreadyReportedVISIBILITY)
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Visibility(
                visible: _model.messageMatchAlreadyReportedVISIBILITY,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.817,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Visibility(
                        visible: _model.messageMatchAlreadyReportedVISIBILITY,
                        child: Text(
                          'Выбранный матч уже находится на модерации. Возможно другой уполномоченный член вашей команды или член команды противника отправили результаты данного матча .',
                          maxLines: 4,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (_model.messageTeamIsNotMemberOfMatchVISIBILITY)
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.817,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Text(
                      'Вы не можете отправить результаты матча так как ваша команда не является участником данного матча.Убедитесь что правилно выбрали раунд и пару.',
                      maxLines: 6,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          if (_model.rivalsAndResultsVISIBILITY)
            Row(
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
                        Container(
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
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        _model.matchData?.rival1?.logotype,
                                        'false',
                                      ),
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.matchData?.rival1?.tag,
                                      '-',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.matchData?.rival1?.name,
                                      '-',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      if (valueOrDefault<bool>(
                        _model.rival2VISIBILITY,
                        false,
                      ))
                        Container(
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
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        _model.matchData?.rival2?.logotype,
                                        'false',
                                      ),
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.matchData?.rival2?.tag,
                                      '-',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.matchData?.rival2?.name,
                                      '-',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ],
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.wins1ValueController ??=
                              FormFieldController<String>(null),
                          options: ['1', '2', '3', '4', '5'],
                          onChanged: (val) async {
                            setState(() => _model.wins1Value = val);
                            setState(() {
                              _model.selectedWins1VALUE = valueOrDefault<int>(
                                functions.stringToInt(_model.wins1Value),
                                0,
                              );
                            });
                          },
                          width: 300.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: '0',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderWidth: 0.0,
                          borderRadius: 0.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          disabled: _model.winsDISABLED,
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.wins2ValueController ??=
                              FormFieldController<String>(null),
                          options: ['1', '2', '3', '4', '5'],
                          onChanged: (val) async {
                            setState(() => _model.wins2Value = val);
                            setState(() {
                              _model.selectedWins2VALUE = valueOrDefault<int>(
                                functions.stringToInt(_model.wins2Value),
                                0,
                              );
                            });
                          },
                          width: 300.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: '0',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderWidth: 0.0,
                          borderRadius: 0.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          disabled: _model.winsDISABLED,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                  ],
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
                    onPressed: () async {
                      context.safePop();
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
                if (_model.sandReportButtonVISIBILITY)
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        await _model.matchData!.reference
                            .update(createMatchRecordData(
                          status: 'На модерации',
                          matchWiner: _model.selectedWins1VALUE! >
                                  _model.selectedWins2VALUE!
                              ? _model.matchData?.rival1?.teamReference
                              : _model.matchData?.rival2?.teamReference,
                          rival1Wins: _model.wins1Value,
                          rival2Wins: _model.wins2Value,
                        ));
                        _model.tournamentData =
                            await TournamentRecord.getDocumentOnce(
                                _model.selectedTournamentPathVALUE!);

                        await RequestRecord.collection.doc().set({
                          ...createRequestRecordData(
                            type: 'Матч репорт',
                            fromTeam: currentUserDocument?.memberOfTeamPATH,
                            toTurnamentName: _model.tournamentData?.name,
                            matchReference: _model.matchData?.reference,
                          ),
                          'toTournamentOrganizators':
                              _model.tournamentData?.organizatorsTeam,
                        });

                        setState(() {});
                      },
                      text: 'Отправить на модерацию',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
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
                if (_model.understandButtonVISIBILITY)
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          _model.rival1VISIBILITY = false;
                          _model.rival1resultsVISIBILITY = false;
                          _model.rival2VISIBILITY = false;
                          _model.rival2resultsVISIBILITY = false;
                          _model.selectedTournamentPathVALUE = null;
                          _model.dateAndTimeVISIBILITY = true;
                          _model.rivalsAndResultsVISIBILITY = true;
                          _model.messageMatchAlreadyReportedVISIBILITY = false;
                          _model.messageTeamIsNotMemberOfMatchVISIBILITY =
                              false;
                          _model.tournamentVISIBILITY = true;
                          _model.buttonsVISIBILITY = false;
                          _model.understandButtonVISIBILITY = false;
                        });
                      },
                      text: 'Ясно',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
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
