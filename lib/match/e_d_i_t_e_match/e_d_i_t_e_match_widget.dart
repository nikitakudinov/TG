import '/components/e_d_i_t_e_match_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_d_i_t_e_match_model.dart';
export 'e_d_i_t_e_match_model.dart';

class EDITEMatchWidget extends StatefulWidget {
  const EDITEMatchWidget({
    Key? key,
    required this.matchReference,
  }) : super(key: key);

  final DocumentReference? matchReference;

  @override
  _EDITEMatchWidgetState createState() => _EDITEMatchWidgetState();
}

class _EDITEMatchWidgetState extends State<EDITEMatchWidget> {
  late EDITEMatchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EDITEMatchModel());
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
            'Редактировать матч',
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
              Expanded(
                child: wrapWithModel(
                  model: _model.eDITEMatchComponentModel,
                  updateCallback: () => setState(() {}),
                  child: EDITEMatchComponentWidget(
                    matchReference: widget.matchReference!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
