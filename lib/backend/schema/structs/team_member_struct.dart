// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamMemberStruct extends FFFirebaseStruct {
  TeamMemberStruct({
    String? userAvatar,
    String? userNickname,
    String? userMemberOfTeamTAG,
    String? userMemberOfTeamTeamRole,
    bool? userMemberOfTeamLineUp,
    DocumentReference? userReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userAvatar = userAvatar,
        _userNickname = userNickname,
        _userMemberOfTeamTAG = userMemberOfTeamTAG,
        _userMemberOfTeamTeamRole = userMemberOfTeamTeamRole,
        _userMemberOfTeamLineUp = userMemberOfTeamLineUp,
        _userReference = userReference,
        super(firestoreUtilData);

  // "userAvatar" field.
  String? _userAvatar;
  String get userAvatar => _userAvatar ?? '';
  set userAvatar(String? val) => _userAvatar = val;
  bool hasUserAvatar() => _userAvatar != null;

  // "userNickname" field.
  String? _userNickname;
  String get userNickname => _userNickname ?? '';
  set userNickname(String? val) => _userNickname = val;
  bool hasUserNickname() => _userNickname != null;

  // "userMemberOfTeamTAG" field.
  String? _userMemberOfTeamTAG;
  String get userMemberOfTeamTAG => _userMemberOfTeamTAG ?? '';
  set userMemberOfTeamTAG(String? val) => _userMemberOfTeamTAG = val;
  bool hasUserMemberOfTeamTAG() => _userMemberOfTeamTAG != null;

  // "userMemberOfTeamTeamRole" field.
  String? _userMemberOfTeamTeamRole;
  String get userMemberOfTeamTeamRole => _userMemberOfTeamTeamRole ?? '';
  set userMemberOfTeamTeamRole(String? val) => _userMemberOfTeamTeamRole = val;
  bool hasUserMemberOfTeamTeamRole() => _userMemberOfTeamTeamRole != null;

  // "userMemberOfTeamLineUp" field.
  bool? _userMemberOfTeamLineUp;
  bool get userMemberOfTeamLineUp => _userMemberOfTeamLineUp ?? false;
  set userMemberOfTeamLineUp(bool? val) => _userMemberOfTeamLineUp = val;
  bool hasUserMemberOfTeamLineUp() => _userMemberOfTeamLineUp != null;

  // "userReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  set userReference(DocumentReference? val) => _userReference = val;
  bool hasUserReference() => _userReference != null;

  static TeamMemberStruct fromMap(Map<String, dynamic> data) =>
      TeamMemberStruct(
        userAvatar: data['userAvatar'] as String?,
        userNickname: data['userNickname'] as String?,
        userMemberOfTeamTAG: data['userMemberOfTeamTAG'] as String?,
        userMemberOfTeamTeamRole: data['userMemberOfTeamTeamRole'] as String?,
        userMemberOfTeamLineUp: data['userMemberOfTeamLineUp'] as bool?,
        userReference: data['userReference'] as DocumentReference?,
      );

  static TeamMemberStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TeamMemberStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'userAvatar': _userAvatar,
        'userNickname': _userNickname,
        'userMemberOfTeamTAG': _userMemberOfTeamTAG,
        'userMemberOfTeamTeamRole': _userMemberOfTeamTeamRole,
        'userMemberOfTeamLineUp': _userMemberOfTeamLineUp,
        'userReference': _userReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userAvatar': serializeParam(
          _userAvatar,
          ParamType.String,
        ),
        'userNickname': serializeParam(
          _userNickname,
          ParamType.String,
        ),
        'userMemberOfTeamTAG': serializeParam(
          _userMemberOfTeamTAG,
          ParamType.String,
        ),
        'userMemberOfTeamTeamRole': serializeParam(
          _userMemberOfTeamTeamRole,
          ParamType.String,
        ),
        'userMemberOfTeamLineUp': serializeParam(
          _userMemberOfTeamLineUp,
          ParamType.bool,
        ),
        'userReference': serializeParam(
          _userReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static TeamMemberStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamMemberStruct(
        userAvatar: deserializeParam(
          data['userAvatar'],
          ParamType.String,
          false,
        ),
        userNickname: deserializeParam(
          data['userNickname'],
          ParamType.String,
          false,
        ),
        userMemberOfTeamTAG: deserializeParam(
          data['userMemberOfTeamTAG'],
          ParamType.String,
          false,
        ),
        userMemberOfTeamTeamRole: deserializeParam(
          data['userMemberOfTeamTeamRole'],
          ParamType.String,
          false,
        ),
        userMemberOfTeamLineUp: deserializeParam(
          data['userMemberOfTeamLineUp'],
          ParamType.bool,
          false,
        ),
        userReference: deserializeParam(
          data['userReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
      );

  @override
  String toString() => 'TeamMemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeamMemberStruct &&
        userAvatar == other.userAvatar &&
        userNickname == other.userNickname &&
        userMemberOfTeamTAG == other.userMemberOfTeamTAG &&
        userMemberOfTeamTeamRole == other.userMemberOfTeamTeamRole &&
        userMemberOfTeamLineUp == other.userMemberOfTeamLineUp &&
        userReference == other.userReference;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userAvatar,
        userNickname,
        userMemberOfTeamTAG,
        userMemberOfTeamTeamRole,
        userMemberOfTeamLineUp,
        userReference
      ]);
}

TeamMemberStruct createTeamMemberStruct({
  String? userAvatar,
  String? userNickname,
  String? userMemberOfTeamTAG,
  String? userMemberOfTeamTeamRole,
  bool? userMemberOfTeamLineUp,
  DocumentReference? userReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeamMemberStruct(
      userAvatar: userAvatar,
      userNickname: userNickname,
      userMemberOfTeamTAG: userMemberOfTeamTAG,
      userMemberOfTeamTeamRole: userMemberOfTeamTeamRole,
      userMemberOfTeamLineUp: userMemberOfTeamLineUp,
      userReference: userReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TeamMemberStruct? updateTeamMemberStruct(
  TeamMemberStruct? teamMember, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    teamMember
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTeamMemberStructData(
  Map<String, dynamic> firestoreData,
  TeamMemberStruct? teamMember,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (teamMember == null) {
    return;
  }
  if (teamMember.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && teamMember.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final teamMemberData = getTeamMemberFirestoreData(teamMember, forFieldValue);
  final nestedData = teamMemberData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = teamMember.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTeamMemberFirestoreData(
  TeamMemberStruct? teamMember, [
  bool forFieldValue = false,
]) {
  if (teamMember == null) {
    return {};
  }
  final firestoreData = mapToFirestore(teamMember.toMap());

  // Add any Firestore field values
  teamMember.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTeamMemberListFirestoreData(
  List<TeamMemberStruct>? teamMembers,
) =>
    teamMembers?.map((e) => getTeamMemberFirestoreData(e, true)).toList() ?? [];
