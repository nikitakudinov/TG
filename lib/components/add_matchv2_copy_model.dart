import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMatchv2CopyModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool teamsListVISABILITY = false;

  int? selectedSlot;

  DocumentReference? selectedTeam1PathVALUE;

  String selectedTeam1NameVALUE = 'Не выбрано';

  String selectedTeam1TagVALUE = ' ';

  String? selectedTeam1LogotypeVALUE =
      'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33';

  DocumentReference? selectedTeam2PathVALUE;

  String selectedTeam2NameVALUE = 'Не выбрано';

  String selectedTeam2TagVALUE = ' ';

  String? selectedTeam2LogotypeVALUE =
      'https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/placeholders%2Fimage-7XR1sw6U%20-%20transformed%20(1).png?alt=media&token=c1d63316-916c-4452-8b4c-36ebb64dff33';

  bool rival1VISIBILITY = false;

  bool rival1resultsVISIBILITY = false;

  bool rival2VISIBILITY = false;

  bool rival2resultsVISIBILITY = false;

  DocumentReference? selectedTournamentPathVALUE;

  String? selectedTournamentNameVALUE;

  bool tournamentsListVISIBILITY = false;

  bool dateAndTimeVISIBILITY = true;

  bool rivalsAndResultsVISIBILITY = false;

  List<TournamentMemberStruct> selectedTeams = [];
  void addToSelectedTeams(TournamentMemberStruct item) =>
      selectedTeams.add(item);
  void removeFromSelectedTeams(TournamentMemberStruct item) =>
      selectedTeams.remove(item);
  void removeAtIndexFromSelectedTeams(int index) =>
      selectedTeams.removeAt(index);
  void updateSelectedTeamsAtIndex(
          int index, Function(TournamentMemberStruct) updateFn) =>
      selectedTeams[index] = updateFn(selectedTeams[index]);

  DocumentReference? selectedWinerPathVALUE;

  String? selectedWinerNameVALUE = '';

  String? selectedWinerTagVALUE = '';

  String selectedWinerLogotypeVALUE = 'false';

  bool matchWinerVISIBILITY = true;

  bool matchTeamsListVISIBILITY = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Round widget.
  String? roundValue;
  FormFieldController<String>? roundValueController;
  // State field(s) for Pair widget.
  String? pairValue;
  FormFieldController<String>? pairValueController;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in RivalsAndResults widget.
  MatchRecord? matchData;
  // Stores action output result for [Backend Call - Read Document] action in rival1 widget.
  TournamentRecord? tournamentsListStream;
  // Stores action output result for [Backend Call - Read Document] action in rival2 widget.
  TournamentRecord? tournamentsListStreamCopy;
  // State field(s) for Wins1 widget.
  String? wins1Value;
  FormFieldController<String>? wins1ValueController;
  // State field(s) for Wins2 widget.
  String? wins2Value;
  FormFieldController<String>? wins2ValueController;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TournamentRecord? selectedTournamentData;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? match;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
