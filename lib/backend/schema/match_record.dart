import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchRecord extends FirestoreRecord {
  MatchRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "gameForTournamentRef" field.
  DocumentReference? _gameForTournamentRef;
  DocumentReference? get gameForTournamentRef => _gameForTournamentRef;
  bool hasGameForTournamentRef() => _gameForTournamentRef != null;

  // "gameForTournamentName" field.
  String? _gameForTournamentName;
  String get gameForTournamentName => _gameForTournamentName ?? '';
  bool hasGameForTournamentName() => _gameForTournamentName != null;

  // "rival1" field.
  TournamentMemberStruct? _rival1;
  TournamentMemberStruct get rival1 => _rival1 ?? TournamentMemberStruct();
  bool hasRival1() => _rival1 != null;

  // "rival2" field.
  TournamentMemberStruct? _rival2;
  TournamentMemberStruct get rival2 => _rival2 ?? TournamentMemberStruct();
  bool hasRival2() => _rival2 != null;

  // "matchWinerName" field.
  String? _matchWinerName;
  String get matchWinerName => _matchWinerName ?? '';
  bool hasMatchWinerName() => _matchWinerName != null;

  // "matchWiner" field.
  DocumentReference? _matchWiner;
  DocumentReference? get matchWiner => _matchWiner;
  bool hasMatchWiner() => _matchWiner != null;

  // "gameForTournamentRound" field.
  String? _gameForTournamentRound;
  String get gameForTournamentRound => _gameForTournamentRound ?? '';
  bool hasGameForTournamentRound() => _gameForTournamentRound != null;

  // "rival1Wins" field.
  String? _rival1Wins;
  String get rival1Wins => _rival1Wins ?? '';
  bool hasRival1Wins() => _rival1Wins != null;

  // "rival2Wins" field.
  String? _rival2Wins;
  String get rival2Wins => _rival2Wins ?? '';
  bool hasRival2Wins() => _rival2Wins != null;

  // "pair" field.
  String? _pair;
  String get pair => _pair ?? '';
  bool hasPair() => _pair != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _gameForTournamentRef =
        snapshotData['gameForTournamentRef'] as DocumentReference?;
    _gameForTournamentName = snapshotData['gameForTournamentName'] as String?;
    _rival1 = TournamentMemberStruct.maybeFromMap(snapshotData['rival1']);
    _rival2 = TournamentMemberStruct.maybeFromMap(snapshotData['rival2']);
    _matchWinerName = snapshotData['matchWinerName'] as String?;
    _matchWiner = snapshotData['matchWiner'] as DocumentReference?;
    _gameForTournamentRound = snapshotData['gameForTournamentRound'] as String?;
    _rival1Wins = snapshotData['rival1Wins'] as String?;
    _rival2Wins = snapshotData['rival2Wins'] as String?;
    _pair = snapshotData['pair'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('match');

  static Stream<MatchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchRecord.fromSnapshot(s));

  static Future<MatchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchRecord.fromSnapshot(s));

  static MatchRecord fromSnapshot(DocumentSnapshot snapshot) => MatchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchRecordData({
  String? status,
  DocumentReference? gameForTournamentRef,
  String? gameForTournamentName,
  TournamentMemberStruct? rival1,
  TournamentMemberStruct? rival2,
  String? matchWinerName,
  DocumentReference? matchWiner,
  String? gameForTournamentRound,
  String? rival1Wins,
  String? rival2Wins,
  String? pair,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'gameForTournamentRef': gameForTournamentRef,
      'gameForTournamentName': gameForTournamentName,
      'rival1': TournamentMemberStruct().toMap(),
      'rival2': TournamentMemberStruct().toMap(),
      'matchWinerName': matchWinerName,
      'matchWiner': matchWiner,
      'gameForTournamentRound': gameForTournamentRound,
      'rival1Wins': rival1Wins,
      'rival2Wins': rival2Wins,
      'pair': pair,
    }.withoutNulls,
  );

  // Handle nested data for "rival1" field.
  addTournamentMemberStructData(firestoreData, rival1, 'rival1');

  // Handle nested data for "rival2" field.
  addTournamentMemberStructData(firestoreData, rival2, 'rival2');

  return firestoreData;
}

class MatchRecordDocumentEquality implements Equality<MatchRecord> {
  const MatchRecordDocumentEquality();

  @override
  bool equals(MatchRecord? e1, MatchRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.gameForTournamentRef == e2?.gameForTournamentRef &&
        e1?.gameForTournamentName == e2?.gameForTournamentName &&
        e1?.rival1 == e2?.rival1 &&
        e1?.rival2 == e2?.rival2 &&
        e1?.matchWinerName == e2?.matchWinerName &&
        e1?.matchWiner == e2?.matchWiner &&
        e1?.gameForTournamentRound == e2?.gameForTournamentRound &&
        e1?.rival1Wins == e2?.rival1Wins &&
        e1?.rival2Wins == e2?.rival2Wins &&
        e1?.pair == e2?.pair;
  }

  @override
  int hash(MatchRecord? e) => const ListEquality().hash([
        e?.status,
        e?.gameForTournamentRef,
        e?.gameForTournamentName,
        e?.rival1,
        e?.rival2,
        e?.matchWinerName,
        e?.matchWiner,
        e?.gameForTournamentRound,
        e?.rival1Wins,
        e?.rival2Wins,
        e?.pair
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchRecord;
}
