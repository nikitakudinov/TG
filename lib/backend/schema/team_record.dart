import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamRecord extends FirestoreRecord {
  TeamRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "logotype" field.
  String? _logotype;
  String get logotype => _logotype ?? '';
  bool hasLogotype() => _logotype != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "countryFlag" field.
  String? _countryFlag;
  String get countryFlag => _countryFlag ?? '';
  bool hasCountryFlag() => _countryFlag != null;

  // "countryName" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  bool hasCountryName() => _countryName != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "memberOfTournament" field.
  List<DocumentReference>? _memberOfTournament;
  List<DocumentReference> get memberOfTournament =>
      _memberOfTournament ?? const [];
  bool hasMemberOfTournament() => _memberOfTournament != null;

  void _initializeFields() {
    _logotype = snapshotData['logotype'] as String?;
    _name = snapshotData['name'] as String?;
    _tag = snapshotData['tag'] as String?;
    _countryFlag = snapshotData['countryFlag'] as String?;
    _countryName = snapshotData['countryName'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _members = getDataList(snapshotData['members']);
    _memberOfTournament = getDataList(snapshotData['memberOfTournament']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('team');

  static Stream<TeamRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeamRecord.fromSnapshot(s));

  static Future<TeamRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeamRecord.fromSnapshot(s));

  static TeamRecord fromSnapshot(DocumentSnapshot snapshot) => TeamRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeamRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeamRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeamRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeamRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeamRecordData({
  String? logotype,
  String? name,
  String? tag,
  String? countryFlag,
  String? countryName,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'logotype': logotype,
      'name': name,
      'tag': tag,
      'countryFlag': countryFlag,
      'countryName': countryName,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamRecordDocumentEquality implements Equality<TeamRecord> {
  const TeamRecordDocumentEquality();

  @override
  bool equals(TeamRecord? e1, TeamRecord? e2) {
    const listEquality = ListEquality();
    return e1?.logotype == e2?.logotype &&
        e1?.name == e2?.name &&
        e1?.tag == e2?.tag &&
        e1?.countryFlag == e2?.countryFlag &&
        e1?.countryName == e2?.countryName &&
        e1?.owner == e2?.owner &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.memberOfTournament, e2?.memberOfTournament);
  }

  @override
  int hash(TeamRecord? e) => const ListEquality().hash([
        e?.logotype,
        e?.name,
        e?.tag,
        e?.countryFlag,
        e?.countryName,
        e?.owner,
        e?.members,
        e?.memberOfTournament
      ]);

  @override
  bool isValidKey(Object? o) => o is TeamRecord;
}
