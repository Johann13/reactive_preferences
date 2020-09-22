abstract class Pref {
  T getOnce<T>(String key, T defaultValue);

  Stream<T> get<T>(String key, T defaultValue);

  Stream<List<T>> getMultiple<T>(List<String> key, List<T> defaultValue);

  Future<bool> set<T>(String key, T value);

  Future<void> dispose();
}
