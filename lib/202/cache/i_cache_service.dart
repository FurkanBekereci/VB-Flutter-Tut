abstract class ICacheService {
  Future<Map<String, dynamic>> readAllValues();
  Future<bool> removeAllValues();
  Future<bool> removeValue(CacheKeys key);
  Future<bool> setValue<T>(CacheKeys key, T value);
  Future<T?> getValue<T>(CacheKeys key);
}

enum CacheKeys {
  none,
  value,
  string,
  user,
}
