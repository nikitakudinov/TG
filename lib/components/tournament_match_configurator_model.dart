import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TournamentMatchConfiguratorModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? selectedSlotVALUE = '';

  DocumentReference? selectedTeam1PathVALUE;

  String? selectedTeam1NameVALUE = '';

  String? selectedTeam1TagVALUE = '';

  String selectedTeam1LogotypeVALUE = 'false';

  DocumentReference? selectedTeam2PathVALUE;

  String? selectedTeam2NameVALUE = '';

  String? selectedTeam2TagVALUE = '';

  String selectedTeam2LogotypeVALUE = 'false';

  bool rival1BUTTONVISIBILITY = false;

  bool riva21BUTTONVISIBILITY = false;

  bool teamsLISTVISIBILITY = false;

  bool roundAndPairVISIBILITY = false;

  String? selectedPairVALUE = '';

  DocumentReference? selectedMatchReference;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair1Round1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair2Round1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair3Round1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair4Round1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair5Round1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair6Round1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair7Round1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair8Round1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair1Round2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair2Round2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair3Round2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair4Round2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair1Round3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair2Round3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? matchDataOfPair1Round4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
