/*
 * Copyright (c) 2022 Score Counter
 * 2020-2021 NaikSoftware, drstranges, MagTuxGit
 */

library resource_repository_storage;

/// Extend this class to implement your own CacheStorage.
abstract class CacheStorage<K, V> {
  /// Must return a future that completes after the storage is ready to be used.
  Future<dynamic> ensureInitialized();

  /// Clear all store.
  Future<void> clear();

  /// Get [CacheEntry] by key.
  Future<CacheEntry<V>?> get(K cacheKey);

  /// Put [data] by [cacheKey] with [storeTime] timestamp.
  Future<void> put(K cacheKey, V data, {int? storeTime});

  /// Delete cache by [cacheKey].
  Future<void> delete(K cacheKey);

  /// Returns a stream to listen all changes in the storage.
  Stream<List<V>> watch();

  /// Get all stored cache entries.
  Future<List<V>> getAll();
}

/// The unified model used by CacheStorage.
class CacheEntry<V> {
  /// Stored data.
  V data;

  /// Timestamp.
  int storeTime;

  /// Creates a new cache entry.
  CacheEntry(this.data, {required this.storeTime});
}
