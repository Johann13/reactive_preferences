import 'package:reactive_preferences/prefs/pref.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencePref extends Pref {
  final SharedPreferences _preferences;
  final _BoolPref _boolPref;
  final _IntPref _intPref;
  final _DoublePref _doublePref;
  final _StringPref _stringPref;
  final _ListPref _listPref;

  SharedPreferencePref._(
    this._preferences,
    this._boolPref,
    this._intPref,
    this._doublePref,
    this._stringPref,
    this._listPref,
  );

  SharedPreferencePref(SharedPreferences preferences)
      : this._(
          preferences,
          _BoolPref(preferences),
          _IntPref(preferences),
          _DoublePref(preferences),
          _StringPref(preferences),
          _ListPref(preferences),
        );

  @override
  T getOnce<T>(String key, T defaultValue) {
    if (defaultValue is bool) {
      return _boolPref.getOnce(key, defaultValue) as T;
    } else if (defaultValue is int) {
      return _intPref.getOnce(key, defaultValue) as T;
    } else if (defaultValue is double) {
      return _doublePref.getOnce(key, defaultValue) as T;
    } else if (defaultValue is String) {
      return _stringPref.getOnce(key, defaultValue) as T;
    } else if (defaultValue is List<String>) {
      return _listPref.getOnce(key, defaultValue) as T;
    }
    throw Exception('No Implementation Found');
  }

  @override
  Stream<T> get<T>(String key, T defaultValue) {
    if (defaultValue is bool) {
      return _boolPref.get(key, defaultValue) as Stream<T>;
    } else if (defaultValue is int) {
      return _intPref.get(key, defaultValue) as Stream<T>;
    } else if (defaultValue is double) {
      return _doublePref.get(key, defaultValue) as Stream<T>;
    } else if (defaultValue is String) {
      return _stringPref.get(key, defaultValue) as Stream<T>;
    } else if (defaultValue is List<String>) {
      return _listPref.get(key, defaultValue) as Stream<T>;
    }
    throw Exception('No Implementation Found');
  }

  @override
  Stream<List<T>> getMultiple<T>(List<String> key, List<T> defaultValue) {
    if (defaultValue is List<bool>) {
      return _boolPref.getMultiple(key, defaultValue as List<bool>)
          as Stream<List<T>>;
    } else if (defaultValue is List<int>) {
      return _intPref.getMultiple(key, defaultValue as List<int>)
          as Stream<List<T>>;
    } else if (defaultValue is List<double>) {
      return _doublePref.getMultiple(key, defaultValue as List<double>)
          as Stream<List<T>>;
    } else if (defaultValue is List<String>) {
      return _stringPref.getMultiple(key, defaultValue as List<String>)
          as Stream<List<T>>;
    } else if (defaultValue is List<List<String>>) {
      return _listPref.getMultiple(key, defaultValue as List<List<String>>)
          as Stream<List<T>>;
    }
    throw Exception('No Implementation Found');
  }

  @override
  Future<bool> set<T>(String key, T value) {
    if (value is bool) {
      return _boolPref.set(key, value);
    } else if (value is int) {
      return _intPref.set(key, value);
    } else if (value is double) {
      return _doublePref.set(key, value);
    } else if (value is String) {
      return _stringPref.set(key, value);
    } else if (value is List<String>) {
      return _listPref.set(key, value);
    }
    return Future.value(false);
  }

  Future<bool> addToList(String key, String value) {
    return _listPref.addToList(key, value);
  }

  Future<bool> removeFromList(String key, String value) {
    return _listPref.removeFromList(key, value);
  }

  Future<bool> removeAt(String key, int pos) {
    return _listPref.removeAt(key, pos);
  }

  @override
  Future<void> dispose() async {
    await Future.wait([
      _boolPref.dispose(),
      _intPref.dispose(),
      _doublePref.dispose(),
      _stringPref.dispose(),
      _listPref.dispose(),
    ]);
  }

  @override
  Future<bool> remove(String key) async {
    return _preferences.remove(key).then((value) {
      _boolPref.remove(key);
      _intPref.remove(key);
      _doublePref.remove(key);
      _stringPref.remove(key);
      _listPref.remove(key);
      return true;
    }).catchError(() {
      return false;
    });
  }
}

class _BoolPref extends _SharedPreferencePref<bool> {
  _BoolPref(SharedPreferences preferences) : super(preferences);

  @override
  Future<bool> _set(String key, bool value) {
    return _preferences.setBool(key, value);
  }
}

class _IntPref extends _SharedPreferencePref<int> {
  _IntPref(SharedPreferences preferences) : super(preferences);

  @override
  Future<bool> _set(String key, int value) {
    return _preferences.setInt(key, value);
  }
}

class _DoublePref extends _SharedPreferencePref<double> {
  _DoublePref(SharedPreferences preferences) : super(preferences);

  @override
  Future<bool> _set(String key, double value) {
    return _preferences.setDouble(key, value);
  }
}

class _StringPref extends _SharedPreferencePref<String> {
  _StringPref(SharedPreferences preferences) : super(preferences);

  @override
  Future<bool> _set(String key, String value) {
    return _preferences.setString(key, value);
  }
}

class _ListPref extends _SharedPreferencePref<List<String>> {
  _ListPref(SharedPreferences preferences) : super(preferences);

  @override
  Future<bool> _set(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }

  Future<bool> addToList(String key, String value) {
    List<String> list = _preferences.getStringList(key) ?? [];
    list.add(value);
    return set(key, list);
  }

  Future<bool> removeFromList(String key, String value) {
    List<String> list = _preferences.getStringList(key) ?? [];
    list.remove(value);
    return set(key, list);
  }

  Future<bool> removeAt(String key, int pos) {
    List<String> list = _preferences.getStringList(key) ?? [];
    list.removeAt(pos);
    return set(key, list);
  }
}

abstract class _SharedPreferencePref<T> {
  final SharedPreferences _preferences;

  Map<String, BehaviorSubject<T>> _map = {};

  _SharedPreferencePref(this._preferences) {
    _init();
  }

  void _init() {
    for (String key in _preferences.getKeys()) {
      dynamic v = _preferences.get(key);
      if (v is T) {
        _map[key] = BehaviorSubject<T>.seeded(v);
      }
    }
  }

  void _checkCache(String key, T defaultValue) {
    if (!_map.containsKey(key)) {
      _map[key] =
          BehaviorSubject<T>.seeded(_preferences.get(key) as T ?? defaultValue);
    }
  }

  T getOnce(String key, T defaultValue) {
    _checkCache(key, defaultValue);
    return _map[key].value;
  }

  Stream<T> get(String key, T defaultValue) {
    _checkCache(key, defaultValue);
    return _map[key].asBroadcastStream();
  }

  Stream<List<T>> getMultiple(List<String> keys, List<T> defaultValues) {
    assert(keys.length == defaultValues.length);
    for (int i = 0; i < keys.length; i++) {
      _checkCache(keys[i], defaultValues[i]);
    }
    return CombineLatestStream.list([
      for (int i = 0; i < keys.length; i++) get(keys[i], defaultValues[i]),
    ]).asBroadcastStream();
  }

  Future<bool> _set(String key, T value);

  Future<bool> set(String key, T value) async {
    bool r = await _set(key, value);
    if (r) {
      if (_map.containsKey(key)) {
        _map[key].add(value);
      } else {
        _map[key] = BehaviorSubject.seeded(value);
      }
    }
    return r;
  }

  bool remove(String key) {
    _map.remove(key);
    return true;
  }

  Future<void> dispose() async {
    await Future.wait<dynamic>(_map.values.map(
      (s) => s.close(),
    ));
  }
}
