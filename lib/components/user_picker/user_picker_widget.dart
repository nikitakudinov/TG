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
import 'user_picker_model.dart';
export 'user_picker_model.dart';

class UserPickerWidget extends StatefulWidget {
  const UserPickerWidget({
    Key? key,
    required this.teamReference,
    required this.userReference,
  }) : super(key: key);

  final DocumentReference? teamReference;
  final DocumentReference? userReference;

  @override
  _UserPickerWidgetState createState() => _UserPickerWidgetState();
}

class _UserPickerWidgetState extends State<UserPickerWidget> {
  late UserPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPickerModel());

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
        StreamBuilder<TeamRecord>(
          stream: TeamRecord.getDocument(widget.teamReference!),
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
            final rowTeamRecord = snapshot.data!;
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Текущий состав',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                if (valueOrDefault<bool>(
                  () {
                    if (rowTeamRecord.owner == currentUserReference) {
                      return true;
                    } else if ((rowTeamRecord.reference ==
                            currentUserDocument?.memberOfTeamPATH) &&
                        (valueOrDefault(
                                currentUserDocument?.memberOfTeamTeamRole,
                                '') ==
                            'Администратор')) {
                      return true;
                    } else {
                      return false;
                    }
                  }(),
                  true,
                ))
                  AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          _model.searchFieldVISIBILITY = true;
                          _model.addPlayerButtonVISIBILITY = false;
                        });
                      },
                      text: 'Добавить',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
              ],
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
                  'Добавить этого пользователя в команду?',
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
                                _model.selectedUserAvatarVALUE,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              _model.selectedUserNicknameVALUE,
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
                                  _model.messageVISIBILITY = false;
                                  _model.selectedUserReferenceVALUE = null;
                                  _model.selectedUserNicknameVALUE =
                                      'Не выбран';
                                  _model.selectedUserAvatarVALUE =
                                      'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33';
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
                                _model.teamData =
                                    await TeamRecord.getDocumentOnce(
                                        widget.teamReference!);

                                await RequestRecord.collection
                                    .doc()
                                    .set(createRequestRecordData(
                                      type: 'Пиглашение в команду',
                                      fromTeam: widget.teamReference,
                                      toUser: _model.selectedUserReferenceVALUE,
                                      fromTeamName: _model.teamData?.name,
                                      fromTeamTAG: _model.teamData?.tag,
                                    ));
                                setState(() {
                                  _model.addPlayerButtonVISIBILITY = true;
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
        if (_model.searchFieldVISIBILITY)
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
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
                                  (record) => TextSearchItem(record,
                                      [record.email!, record.nickname!]),
                                )
                                .toList(),
                          )
                              .search(_model.textController.text)
                              .map((r) => r.object)
                              .take(5)
                              .toList(),
                        )
                        .onError((_, __) => _model.simpleSearchResults = [])
                        .whenComplete(() => setState(() {}));
                  },
                ),
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Никнейм или email пользователя',
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
        if (_model.resultsListVISIBILITY)
          Builder(
            builder: (context) {
              final searchResults = _model.simpleSearchResults
                  .map((e) => e)
                  .toList()
                  .where((e) => e.memberOfTeamNAME == 'free')
                  .toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: searchResults.length,
                itemBuilder: (context, searchResultsIndex) {
                  final searchResultsItem = searchResults[searchResultsIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      setState(() {
                        _model.selectedUserAvatarVALUE =
                            searchResultsItem.avatar;
                        _model.selectedUserNicknameVALUE =
                            searchResultsItem.nickname;
                        _model.selectedUserReferenceVALUE =
                            searchResultsItem.reference;
                        _model.messageVISIBILITY = true;
                        _model.resultsListVISIBILITY = false;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            searchResultsItem.avatar,
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              searchResultsItem.nickname,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    searchResultsItem.countryFlag,
                                    width: 25.0,
                                    height: 20.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  searchResultsItem.countryName,
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
      ],
    );
  }
}
