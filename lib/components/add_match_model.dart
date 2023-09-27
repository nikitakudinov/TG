import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMatchModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? selectedRival1TeamNameVALUE = 'Не выбран';

  String? selectedRival1TeamLogotypeVALUE;

  DocumentReference? selectedRival1TeamReferenceVALUE;

  bool rival1ListOfTeamsVISIBILITY = false;

  String selectedRival2TeamNameVALUE = 'Не выбран';

  String? selectedRival2TeamLogotypeVALUE = 'false';

  DocumentReference? selectedRival2TeamReferenceVALUE;

  bool rival2CartVISIBILITY = true;

  bool rival2ListOfTeamsVISIBILITY = false;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
