import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RequestsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  MatchRecord? matchData;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TournamentRecord? tournamentData;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TeamRecord? matchWinerData;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? nextMatchDataFromRound1Pair1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? nextMatchDataFromRound1Pair2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? nextMatchDataFromRound1Pair3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? nextMatchDataFromRound1Pair4;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? nextMatchDataFromRound1Pair5;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? nextMatchDataFromRound1Pair6;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? nextMatchDataFromRound1Pair7;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MatchRecord? nextMatchDataFromRound1Pair8;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
