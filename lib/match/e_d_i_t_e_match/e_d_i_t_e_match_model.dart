import '/components/e_d_i_t_e_match_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EDITEMatchModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for EDITE_match_component component.
  late EDITEMatchComponentModel eDITEMatchComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    eDITEMatchComponentModel =
        createModel(context, () => EDITEMatchComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    eDITEMatchComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
