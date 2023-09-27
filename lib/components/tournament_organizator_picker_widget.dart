import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'tournament_organizator_picker_model.dart';
export 'tournament_organizator_picker_model.dart';

class TournamentOrganizatorPickerWidget extends StatefulWidget {
  const TournamentOrganizatorPickerWidget({
    Key? key,
    required this.tournamentReference,
  }) : super(key: key);

  final DocumentReference? tournamentReference;

  @override
  _TournamentOrganizatorPickerWidgetState createState() =>
      _TournamentOrganizatorPickerWidgetState();
}

class _TournamentOrganizatorPickerWidgetState
    extends State<TournamentOrganizatorPickerWidget> {
  late TournamentOrganizatorPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TournamentOrganizatorPickerModel());

    _model.textController ??= TextEditingController();
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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Состав организаторов',
              style: FlutterFlowTheme.of(context).headlineSmall,
            ),
            if (_model.addUserButtonVISIBILITY)
              FFButtonWidget(
                onPressed: () async {
                  setState(() {
                    _model.searchFieldVISIBILITY = true;
                  });
                },
                text: 'Добавить',
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
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Visibility(
            visible: _model.searchFieldVISIBILITY,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: TextFormField(
                controller: _model.textController,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 2000),
                  () async {
                    await queryUserRecordOnce()
                        .then(
                          (records) => _model.simpleSearchResults = TextSearch(
                            records
                                .map(
                                  (record) => TextSearchItem(record, [
                                    record.email!,
                                    record.nickname!,
                                    record.memberOfTeamTAG!,
                                    record.memberOfTeamNAME!
                                  ]),
                                )
                                .toList(),
                          )
                              .search(_model.textController.text)
                              .map((r) => r.object)
                              .take(10)
                              .toList(),
                        )
                        .onError((_, __) => _model.simpleSearchResults = [])
                        .whenComplete(() => setState(() {}));
                  },
                ),
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Никнейм, email, tag, название команды',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ),
        ),
        if (_model.searchFieldVISIBILITY)
          Builder(
            builder: (context) {
              final listOfResults = _model.simpleSearchResults.toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listOfResults.length,
                itemBuilder: (context, listOfResultsIndex) {
                  final listOfResultsItem = listOfResults[listOfResultsIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      setState(() {
                        _model.selectedUserAvatarVALUE =
                            listOfResultsItem.avatar;
                        _model.selectedUserNicknameVALUE =
                            listOfResultsItem.nickname;
                        _model.selectedUserTeamTagVALUE =
                            listOfResultsItem.memberOfTeamTAG;
                        _model.selectedUserReferenceVALUE =
                            listOfResultsItem.reference;
                        _model.resultsListVISIBILITY = false;
                        _model.messageVISIBILITY = true;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            listOfResultsItem.avatar,
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '[${listOfResultsItem.memberOfTeamTAG}]${listOfResultsItem.nickname}',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    listOfResultsItem.countryFlag,
                                    width: 20.0,
                                    height: 15.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  listOfResultsItem.countryName,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
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
          ),
        if (_model.messageVISIBILITY)
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Добавить этого пользователя в команду организаторов?',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                _model.selectedUserAvatarVALUE!,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              _model.selectedUserNicknameVALUE!,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.selectedUserAvatarVALUE = null;
                                  _model.selectedUserNicknameVALUE =
                                      'Не выбран';
                                  _model.selectedUserTeamTagVALUE = '';
                                  _model.selectedUserReferenceVALUE = null;
                                  _model.messageVISIBILITY = false;
                                });
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
                                _model.tournamentData =
                                    await TournamentRecord.getDocumentOnce(
                                        widget.tournamentReference!);

                                await RequestRecord.collection
                                    .doc()
                                    .set(createRequestRecordData(
                                      type:
                                          'Пиглашение в команду организаторов турнира',
                                      toUser: _model.selectedUserReferenceVALUE,
                                      fromTournament:
                                          _model.tournamentData?.reference,
                                      fromTournamentName:
                                          _model.tournamentData?.name,
                                    ));
                                setState(() {
                                  _model.messageVISIBILITY = false;
                                });

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
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
