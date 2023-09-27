import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/tournament_match_configurator_widget.dart';
import '/components/tournament_organizator_picker_widget.dart';
import '/components/tournament_organizators_list/tournament_organizators_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_d_i_t_e_tournament_model.dart';
export 'e_d_i_t_e_tournament_model.dart';

class EDITETournamentWidget extends StatefulWidget {
  const EDITETournamentWidget({
    Key? key,
    required this.tournamentReference,
  }) : super(key: key);

  final DocumentReference? tournamentReference;

  @override
  _EDITETournamentWidgetState createState() => _EDITETournamentWidgetState();
}

class _EDITETournamentWidgetState extends State<EDITETournamentWidget> {
  late EDITETournamentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EDITETournamentModel());
  }

  @override
  void dispose() {
    _model.dispose();

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
        final eDITETournamentTournamentRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: Text(
                'Управление турниром',
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
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController ??=
                                  TextEditingController(
                                text: eDITETournamentTournamentRecord.name,
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Название',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.safePop();
                                },
                                text: 'Отмена',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
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
                            ),
                            if (functions.checkIfListContainValue(
                                    currentUserReference,
                                    eDITETournamentTournamentRecord
                                        .organizatorsTeam
                                        .toList()) ??
                                true)
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await TournamentRecord.collection
                                        .doc()
                                        .set(createTournamentRecordData(
                                          name: _model.textController.text,
                                          owner: currentUserReference,
                                        ));
                                    _model.tournamentData =
                                        await queryTournamentRecordOnce(
                                      queryBuilder: (tournamentRecord) =>
                                          tournamentRecord.where('Owner',
                                              isEqualTo: currentUserReference),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);

                                    await currentUserReference!.update({
                                      'OwnerOfTournamentPath':
                                          FieldValue.arrayUnion([
                                        _model.tournamentData?.reference
                                      ]),
                                    });

                                    setState(() {});
                                  },
                                  text: 'Сохранить',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
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
                              ),
                          ].divide(SizedBox(width: 20.0)),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.tournamentOrganizatorPickerModel,
                        updateCallback: () => setState(() {}),
                        child: TournamentOrganizatorPickerWidget(
                          tournamentReference: widget.tournamentReference!,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.tournamentOrganizatorsListModel,
                        updateCallback: () => setState(() {}),
                        child: TournamentOrganizatorsListWidget(
                          tournamentReference: widget.tournamentReference!,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.tournamentMatchConfiguratorModel,
                        updateCallback: () => setState(() {}),
                        child: TournamentMatchConfiguratorWidget(
                          tournamentReference: widget.tournamentReference!,
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
