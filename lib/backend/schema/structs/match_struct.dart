// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchStruct extends FFFirebaseStruct {
  MatchStruct({
    String? status,
    DocumentReference? gameForTournamentRef,
    String? gameForTournamentName,
    String? gameForTournamentRound,
    TournamentMemberStruct? rival1,
    String? rival1Wins,
    TournamentMemberStruct? rival2,
    String? rival2Wins,
    String? matchWinerName,
    DocumentReference? matchWiner,
    String? pair,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _gameForTournamentRef = gameForTournamentRef,
        _gameForTournamentName = gameForTournamentName,
        _gameForTournamentRound = gameForTournamentRound,
        _rival1 = rival1,
        _rival1Wins = rival1Wins,
        _rival2 = rival2,
        _rival2Wins = rival2Wins,
        _matchWinerName = matchWinerName,
        _matchWiner = matchWiner,
        _pair = pair,
        super(firestoreUtilData);

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "gameForTournamentRef" field.
  DocumentReference? _gameForTournamentRef;
  DocumentReference? get gameForTournamentRef => _gameForTournamentRef;
  set gameForTournamentRef(DocumentReference? val) =>
      _gameForTournamentRef = val;
  bool hasGameForTournamentRef() => _gameForTournamentRef != null;

  // "gameForTournamentName" field.
  String? _gameForTournamentName;
  String get gameForTournamentName => _gameForTournamentName ?? '';
  set gameForTournamentName(String? val) => _gameForTournamentName = val;
  bool hasGameForTournamentName() => _gameForTournamentName != null;

  // "gameForTournamentRound" field.
  String? _gameForTournamentRound;
  String get gameForTournamentRound => _gameForTournamentRound ?? '';
  set gameForTournamentRound(String? val) => _gameForTournamentRound = val;
  bool hasGameForTournamentRound() => _gameForTournamentRound != null;

  // "rival1" field.
  TournamentMemberStruct? _rival1;
  TournamentMemberStruct get rival1 => _rival1 ?? TournamentMemberStruct();
  set rival1(TournamentMemberStruct? val) => _rival1 = val;
  void updateRival1(Function(TournamentMemberStruct) updateFn) =>
      updateFn(_rival1 ??= TournamentMemberStruct());
  bool hasRival1() => _rival1 != null;

  // "rival1Wins" field.
  String? _rival1Wins;
  String get rival1Wins => _rival1Wins ?? '';
  set rival1Wins(String? val) => _rival1Wins = val;
  bool hasRival1Wins() => _rival1Wins != null;

  // "rival2" field.
  TournamentMemberStruct? _rival2;
  TournamentMemberStruct get rival2 => _rival2 ?? TournamentMemberStruct();
  set rival2(TournamentMemberStruct? val) => _rival2 = val;
  void updateRival2(Function(TournamentMemberStruct) updateFn) =>
      updateFn(_rival2 ??= TournamentMemberStruct());
  bool hasRival2() => _rival2 != null;

  // "rival2Wins" field.
  String? _rival2Wins;
  String get rival2Wins => _rival2Wins ?? '';
  set rival2Wins(String? val) => _rival2Wins = val;
  bool hasRival2Wins() => _rival2Wins != null;

  // "matchWinerName" field.
  String? _matchWinerName;
  String get matchWinerName => _matchWinerName ?? '';
  set matchWinerName(String? val) => _matchWinerName = val;
  bool hasMatchWinerName() => _matchWinerName != null;

  // "matchWiner" field.
  DocumentReference? _matchWiner;
  DocumentReference? get matchWiner => _matchWiner;
  set matchWiner(DocumentReference? val) => _matchWiner = val;
  bool hasMatchWiner() => _matchWiner != null;

  // "pair" field.
  String? _pair;
  String get pair => _pair ?? '';
  set pair(String? val) => _pair = val;
  bool hasPair() => _pair != null;

  static MatchStruct fromMap(Map<String, dynamic> data) => MatchStruct(
        status: data['status'] as String?,
        gameForTournamentRef:
            data['gameForTournamentRef'] as DocumentReference?,
        gameForTournamentName: data['gameForTournamentName'] as String?,
        gameForTournamentRound: data['gameForTournamentRound'] as String?,
        rival1: TournamentMemberStruct.maybeFromMap(data['rival1']),
        rival1Wins: data['rival1Wins'] as String?,
        rival2: TournamentMemberStruct.maybeFromMap(data['rival2']),
        rival2Wins: data['rival2Wins'] as String?,
        matchWinerName: data['matchWinerName'] as String?,
        matchWiner: data['matchWiner'] as DocumentReference?,
        pair: data['pair'] as String?,
      );

  static MatchStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MatchStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'gameForTournamentRef': _gameForTournamentRef,
        'gameForTournamentName': _gameForTournamentName,
        'gameForTournamentRound': _gameForTournamentRound,
        'rival1': _rival1?.toMap(),
        'rival1Wins': _rival1Wins,
        'rival2': _rival2?.toMap(),
        'rival2Wins': _rival2Wins,
        'matchWinerName': _matchWinerName,
        'matchWiner': _matchWiner,
        'pair': _pair,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'gameForTournamentRef': serializeParam(
          _gameForTournamentRef,
          ParamType.DocumentReference,
        ),
        'gameForTournamentName': serializeParam(
          _gameForTournamentName,
          ParamType.String,
        ),
        'gameForTournamentRound': serializeParam(
          _gameForTournamentRound,
          ParamType.String,
        ),
        'rival1': serializeParam(
          _rival1,
          ParamType.DataStruct,
        ),
        'rival1Wins': serializeParam(
          _rival1Wins,
          ParamType.String,
        ),
        'rival2': serializeParam(
          _rival2,
          ParamType.DataStruct,
        ),
        'rival2Wins': serializeParam(
          _rival2Wins,
          ParamType.String,
        ),
        'matchWinerName': serializeParam(
          _matchWinerName,
          ParamType.String,
        ),
        'matchWiner': serializeParam(
          _matchWiner,
          ParamType.DocumentReference,
        ),
        'pair': serializeParam(
          _pair,
          ParamType.String,
        ),
      }.withoutNulls;

  static MatchStruct fromSerializableMap(Map<String, dynamic> data) =>
      MatchStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        gameForTournamentRef: deserializeParam(
          data['gameForTournamentRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tournament'],
        ),
        gameForTournamentName: deserializeParam(
          data['gameForTournamentName'],
          ParamType.String,
          false,
        ),
        gameForTournamentRound: deserializeParam(
          data['gameForTournamentRound'],
          ParamType.String,
          false,
        ),
        rival1: deserializeStructParam(
          data['rival1'],
          ParamType.DataStruct,
          false,
          structBuilder: TournamentMemberStruct.fromSerializableMap,
        ),
        rival1Wins: deserializeParam(
          data['rival1Wins'],
          ParamType.String,
          false,
        ),
        rival2: deserializeStructParam(
          data['rival2'],
          ParamType.DataStruct,
          false,
          structBuilder: TournamentMemberStruct.fromSerializableMap,
        ),
        rival2Wins: deserializeParam(
          data['rival2Wins'],
          ParamType.String,
          false,
        ),
        matchWinerName: deserializeParam(
          data['matchWinerName'],
          ParamType.String,
          false,
        ),
        matchWiner: deserializeParam(
          data['matchWiner'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['team'],
        ),
        pair: deserializeParam(
          data['pair'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MatchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MatchStruct &&
        status == other.status &&
        gameForTournamentRef == other.gameForTournamentRef &&
        gameForTournamentName == other.gameForTournamentName &&
        gameForTournamentRound == other.gameForTournamentRound &&
        rival1 == other.rival1 &&
        rival1Wins == other.rival1Wins &&
        rival2 == other.rival2 &&
        rival2Wins == other.rival2Wins &&
        matchWinerName == other.matchWinerName &&
        matchWiner == other.matchWiner &&
        pair == other.pair;
  }

  @override
  int get hashCode => const ListEquality().hash([
        status,
        gameForTournamentRef,
        gameForTournamentName,
        gameForTournamentRound,
        rival1,
        rival1Wins,
        rival2,
        rival2Wins,
        matchWinerName,
        matchWiner,
        pair
      ]);
}

MatchStruct createMatchStruct({
  String? status,
  DocumentReference? gameForTournamentRef,
  String? gameForTournamentName,
  String? gameForTournamentRound,
  TournamentMemberStruct? rival1,
  String? rival1Wins,
  TournamentMemberStruct? rival2,
  String? rival2Wins,
  String? matchWinerName,
  DocumentReference? matchWiner,
  String? pair,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MatchStruct(
      status: status,
      gameForTournamentRef: gameForTournamentRef,
      gameForTournamentName: gameForTournamentName,
      gameForTournamentRound: gameForTournamentRound,
      rival1: rival1 ?? (clearUnsetFields ? TournamentMemberStruct() : null),
      rival1Wins: rival1Wins,
      rival2: rival2 ?? (clearUnsetFields ? TournamentMemberStruct() : null),
      rival2Wins: rival2Wins,
      matchWinerName: matchWinerName,
      matchWiner: matchWiner,
      pair: pair,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MatchStruct? updateMatchStruct(
  MatchStruct? match, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    match
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMatchStructData(
  Map<String, dynamic> firestoreData,
  MatchStruct? match,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (match == null) {
    return;
  }
  if (match.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && match.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final matchData = getMatchFirestoreData(match, forFieldValue);
  final nestedData = matchData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = match.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMatchFirestoreData(
  MatchStruct? match, [
  bool forFieldValue = false,
]) {
  if (match == null) {
    return {};
  }
  final firestoreData = mapToFirestore(match.toMap());

  // Handle nested data for "rival1" field.
  addTournamentMemberStructData(
    firestoreData,
    match.hasRival1() ? match.rival1 : null,
    'rival1',
    forFieldValue,
  );

  // Handle nested data for "rival2" field.
  addTournamentMemberStructData(
    firestoreData,
    match.hasRival2() ? match.rival2 : null,
    'rival2',
    forFieldValue,
  );

  // Add any Firestore field values
  match.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMatchListFirestoreData(
  List<MatchStruct>? matchs,
) =>
    matchs?.map((e) => getMatchFirestoreData(e, true)).toList() ?? [];
