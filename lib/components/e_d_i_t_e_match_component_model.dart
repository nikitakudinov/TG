import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EDITEMatchComponentModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool tournamentListVISIBILITY = false;

  DocumentReference? selectedTournamentRef;

  String selectedTournamentName = 'Не выбран';

  String? selectedSlotVALUE = '';

  bool teamsListVISIBILITY = false;

  DocumentReference? selectedTeam1PathVALUE;

  String? selectedTeam1NameVALUE = '';

  String? selectedTeam1TagVALUE = '';

  String? selectedTeam1LogotypeVALUE = 'false';

  String? selectedRoundVALUE = '';

  String? selectedPairVALUE = '';

  DocumentReference? selectedTeam2PathVALUE;

  String? selectedTeam2NameVALUE = '';

  String? selectedTeam2TagVALUE = '';

  String? selectedTeam2LogotypeVALUE = 'false';

  bool rival2ButtonVISIBILITY = true;

  bool teamsList1VISIBILITY = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in EDITE_match_component widget.
  MatchRecord? matchData;
  // Stores action output result for [Firestore Query - Query a collection] action in tournamentButton widget.
  List<TournamentRecord>? tournamentsList;
  // State field(s) for Round widget.
  String? roundValue;
  FormFieldController<String>? roundValueController;
  // State field(s) for Pair widget.
  String? pairValue;
  FormFieldController<String>? pairValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<TeamRecord>? tournamentMembersOnlyList;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<TeamRecord>? tournamentMembersOnlyList1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
