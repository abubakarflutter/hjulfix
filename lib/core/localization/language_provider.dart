import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hjulfix_new/core/network/api_client.dart';

import '../services/cache_service.dart';
import 'language_notifier.dart';

final cacheServiceProvider = Provider<CacheService>((ref) {
  throw UnimplementedError('CacheService must be overridden');
});

final apiClientProvider = Provider<ApiClient>((ref) {
  throw UnimplementedError('API Client must be overridden');
});

final languageProvider = StateNotifierProvider<LanguageNotifier, String>((ref) {
  final cacheService = ref.watch(cacheServiceProvider);
  return LanguageNotifier(cacheService);
});
