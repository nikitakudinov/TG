import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/country_picker/country_picker_widget.dart';
import '/components/image_uploader/image_uploader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ADDTeamModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for imageUploader component.
  late ImageUploaderModel imageUploaderModel;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for countryPicker component.
  late CountryPickerModel countryPickerModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamRecord? getOwnerData;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    imageUploaderModel = createModel(context, () => ImageUploaderModel());
    countryPickerModel = createModel(context, () => CountryPickerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    imageUploaderModel.dispose();
    textController1?.dispose();
    textController2?.dispose();
    countryPickerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
