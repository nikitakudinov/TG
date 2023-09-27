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

class AddMatchv2Model extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool rival1VISIBILITY = false;

  bool rival1resultsVISIBILITY = false;

  bool rival2VISIBILITY = false;

  bool rival2resultsVISIBILITY = false;

  DocumentReference? selectedTournamentPathVALUE;

  String? selectedTournamentNameVALUE;

  bool tournamentsListVISIBILITY = false;

  bool dateAndTimeVISIBILITY = true;

  bool rivalsAndResultsVISIBILITY = false;

  bool matchWinerVISIBILITY = true;

  bool matchTeamsListVISIBILITY = false;

  bool messageMatchAlreadyReportedVISIBILITY = false;

  bool messageTeamIsNotMemberOfMatchVISIBILITY = false;

  bool tournamentVISIBILITY = true;

  bool roundsVISIBILITY = false;

  bool pairsVISIBILITY = false;

  bool buttonsVISIBILITY = false;

  bool understandButtonVISIBILITY = false;

  bool sandReportButtonVISIBILITY = false;

  bool winsDISABLED = false;

  int? selectedWins1VALUE;

  int? selectedWins2VALUE;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Round widget.
  String? roundValue;
  FormFieldController<String>? roundValueController;
  // State field(s) for Pair widget.
  String? pairValue;
  FormFieldController<String>? pairValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Pair widget.
  MatchRecord? matchData;
  DateTime? datePicked;
  // State field(s) for Wins1 widget.
  String? wins1Value;
  FormFieldController<String>? wins1ValueController;
  // State field(s) for Wins2 widget.
  String? wins2Value;
  FormFieldController<String>? wins2ValueController;
  // Stores action output result for [Backend Call - Read Document] action in sandReportButton widget.
  TournamentRecord? tournamentData;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
