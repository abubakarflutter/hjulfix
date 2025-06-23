class CacheConstants {
  static const Duration cacheValidDuration = Duration(minutes: 5);
  static const String cacheBoxName = 'api_cache';
  static const String authBoxName = 'auth_storage';

  //----- keys
  static const String languageDBKey = 'selected_language';
  static const String isFirstLaunchKey = 'is_first_launch';
}
