import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  final SharedPreferences _preferences;

  Map<String, BehaviorSubject<bool>> _mapBool = {};

  Map<String, BehaviorSubject<int>> _mapInt = {};
  Map<String, BehaviorSubject<double>> _mapDouble = {};

  Map<String, BehaviorSubject<String>> _mapString = {};

  Map<String, BehaviorSubject<List<String>>> _mapList = {};

  Pref(this._preferences) {
    _init();
  }

  void _init() {
    print('_init');
    for (String key in _preferences.getKeys()) {
      var v = _preferences.get(key);
      if (v == bool) {
        _mapBool[key] = BehaviorSubject<bool>.seeded(_preferences.get(key));
      } else if (v == int) {
        _mapInt[key] = BehaviorSubject<int>.seeded(_preferences.get(key));
      } else if (v == double) {
        _mapDouble[key] = BehaviorSubject<double>.seeded(_preferences.get(key));
      } else if (v == String) {
        _mapString[key] = BehaviorSubject<String>.seeded(_preferences.get(key));
      } else if (v == List) {
        _mapList[key] =
            BehaviorSubject<List<String>>.seeded(_preferences.get(key));
      }
    }
  }

  Future<bool> setValue(String prefKey, dynamic value) async {
    if (value == String) {
      return setString(prefKey, value);
    } else if (value == int) {
      return setInt(prefKey, value);
    } else if (value == double) {
      return setDouble(prefKey, value);
    } else if (value == bool) {
      return setBool(prefKey, value);
    }
    return false;
  }

  void _checkCache<T>(String key, T defaultValue) {
    if (T == bool) {
      if (!_mapBool.containsKey(key)) {
        print('add to _mapBool');
        _mapBool[key] =
            BehaviorSubject.seeded(_preferences.get(key) ?? defaultValue);
      }
    } else if (T == int) {
      if (!_mapInt.containsKey(key)) {
        print('add to _mapInt');
        _mapInt[key] =
            BehaviorSubject.seeded(_preferences.get(key) ?? defaultValue);
      }
    } else if (T == double) {
      if (!_mapDouble.containsKey(key)) {
        print('add to _mapDouble');
        _mapDouble[key] =
            BehaviorSubject.seeded(_preferences.get(key) ?? defaultValue);
      }
    } else if (T == String) {
      if (!_mapString.containsKey(key)) {
        print('add to _mapString');
        _mapString[key] =
            BehaviorSubject.seeded(_preferences.get(key) ?? defaultValue);
      }
    } else if (T == List) {
      if (!_mapList.containsKey(key)) {
        print('add to _mapList');
        _mapList[key] =
            BehaviorSubject.seeded(_preferences.get(key) ?? defaultValue);
      }
    }
  }

  getOnceBool(String key, bool defaultValue) {
    _checkCache<bool>(key, defaultValue);
    return _mapBool[key]?.value ?? defaultValue;
  }

  getOnceInt(String key, int defaultValue) {
    _checkCache<int>(key, defaultValue);
    return _mapInt[key]?.value ?? defaultValue;
  }

  getOnceDouble(String key, double defaultValue) {
    _checkCache<double>(key, defaultValue);
    return _mapDouble[key]?.value ?? defaultValue;
  }

  getOnceString(String key, String defaultValue) {
    _checkCache<String>(key, defaultValue);
    return _mapString[key]?.value ?? defaultValue;
  }

  getOnceList(String key, List<String> defaultValue) {
    _checkCache<List<String>>(key, defaultValue);
    return _mapList[key]?.value ?? defaultValue;
  }

  Stream<bool> getBool(String key, bool defaultValue) {
    _checkCache<bool>(key, defaultValue);
    return _mapBool[key].asBroadcastStream();
  }

  Stream<int> getInt(String key, int defaultValue) {
    _checkCache<int>(key, defaultValue);
    return _mapInt[key].asBroadcastStream();
  }

  Stream<double> getDouble(String key, double defaultValue) {
    _checkCache<double>(key, defaultValue);
    return _mapDouble[key].asBroadcastStream();
  }

  Stream<String> getString(String key, String defaultValue) {
    _checkCache<String>(key, defaultValue);
    return _mapString[key].asBroadcastStream();
  }

  Stream<List<String>> getList(String key, List<String> defaultValue) {
    _checkCache<List<String>>(key, defaultValue ?? []);
    return _mapList[key].asBroadcastStream();
  }

  Future<bool> setBool(String key, bool value) async {
    bool r = await _preferences.setBool(key, value);
    if (r) {
      if (_mapBool.containsKey(key)) {
        _mapBool[key].add(value);
      } else {
        _mapBool[key] = BehaviorSubject.seeded(value);
      }
    }
    return r;
  }

  Future<bool> setInt(String key, int value) async {
    bool r = await _preferences.setInt(key, value);
    if (r) {
      if (_mapInt.containsKey(key)) {
        _mapInt[key].add(value);
      } else {
        _mapInt[key] = BehaviorSubject.seeded(value);
      }
    }
    return r;
  }

  Future<bool> setDouble(String key, double value) async {
    bool r = await _preferences.setDouble(key, value);
    if (r) {
      if (_mapDouble.containsKey(key)) {
        _mapDouble[key].add(value);
      } else {
        _mapDouble[key] = BehaviorSubject.seeded(value);
      }
    }
    return r;
  }

  Future<bool> setString(String key, String value) async {
    bool r = await _preferences.setString(key, value);
    if (r) {
      if (_mapString.containsKey(key)) {
        _mapString[key].add(value);
      } else {
        _mapString[key] = BehaviorSubject.seeded(value);
      }
    }
    return r;
  }

  Future<bool> setList(String key, List<String> value) async {
    bool r = await _preferences.setStringList(key, value);
    if (r) {
      if (_mapList.containsKey(key)) {
        _mapList[key].add(value);
      } else {
        _mapList[key] = BehaviorSubject.seeded(value);
      }
    }
    return r;
  }

  Future<bool> addToList(String key, String value) {
    List<String> list = _preferences.getStringList(key) ?? [];
    list.add(value);
    return setList(key, list);
  }

  Future<bool> removeFromList(String key, String value) {
    List<String> list = _preferences.getStringList(key) ?? [];
    list.remove(value);
    return setList(key, list);
  }

  Future<void> dispose() async {
    await Future.wait(
      [
        ..._mapBool.values.map(
          (s) => s.close(),
        ),
        ..._mapInt.values.map(
          (s) => s.close(),
        ),
        ..._mapDouble.values.map(
          (s) => s.close(),
        ),
        ..._mapString.values.map(
          (s) => s.close(),
        ),
        ..._mapList.values.map(
          (s) => s.close(),
        ),
      ],
    );
  }
}
