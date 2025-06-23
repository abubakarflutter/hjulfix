// Core providers
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../network/network_info.dart';
import '../../services/cache_service.dart';

part 'app_global_providers.g.dart';

@riverpod
CacheService cacheService(CacheServiceRef ref) {
  return CacheService();
}

@riverpod
NetworkInfo networkInfo(NetworkInfoRef ref) {
  return NetworkInfoImpl(Connectivity());
}

@riverpod
ApiClient apiClient(ApiClientRef ref) {
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
