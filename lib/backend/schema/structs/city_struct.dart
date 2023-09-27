// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CityStruct extends FFFirebaseStruct {
  CityStruct({
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static CityStruct fromMap(Map<String, dynamic> data) => CityStruct(
        name: data['Name'] as String?,
      );

  static CityStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CityStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static CityStruct fromSerializableMap(Map<String, dynamic> data) =>
      CityStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CityStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

CityStruct createCityStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CityStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CityStruct? updateCityStruct(
  CityStruct? city, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    city
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCityStructData(
  Map<String, dynamic> firestoreData,
  CityStruct? city,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (city == null) {
    return;
  }
  if (city.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && city.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cityData = getCityFirestoreData(city, forFieldValue);
  final nestedData = cityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = city.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCityFirestoreData(
  CityStruct? city, [
  bool forFieldValue = false,
]) {
  if (city == null) {
    return {};
  }
  final firestoreData = mapToFirestore(city.toMap());

  // Add any Firestore field values
  city.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCityListFirestoreData(
  List<CityStruct>? citys,
) =>
    citys?.map((e) => getCityFirestoreData(e, true)).toList() ?? [];
