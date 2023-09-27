import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestRecord extends FirestoreRecord {
  RequestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "fromTeam" field.
  DocumentReference? _fromTeam;
  DocumentReference? get fromTeam => _fromTeam;
  bool hasFromTeam() => _fromTeam != null;

  // "toUser" field.
  DocumentReference? _toUser;
  DocumentReference? get toUser => _toUser;
  bool hasToUser() => _toUser != null;

  // "fromTeamName" field.
  String? _fromTeamName;
  String get fromTeamName => _fromTeamName ?? '';
  bool hasFromTeamName() => _fromTeamName != null;

  // "fromTeamTAG" field.
  String? _fromTeamTAG;
  String get fromTeamTAG => _fromTeamTAG ?? '';
  bool hasFromTeamTAG() => _fromTeamTAG != null;

  // "fromTournament" field.
  DocumentReference? _fromTournament;
  DocumentReference? get fromTournament => _fromTournament;
  bool hasFromTournament() => _fromTournament != null;

  // "fromTournamentName" field.
  String? _fromTournamentName;
  String get fromTournamentName => _fromTournamentName ?? '';
  bool hasFromTournamentName() => _fromTournamentName != null;

  // "fromTournamentTag" field.
  String? _fromTournamentTag;
  String get fromTournamentTag => _fromTournamentTag ?? '';
  bool hasFromTournamentTag() => _fromTournamentTag != null;

  // "toTournament" field.
  DocumentReference? _toTournament;
  DocumentReference? get toTournament => _toTournament;
  bool hasToTournament() => _toTournament != null;

  // "fromTeamCountry" field.
  String? _fromTeamCountry;
  String get fromTeamCountry => _fromTeamCountry ?? '';
  bool hasFromTeamCountry() => _fromTeamCountry != null;

  // "fromTeamFlag" field.
  String? _fromTeamFlag;
  String get fromTeamFlag => _fromTeamFlag ?? '';
  bool hasFromTeamFlag() => _fromTeamFlag != null;

  // "fromTeamLogotype" field.
  String? _fromTeamLogotype;
  String get fromTeamLogotype => _fromTeamLogotype ?? '';
  bool hasFromTeamLogotype() => _fromTeamLogotype != null;

  // "toTournamentOrganizators" field.
  List<DocumentReference>? _toTournamentOrganizators;
  List<DocumentReference> get toTournamentOrganizators =>
      _toTournamentOrganizators ?? const [];
  bool hasToTournamentOrganizators() => _toTournamentOrganizators != null;

  // "toTurnamentName" field.
  String? _toTurnamentName;
  String get toTurnamentName => _toTurnamentName ?? '';
  bool hasToTurnamentName() => _toTurnamentName != null;

  // "matchReference" field.
  DocumentReference? _matchReference;
  DocumentReference? get matchReference => _matchReference;
  bool hasMatchReference() => _matchReference != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _fromTeam = snapshotData['fromTeam'] as DocumentReference?;
    _toUser = snapshotData['toUser'] as DocumentReference?;
    _fromTeamName = snapshotData['fromTeamName'] as String?;
    _fromTeamTAG = snapshotData['fromTeamTAG'] as String?;
    _fromTournament = snapshotData['fromTournament'] as DocumentReference?;
    _fromTournamentName = snapshotData['fromTournamentName'] as String?;
    _fromTournamentTag = snapshotData['fromTournamentTag'] as String?;
    _toTournament = snapshotData['toTournament'] as DocumentReference?;
    _fromTeamCountry = snapshotData['fromTeamCountry'] as String?;
    _fromTeamFlag = snapshotData['fromTeamFlag'] as String?;
    _fromTeamLogotype = snapshotData['fromTeamLogotype'] as String?;
    _toTournamentOrganizators =
        getDataList(snapshotData['toTournamentOrganizators']);
    _toTurnamentName = snapshotData['toTurnamentName'] as String?;
    _matchReference = snapshotData['matchReference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('request');

  static Stream<RequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestRecord.fromSnapshot(s));

  static Future<RequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestRecord.fromSnapshot(s));

  static RequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestRecordData({
  String? type,
  DocumentReference? fromTeam,
  DocumentReference? toUser,
  String? fromTeamName,
  String? fromTeamTAG,
  DocumentReference? fromTournament,
  String? fromTournamentName,
  String? fromTournamentTag,
  DocumentReference? toTournament,
  String? fromTeamCountry,
  String? fromTeamFlag,
  String? fromTeamLogotype,
  String? toTurnamentName,
  DocumentReference? matchReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'fromTeam': fromTeam,
      'toUser': toUser,
      'fromTeamName': fromTeamName,
      'fromTeamTAG': fromTeamTAG,
      'fromTournament': fromTournament,
      'fromTournamentName': fromTournamentName,
      'fromTournamentTag': fromTournamentTag,
      'toTournament': toTournament,
      'fromTeamCountry': fromTeamCountry,
      'fromTeamFlag': fromTeamFlag,
      'fromTeamLogotype': fromTeamLogotype,
      'toTurnamentName': toTurnamentName,
      'matchReference': matchReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestRecordDocumentEquality implements Equality<RequestRecord> {
  const RequestRecordDocumentEquality();

  @override
  bool equals(RequestRecord? e1, RequestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.type == e2?.type &&
        e1?.fromTeam == e2?.fromTeam &&
        e1?.toUser == e2?.toUser &&
        e1?.fromTeamName == e2?.fromTeamName &&
        e1?.fromTeamTAG == e2?.fromTeamTAG &&
        e1?.fromTournament == e2?.fromTournament &&
        e1?.fromTournamentName == e2?.fromTournamentName &&
        e1?.fromTournamentTag == e2?.fromTournamentTag &&
        e1?.toTournament == e2?.toTournament &&
        e1?.fromTeamCountry == e2?.fromTeamCountry &&
        e1?.fromTeamFlag == e2?.fromTeamFlag &&
        e1?.fromTeamLogotype == e2?.fromTeamLogotype &&
        listEquality.equals(
            e1?.toTournamentOrganizators, e2?.toTournamentOrganizators) &&
        e1?.toTurnamentName == e2?.toTurnamentName &&
        e1?.matchReference == e2?.matchReference;
  }

  @override
  int hash(RequestRecord? e) => const ListEquality().hash([
        e?.type,
        e?.fromTeam,
        e?.toUser,
        e?.fromTeamName,
        e?.fromTeamTAG,
        e?.fromTournament,
        e?.fromTournamentName,
        e?.fromTournamentTag,
        e?.toTournament,
        e?.fromTeamCountry,
        e?.fromTeamFlag,
        e?.fromTeamLogotype,
        e?.toTournamentOrganizators,
        e?.toTurnamentName,
        e?.matchReference
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestRecord;
}
