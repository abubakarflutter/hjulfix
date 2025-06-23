import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart'; // Add this import

import '../../../../core/constants/api_constants.dart';
import '../../../../core/localization/language_provider.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/services/cache_service.dart';
import '../models/auth_model.dart';

part 'auth_repo.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(
    apiClient: ref.read(apiClientProvider),
    cacheService: ref.read(cacheServiceProvider),
  );
}

class AuthRepository {
  final ApiClient apiClient;
  final CacheService cacheService;

  AuthRepository({required this.apiClient, required this.cacheService});

  Future<ApiResult<AuthModel>> login({
    required String email,
    required String password,
  }) async {
    final request = ApiRequest(
      endpoint: ApiConstants.login,
      method: HttpMethod.post,
      data: {'email': email, 'password': password},
      requiresAuth: false,
    );

    final result = await apiClient.request<AuthModel>(
      request,
      fromJson: (data) => AuthModel.fromJson(data),
    );

    return result.fold((failure) => left(failure), (response) async {
      if (response.success && response.data != null) {
        // Save token and user data
        await cacheService.saveAuthToken(response.data?.token ?? "");
        await cacheService.saveUserData(response.data!.userData!.toJson());
        return right(response.data!);
      }
      return left(ServerFailure(response.message ?? 'Login failed'));
    });
  }

  // Future<ApiResult<String>> logout() async {
  //   final request = ApiRequestBuilder.logout();
  //
  //   final result = await apiClient.request<String>(request);
  //
  //   return result.fold((failure) => left(failure), (response) async {
  //     // Clear local data
  //     await cacheService.clearAuthToken();
  //     await cacheService.clearCache();
  //     return right(response.data ?? 'Logged out successfully');
  //   });
  // }

  UserData? getCurrentUser() {
    final userData = cacheService.getUserData();
    if (userData != null) {
      return UserData.fromJson(userData);
    }
    return null;
  }

  bool isLoggedIn() {
    return cacheService.getAuthToken() != null;
  }
}
