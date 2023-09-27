// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TournamentMemberStruct extends FFFirebaseStruct {
  TournamentMemberStruct({
    String? logotype,
    String? name,
    String? tag,
    String? country,
    String? flag,
    DocumentReference? teamReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _logotype = logotype,
        _name = name,
        _tag = tag,
        _country = country,
        _flag = flag,
        _teamReference = teamReference,
        super(firestoreUtilData);

  // "Logotype" field.
  String? _logotype;
  String get logotype => _logotype ?? '';
  set logotype(String? val) => _logotype = val;
  bool hasLogotype() => _logotype != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "Tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;
  bool hasTag() => _tag != null;

  // "Country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "Flag" field.
  String? _flag;
  String get flag => _flag ?? '';
  set flag(String? val) => _flag = val;
  bool hasFlag() => _flag != null;

  // "teamReference" field.
  DocumentReference? _teamReference;
  DocumentReference? get teamReference => _teamReference;
  set teamReference(DocumentReference? val) => _teamReference = val;
  bool hasTeamReference() => _teamReference != null;

  static TournamentMemberStruct fromMap(Map<String, dynamic> data) =>
      TournamentMemberStruct(
        logotype: data['Logotype'] as String?,
        name: data['Name'] as String?,
        tag: data['Tag'] as String?,
        country: data['Country'] as String?,
        flag: data['Flag'] as String?,
        teamReference: data['teamReference'] as DocumentReference?,
      );

  static TournamentMemberStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? TournamentMemberStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'Logotype': _logotype,
        'Name': _name,
        'Tag': _tag,
        'Country': _country,
        'Flag': _flag,
        'teamReference': _teamReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Logotype': serializeParam(
          _logotype,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'Country': serializeParam(
          _country,
          ParamType.String,
        ),
        'Flag': serializeParam(
          _flag,
          ParamType.String,
        ),
        'teamReference': serializeParam(
          _teamReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static TournamentMemberStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TournamentMemberStruct(
        logotype: deserializeParam(
          data['Logotype'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        tag: deserializeParam(
          data['Tag'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['Country'],
          ParamType.String,
          false,
        ),
        flag: deserializeParam(
          data['Flag'],
          ParamType.String,
          false,
        ),
        teamReference: deserializeParam(
          data['teamReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['team'],
        ),
      );

  @override
  String toString() => 'TournamentMemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TournamentMemberStruct &&
        logotype == other.logotype &&
        name == other.name &&
        tag == other.tag &&
        country == other.country &&
        flag == other.flag &&
        teamReference == other.teamReference;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([logotype, name, tag, country, flag, teamReference]);
}

TournamentMemberStruct createTournamentMemberStruct({
  String? logotype,
  String? name,
  String? tag,
  String? country,
  String? flag,
  DocumentReference? teamReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TournamentMemberStruct(
      logotype: logotype,
      name: name,
      tag: tag,
      country: country,
      flag: flag,
      teamReference: teamReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TournamentMemberStruct? updateTournamentMemberStruct(
  TournamentMemberStruct? tournamentMember, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tournamentMember
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTournamentMemberStructData(
  Map<String, dynamic> firestoreData,
  TournamentMemberStruct? tournamentMember,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tournamentMember == null) {
    return;
  }
  if (tournamentMember.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tournamentMember.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tournamentMemberData =
      getTournamentMemberFirestoreData(tournamentMember, forFieldValue);
  final nestedData =
      tournamentMemberData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tournamentMember.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTournamentMemberFirestoreData(
  TournamentMemberStruct? tournamentMember, [
  bool forFieldValue = false,
]) {
  if (tournamentMember == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tournamentMember.toMap());

  // Add any Firestore field values
  tournamentMember.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTournamentMemberListFirestoreData(
  List<TournamentMemberStruct>? tournamentMembers,
) =>
    tournamentMembers
        ?.map((e) => getTournamentMemberFirestoreData(e, true))
        .toList() ??
    [];
