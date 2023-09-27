import '/components/add_matchv2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ADDMatchModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for addMatchv2 component.
  late AddMatchv2Model addMatchv2Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addMatchv2Model = createModel(context, () => AddMatchv2Model());
  }

  void dispose() {
    unfocusNode.dispose();
    addMatchv2Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
