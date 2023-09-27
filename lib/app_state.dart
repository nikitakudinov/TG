import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<CountryStruct> _Countries = [
    CountryStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Россия\",\"flag\":\"https://firebasestorage.googleapis.com/v0/b/pground-34b5a.appspot.com/o/flags%2Fru.png?alt=media&token=19d1eb4e-704d-4a20-b85a-cc9c1484aecf\"}'))
  ];
  List<CountryStruct> get Countries => _Countries;
  set Countries(List<CountryStruct> _value) {
    _Countries = _value;
  }

  void addToCountries(CountryStruct _value) {
    _Countries.add(_value);
  }

  void removeFromCountries(CountryStruct _value) {
    _Countries.remove(_value);
  }

  void removeAtIndexFromCountries(int _index) {
    _Countries.removeAt(_index);
  }

  void updateCountriesAtIndex(
    int _index,
    CountryStruct Function(CountryStruct) updateFn,
  ) {
    _Countries[_index] = updateFn(_Countries[_index]);
  }

  void insertAtIndexInCountries(int _index, CountryStruct _value) {
    _Countries.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
