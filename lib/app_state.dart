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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isLoggedIn = prefs.getBool('ff_isLoggedIn') ?? _isLoggedIn;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_departmentAppState')) {
        try {
          final serializedData =
              prefs.getString('ff_departmentAppState') ?? '{}';
          _departmentAppState =
              DepartmentStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool _value) {
    _isLoggedIn = _value;
    prefs.setBool('ff_isLoggedIn', _value);
  }

  DepartmentStruct _departmentAppState = DepartmentStruct();
  DepartmentStruct get departmentAppState => _departmentAppState;
  set departmentAppState(DepartmentStruct _value) {
    _departmentAppState = _value;
    prefs.setString('ff_departmentAppState', _value.serialize());
  }

  void updateDepartmentAppStateStruct(Function(DepartmentStruct) updateFn) {
    updateFn(_departmentAppState);
    prefs.setString('ff_departmentAppState', _departmentAppState.serialize());
  }
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
