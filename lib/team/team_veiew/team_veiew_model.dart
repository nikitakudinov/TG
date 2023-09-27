import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/data_list/data_list_widget.dart';
import '/components/user_picker/user_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamVeiewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for userPicker component.
  late UserPickerModel userPickerModel;
  // Model for DataList component.
  late DataListModel dataListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userPickerModel = createModel(context, () => UserPickerModel());
    dataListModel = createModel(context, () => DataListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userPickerModel.dispose();
    dataListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
