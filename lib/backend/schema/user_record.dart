import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  bool hasAvatar() => _avatar != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  bool hasNickname() => _nickname != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "realName" field.
  String? _realName;
  String get realName => _realName ?? '';
  bool hasRealName() => _realName != null;

  // "countryFlag" field.
  String? _countryFlag;
  String get countryFlag => _countryFlag ?? '';
  bool hasCountryFlag() => _countryFlag != null;

  // "countryName" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  bool hasCountryName() => _countryName != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "ownerOfTeamPATH" field.
  DocumentReference? _ownerOfTeamPATH;
  DocumentReference? get ownerOfTeamPATH => _ownerOfTeamPATH;
  bool hasOwnerOfTeamPATH() => _ownerOfTeamPATH != null;

  // "memberOfTeamPATH" field.
  DocumentReference? _memberOfTeamPATH;
  DocumentReference? get memberOfTeamPATH => _memberOfTeamPATH;
  bool hasMemberOfTeamPATH() => _memberOfTeamPATH != null;

  // "memberOfTeamNAME" field.
  String? _memberOfTeamNAME;
  String get memberOfTeamNAME => _memberOfTeamNAME ?? '';
  bool hasMemberOfTeamNAME() => _memberOfTeamNAME != null;

  // "memberOfTeamTAG" field.
  String? _memberOfTeamTAG;
  String get memberOfTeamTAG => _memberOfTeamTAG ?? '';
  bool hasMemberOfTeamTAG() => _memberOfTeamTAG != null;

  // "memberOfTeamCOUNTRY_NAME" field.
  String? _memberOfTeamCOUNTRYNAME;
  String get memberOfTeamCOUNTRYNAME => _memberOfTeamCOUNTRYNAME ?? '';
  bool hasMemberOfTeamCOUNTRYNAME() => _memberOfTeamCOUNTRYNAME != null;

  // "memberOfTeamCOUNTRY_FLAG" field.
  String? _memberOfTeamCOUNTRYFLAG;
  String get memberOfTeamCOUNTRYFLAG => _memberOfTeamCOUNTRYFLAG ?? '';
  bool hasMemberOfTeamCOUNTRYFLAG() => _memberOfTeamCOUNTRYFLAG != null;

  // "memberOfTeamTeamRole" field.
  String? _memberOfTeamTeamRole;
  String get memberOfTeamTeamRole => _memberOfTeamTeamRole ?? '';
  bool hasMemberOfTeamTeamRole() => _memberOfTeamTeamRole != null;

  // "memberOfTeamLineUp" field.
  bool? _memberOfTeamLineUp;
  bool get memberOfTeamLineUp => _memberOfTeamLineUp ?? false;
  bool hasMemberOfTeamLineUp() => _memberOfTeamLineUp != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "alreadyCreatTeam" field.
  bool? _alreadyCreatTeam;
  bool get alreadyCreatTeam => _alreadyCreatTeam ?? false;
  bool hasAlreadyCreatTeam() => _alreadyCreatTeam != null;

  // "OwnerOfTournamentPath" field.
  List<DocumentReference>? _ownerOfTournamentPath;
  List<DocumentReference> get ownerOfTournamentPath =>
      _ownerOfTournamentPath ?? const [];
  bool hasOwnerOfTournamentPath() => _ownerOfTournamentPath != null;

  // "memberOfTheTournamentOrganizingTeam" field.
  List<DocumentReference>? _memberOfTheTournamentOrganizingTeam;
  List<DocumentReference> get memberOfTheTournamentOrganizingTeam =>
      _memberOfTheTournamentOrganizingTeam ?? const [];
  bool hasMemberOfTheTournamentOrganizingTeam() =>
      _memberOfTheTournamentOrganizingTeam != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _avatar = snapshotData['avatar'] as String?;
    _nickname = snapshotData['nickname'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _realName = snapshotData['realName'] as String?;
    _countryFlag = snapshotData['countryFlag'] as String?;
    _countryName = snapshotData['countryName'] as String?;
    _city = snapshotData['city'] as String?;
    _ownerOfTeamPATH = snapshotData['ownerOfTeamPATH'] as DocumentReference?;
    _memberOfTeamPATH = snapshotData['memberOfTeamPATH'] as DocumentReference?;
    _memberOfTeamNAME = snapshotData['memberOfTeamNAME'] as String?;
    _memberOfTeamTAG = snapshotData['memberOfTeamTAG'] as String?;
    _memberOfTeamCOUNTRYNAME =
        snapshotData['memberOfTeamCOUNTRY_NAME'] as String?;
    _memberOfTeamCOUNTRYFLAG =
        snapshotData['memberOfTeamCOUNTRY_FLAG'] as String?;
    _memberOfTeamTeamRole = snapshotData['memberOfTeamTeamRole'] as String?;
    _memberOfTeamLineUp = snapshotData['memberOfTeamLineUp'] as bool?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _alreadyCreatTeam = snapshotData['alreadyCreatTeam'] as bool?;
    _ownerOfTournamentPath = getDataList(snapshotData['OwnerOfTournamentPath']);
    _memberOfTheTournamentOrganizingTeam =
        getDataList(snapshotData['memberOfTheTournamentOrganizingTeam']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? uid,
  DateTime? createdTime,
  String? avatar,
  String? nickname,
  DateTime? birthday,
  String? realName,
  String? countryFlag,
  String? countryName,
  String? city,
  DocumentReference? ownerOfTeamPATH,
  DocumentReference? memberOfTeamPATH,
  String? memberOfTeamNAME,
  String? memberOfTeamTAG,
  String? memberOfTeamCOUNTRYNAME,
  String? memberOfTeamCOUNTRYFLAG,
  String? memberOfTeamTeamRole,
  bool? memberOfTeamLineUp,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  bool? alreadyCreatTeam,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'uid': uid,
      'created_time': createdTime,
      'avatar': avatar,
      'nickname': nickname,
      'birthday': birthday,
      'realName': realName,
      'countryFlag': countryFlag,
      'countryName': countryName,
      'city': city,
      'ownerOfTeamPATH': ownerOfTeamPATH,
      'memberOfTeamPATH': memberOfTeamPATH,
      'memberOfTeamNAME': memberOfTeamNAME,
      'memberOfTeamTAG': memberOfTeamTAG,
      'memberOfTeamCOUNTRY_NAME': memberOfTeamCOUNTRYNAME,
      'memberOfTeamCOUNTRY_FLAG': memberOfTeamCOUNTRYFLAG,
      'memberOfTeamTeamRole': memberOfTeamTeamRole,
      'memberOfTeamLineUp': memberOfTeamLineUp,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'alreadyCreatTeam': alreadyCreatTeam,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.avatar == e2?.avatar &&
        e1?.nickname == e2?.nickname &&
        e1?.birthday == e2?.birthday &&
        e1?.realName == e2?.realName &&
        e1?.countryFlag == e2?.countryFlag &&
        e1?.countryName == e2?.countryName &&
        e1?.city == e2?.city &&
        e1?.ownerOfTeamPATH == e2?.ownerOfTeamPATH &&
        e1?.memberOfTeamPATH == e2?.memberOfTeamPATH &&
        e1?.memberOfTeamNAME == e2?.memberOfTeamNAME &&
        e1?.memberOfTeamTAG == e2?.memberOfTeamTAG &&
        e1?.memberOfTeamCOUNTRYNAME == e2?.memberOfTeamCOUNTRYNAME &&
        e1?.memberOfTeamCOUNTRYFLAG == e2?.memberOfTeamCOUNTRYFLAG &&
        e1?.memberOfTeamTeamRole == e2?.memberOfTeamTeamRole &&
        e1?.memberOfTeamLineUp == e2?.memberOfTeamLineUp &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.alreadyCreatTeam == e2?.alreadyCreatTeam &&
        listEquality.equals(
            e1?.ownerOfTournamentPath, e2?.ownerOfTournamentPath) &&
        listEquality.equals(e1?.memberOfTheTournamentOrganizingTeam,
            e2?.memberOfTheTournamentOrganizingTeam);
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.uid,
        e?.createdTime,
        e?.avatar,
        e?.nickname,
        e?.birthday,
        e?.realName,
        e?.countryFlag,
        e?.countryName,
        e?.city,
        e?.ownerOfTeamPATH,
        e?.memberOfTeamPATH,
        e?.memberOfTeamNAME,
        e?.memberOfTeamTAG,
        e?.memberOfTeamCOUNTRYNAME,
        e?.memberOfTeamCOUNTRYFLAG,
        e?.memberOfTeamTeamRole,
        e?.memberOfTeamLineUp,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber,
        e?.alreadyCreatTeam,
        e?.ownerOfTournamentPath,
        e?.memberOfTheTournamentOrganizingTeam
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
