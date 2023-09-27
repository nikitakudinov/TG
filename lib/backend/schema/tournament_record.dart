import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TournamentRecord extends FirestoreRecord {
  TournamentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "OrganizatorsTeam" field.
  List<DocumentReference>? _organizatorsTeam;
  List<DocumentReference> get organizatorsTeam => _organizatorsTeam ?? const [];
  bool hasOrganizatorsTeam() => _organizatorsTeam != null;

  // "Members" field.
  List<TournamentMemberStruct>? _members;
  List<TournamentMemberStruct> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "Round1Matches" field.
  List<DocumentReference>? _round1Matches;
  List<DocumentReference> get round1Matches => _round1Matches ?? const [];
  bool hasRound1Matches() => _round1Matches != null;

  // "Round2Matches" field.
  List<DocumentReference>? _round2Matches;
  List<DocumentReference> get round2Matches => _round2Matches ?? const [];
  bool hasRound2Matches() => _round2Matches != null;

  // "Round3Matches" field.
  List<DocumentReference>? _round3Matches;
  List<DocumentReference> get round3Matches => _round3Matches ?? const [];
  bool hasRound3Matches() => _round3Matches != null;

  // "Round4Matches" field.
  List<DocumentReference>? _round4Matches;
  List<DocumentReference> get round4Matches => _round4Matches ?? const [];
  bool hasRound4Matches() => _round4Matches != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _owner = snapshotData['Owner'] as DocumentReference?;
    _organizatorsTeam = getDataList(snapshotData['OrganizatorsTeam']);
    _members = getStructList(
      snapshotData['Members'],
      TournamentMemberStruct.fromMap,
    );
    _round1Matches = getDataList(snapshotData['Round1Matches']);
    _round2Matches = getDataList(snapshotData['Round2Matches']);
    _round3Matches = getDataList(snapshotData['Round3Matches']);
    _round4Matches = getDataList(snapshotData['Round4Matches']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tournament');

  static Stream<TournamentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TournamentRecord.fromSnapshot(s));

  static Future<TournamentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TournamentRecord.fromSnapshot(s));

  static TournamentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TournamentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TournamentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TournamentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TournamentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TournamentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTournamentRecordData({
  String? name,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class TournamentRecordDocumentEquality implements Equality<TournamentRecord> {
  const TournamentRecordDocumentEquality();

  @override
  bool equals(TournamentRecord? e1, TournamentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.owner == e2?.owner &&
        listEquality.equals(e1?.organizatorsTeam, e2?.organizatorsTeam) &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.round1Matches, e2?.round1Matches) &&
        listEquality.equals(e1?.round2Matches, e2?.round2Matches) &&
        listEquality.equals(e1?.round3Matches, e2?.round3Matches) &&
        listEquality.equals(e1?.round4Matches, e2?.round4Matches);
  }

  @override
  int hash(TournamentRecord? e) => const ListEquality().hash([
        e?.name,
        e?.owner,
        e?.organizatorsTeam,
        e?.members,
        e?.round1Matches,
        e?.round2Matches,
        e?.round3Matches,
        e?.round4Matches
      ]);

  @override
  bool isValidKey(Object? o) => o is TournamentRecord;
}
