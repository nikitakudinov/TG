// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TournamentRoundStruct extends FFFirebaseStruct {
  TournamentRoundStruct({
    int? numberOfRound,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _numberOfRound = numberOfRound,
        super(firestoreUtilData);

  // "numberOfRound" field.
  int? _numberOfRound;
  int get numberOfRound => _numberOfRound ?? 0;
  set numberOfRound(int? val) => _numberOfRound = val;
  void incrementNumberOfRound(int amount) =>
      _numberOfRound = numberOfRound + amount;
  bool hasNumberOfRound() => _numberOfRound != null;

  static TournamentRoundStruct fromMap(Map<String, dynamic> data) =>
      TournamentRoundStruct(
        numberOfRound: castToType<int>(data['numberOfRound']),
      );

  static TournamentRoundStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TournamentRoundStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'numberOfRound': _numberOfRound,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'numberOfRound': serializeParam(
          _numberOfRound,
          ParamType.int,
        ),
      }.withoutNulls;

  static TournamentRoundStruct fromSerializableMap(Map<String, dynamic> data) =>
      TournamentRoundStruct(
        numberOfRound: deserializeParam(
          data['numberOfRound'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TournamentRoundStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TournamentRoundStruct &&
        numberOfRound == other.numberOfRound;
  }

  @override
  int get hashCode => const ListEquality().hash([numberOfRound]);
}

TournamentRoundStruct createTournamentRoundStruct({
  int? numberOfRound,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TournamentRoundStruct(
      numberOfRound: numberOfRound,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TournamentRoundStruct? updateTournamentRoundStruct(
  TournamentRoundStruct? tournamentRound, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tournamentRound
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTournamentRoundStructData(
  Map<String, dynamic> firestoreData,
  TournamentRoundStruct? tournamentRound,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tournamentRound == null) {
    return;
  }
  if (tournamentRound.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tournamentRound.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tournamentRoundData =
      getTournamentRoundFirestoreData(tournamentRound, forFieldValue);
  final nestedData =
      tournamentRoundData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tournamentRound.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTournamentRoundFirestoreData(
  TournamentRoundStruct? tournamentRound, [
  bool forFieldValue = false,
]) {
  if (tournamentRound == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tournamentRound.toMap());

  // Add any Firestore field values
  tournamentRound.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTournamentRoundListFirestoreData(
  List<TournamentRoundStruct>? tournamentRounds,
) =>
    tournamentRounds
        ?.map((e) => getTournamentRoundFirestoreData(e, true))
        .toList() ??
    [];
