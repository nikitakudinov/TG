import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/country_picker/country_picker_widget.dart';
import '/components/image_uploader/image_uploader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EDITEuserModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for imageUploader component.
  late ImageUploaderModel imageUploaderModel;
  // State field(s) for nickname widget.
  TextEditingController? nicknameController;
  String? Function(BuildContext, String?)? nicknameControllerValidator;
  // State field(s) for realname widget.
  TextEditingController? realnameController;
  String? Function(BuildContext, String?)? realnameControllerValidator;
  // Model for countryPicker component.
  late CountryPickerModel countryPickerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    imageUploaderModel = createModel(context, () => ImageUploaderModel());
    countryPickerModel = createModel(context, () => CountryPickerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    imageUploaderModel.dispose();
    nicknameController?.dispose();
    realnameController?.dispose();
    countryPickerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
