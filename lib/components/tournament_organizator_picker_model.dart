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

class TournamentOrganizatorPickerModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? selectedUserAvatarVALUE;

  String? selectedUserNicknameVALUE = 'Не выбран';

  String? selectedUserTeamTagVALUE = '';

  DocumentReference? selectedUserReferenceVALUE;

  bool messageVISIBILITY = false;

  bool searchFieldVISIBILITY = false;

  bool resultsListVISIBILITY = true;

  bool addUserButtonVISIBILITY = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UserRecord> simpleSearchResults = [];
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TournamentRecord? tournamentData;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
