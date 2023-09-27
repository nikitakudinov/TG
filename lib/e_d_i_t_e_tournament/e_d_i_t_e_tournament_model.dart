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

class EDITETournamentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TournamentRecord? tournamentData;
  // Model for tournamentOrganizatorPicker component.
  late TournamentOrganizatorPickerModel tournamentOrganizatorPickerModel;
  // Model for tournamentOrganizatorsList component.
  late TournamentOrganizatorsListModel tournamentOrganizatorsListModel;
  // Model for tournamentMatchConfigurator component.
  late TournamentMatchConfiguratorModel tournamentMatchConfiguratorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tournamentOrganizatorPickerModel =
        createModel(context, () => TournamentOrganizatorPickerModel());
    tournamentOrganizatorsListModel =
        createModel(context, () => TournamentOrganizatorsListModel());
    tournamentMatchConfiguratorModel =
        createModel(context, () => TournamentMatchConfiguratorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
    tournamentOrganizatorPickerModel.dispose();
    tournamentOrganizatorsListModel.dispose();
    tournamentMatchConfiguratorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
