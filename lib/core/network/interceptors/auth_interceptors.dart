// core/network/dio_interceptors.dart
import '../../services/cache_service.dart';
import '../../utils/logging.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final CacheService cacheService;

  AuthInterceptor(this.cacheService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Check if auth is required
    final requiresAuth = options.extra['requiresAuth'] ?? true;

    if (requiresAuth) {
      final token = cacheService.getAuthToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    Log.info('Request: ${options.method} ${options.uri}');
    Log.fine('Headers: ${options.headers}');

    super.onRequest(options, handler);

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.info('Response: ${response.statusCode} ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log.severe('Error: ${err.response?.statusCode} ${err.requestOptions.uri}', err);

    // Handle 401 Unauthorized
    if (err.response?.statusCode == 401) {
      cacheService.clearAuthToken();
      // You can trigger logout or token refresh here
    }

    super.onError(err, handler);
  }
}