// Core providers
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../network/api_client.dart';
import '../../network/network_info.dart';
import '../../services/cache_service.dart';

part 'app_global_providers.g.dart';

@riverpod
CacheService cacheService(Ref ref) {
  return CacheService();
}

@riverpod
NetworkInfo networkInfo(Ref ref) {
  return NetworkInfoImpl(Connectivity());
}

@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient(
    networkInfo: ref.read(networkInfoProvider),
    cacheService: ref.read(cacheServiceProvider),
  );
}

// Auth state providers
@riverpod
class AuthState extends _$AuthState {
  @override
  bool build() {
    return ref.read(cacheServiceProvider).getAuthToken() != null;
  }

  void login() {
    state = true;
  }

  void logout() {
    state = false;
  }
}