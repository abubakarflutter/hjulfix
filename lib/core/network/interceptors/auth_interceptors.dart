// core/network/dio_interceptors.dart
import '../../services/cache_service.dart';
import '../../utils/logging.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

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

    // Enhanced request logging
    Log.info('🚀 Request: ${options.method} ${options.uri}');
    Log.fine('📋 Headers: ${_formatJson(options.headers)}');

    // Log request body if present
    if (options.data != null) {
      Log.fine('📤 Request Body: ${_formatRequestData(options.data)}');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.info('✅ Response: ${response.statusCode} ${response.requestOptions.uri}');

    // Log response body for debugging (optional, remove in production)
    if (response.data != null) {
      Log.fine('📥 Response Body: ${_formatJson(response.data)}');
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode ?? 'Unknown';
    final uri = err.requestOptions.uri;

    Log.severe('❌ Error: $statusCode $uri');

    // Log detailed error information
    if (err.response?.data != null) {
      Log.severe('📥 Error Response Body: ${_formatJson(err.response!.data)}');

      // Extract and log specific error message if available
      final errorData = err.response!.data;
      if (errorData is Map<String, dynamic>) {
        final message = errorData['message'] ??
            errorData['error'] ??
            errorData['detail'] ??
            'No error message provided';
        Log.severe('💬 Error Message: $message');
      }
    }

    // Log request details that caused the error
    Log.severe('🔍 Failed Request Details:');
    Log.severe('   Method: ${err.requestOptions.method}');
    Log.severe('   URL: ${err.requestOptions.uri}');
    Log.severe('   Headers: ${_formatJson(err.requestOptions.headers)}');

    if (err.requestOptions.data != null) {
      Log.severe('   Request Body: ${_formatRequestData(err.requestOptions.data)}');
    }

    // Handle specific status codes
    switch (err.response?.statusCode) {
      case 401:
        Log.warning('🔐 Unauthorized - Clearing auth token');
        cacheService.clearAuthToken();
        // You can trigger logout or token refresh here
        break;
      case 403:
        Log.warning('🚫 Forbidden - Check credentials and permissions');
        break;
      case 422:
        Log.warning('📝 Validation Error - Check request format');
        break;
      case 500:
        Log.warning('🔥 Server Error - Backend issue');
        break;
    }

    super.onError(err, handler);
  }

  // Helper method to format JSON for logging
  String _formatJson(dynamic data) {
    try {
      if (data is String) return data;
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (e) {
      return data.toString();
    }
  }

  // Helper method to safely format request data
  String _formatRequestData(dynamic data) {
    try {
      if (data is FormData) {
        return 'FormData with ${data.fields.length} fields and ${data.files.length} files';
      }
      return _formatJson(data);
    } catch (e) {
      return data.toString();
    }
  }
}