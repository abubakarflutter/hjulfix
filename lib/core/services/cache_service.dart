// core/cache/cache_service.dart
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/cache_constants.dart';

class CacheService {

  late Box _cacheBox;
  late Box _authBox;

  Future<void> init() async {
    await Hive.initFlutter();
    _cacheBox = await Hive.openBox(CacheConstants.cacheBoxName);
    _authBox = await Hive.openBox(CacheConstants.authBoxName);
  }

  // Cache API responses
  Future<void> cacheResponse(String key, dynamic data, {Duration? timeout}) async {
    final cacheData = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'timeout': timeout?.inMilliseconds,
    };
    await _cacheBox.put(key, jsonEncode(cacheData));
  }

  // Get cached response
  T? getCachedResponse<T>(String key) {
    try {
      final cachedString = _cacheBox.get(key);
      if (cachedString == null) return null;

      final cached = jsonDecode(cachedString);
      final timestamp = cached['timestamp'] as int;
      final timeout = cached['timeout'] as int?;

      if (timeout != null) {
        final expiryTime = DateTime.fromMillisecondsSinceEpoch(timestamp)
            .add(Duration(milliseconds: timeout));
        if (DateTime.now().isAfter(expiryTime)) {
          _cacheBox.delete(key);
          return null;
        }
      }

      return cached['data'] as T?;
    } catch (e) {
      return null;
    }
  }

  // Auth token management
  Future<void> saveAuthToken(String token) async {
    await _authBox.put('auth_token', token);
  }

  String? getAuthToken() {
    return _authBox.get('auth_token');
  }

  Future<void> clearAuthToken() async {
    await _authBox.delete('auth_token');
  }

  // Clear all cache
  Future<void> clearCache() async {
    await _cacheBox.clear();
  }

  // Clear specific cache
  Future<void> clearCacheByKey(String key) async {
    await _cacheBox.delete(key);
  }

  // Save user data
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    await _authBox.put('user_data', jsonEncode(userData));
  }

  Map<String, dynamic>? getUserData() {
    try {
      final userData = _authBox.get('user_data');
      if (userData == null) return null;
      return jsonDecode(userData) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }
}