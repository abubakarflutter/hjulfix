// core/network/api_client.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../constants/api_constants.dart';
import '../constants/cache_constants.dart';
import '../services/cache_service.dart';
import 'api_response.dart';
import 'interceptors/auth_interceptors.dart';
import 'interceptors/retry_interceptor.dart';
import 'network_info.dart';
import '../utils/logging.dart';

class ApiClient {
  late Dio _dio;
  final NetworkInfo networkInfo;
  final CacheService cacheService;

  // Base URL - you can make this configurable
  static String baseUrl = ApiConstants.baseUrl;

  ApiClient({
    required this.networkInfo,
    required this.cacheService,
  }) {
    _initializeDio();
  }

  void _initializeDio() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout:  ApiConstants.connectionTimeout,
      receiveTimeout:  ApiConstants.receiveTimeout,
      sendTimeout:  ApiConstants.sendTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptors
    _dio.interceptors.addAll([
      AuthInterceptor(cacheService),
      RetryInterceptor(),
    ]);
  }

  // Main API call method
  Future<ApiResponseResult<T>> request<T>(
      ApiRequest apiRequest, {
        T Function(dynamic)? fromJson,
      }) async {
    try {
      // Check network connectivity
      if (!await networkInfo.isConnected) {
        // Try to get from services if available
        if (apiRequest.useCache && apiRequest.method == HttpMethod.get) {
          final cachedData = _getCachedData<T>(apiRequest.endpoint, fromJson);
          if (cachedData != null) {
            Log.info('Returning cached data for ${apiRequest.endpoint}');
            return right(ApiResponse.success(cachedData, message: 'Data from services'));
          }
        }
        return left(const ConnectionFailure('No internet connection'));
      }

      // Check services first for GET requests
      if (apiRequest.useCache &&
          apiRequest.method == HttpMethod.get) {
        final cachedData = _getCachedData<T>(apiRequest.endpoint, fromJson);
        if (cachedData != null) {
          Log.info('Returning cached data for ${apiRequest.endpoint}');
          return right(ApiResponse.success(cachedData, message: 'Data from services'));
        }
      }

      // Prepare request options
      final options = Options(
        method: _getHttpMethod(apiRequest.method),
        headers: apiRequest.headers,
        extra: {
          'requiresAuth': apiRequest.requiresAuth,
        },
      );

      // Make the actual request
      final Response response = await _makeRequest(apiRequest, options);

      // Handle successful response
      final result = _handleSuccessResponse<T>(response, fromJson);

      // Cache the response if needed
      if (apiRequest.useCache &&
          apiRequest.method == HttpMethod.get &&
          result.isRight()) {
        await _cacheResponse(
          apiRequest.endpoint,
          response.data,
          timeout: apiRequest.cacheTimeout,
        );
      }

      return result;

    } on DioException catch (e) {
      Log.severe('Dio Exception: ${e.message}', e);
      return left(_handleDioError(e));
    } catch (e) {
      Log.severe('Unknown error: $e', e);
      return left(UnknownFailure('An unexpected error occurred: $e'));
    }
  }

  Future<Response> _makeRequest(ApiRequest apiRequest, Options options) async {
    switch (apiRequest.method) {
      case HttpMethod.get:
        return await _dio.get(
          apiRequest.endpoint,
          queryParameters: apiRequest.data,
          options: options,
        );
      case HttpMethod.post:
        return await _dio.post(
          apiRequest.endpoint,
          data: _prepareRequestData(apiRequest),
          options: options,
        );
      case HttpMethod.put:
        return await _dio.put(
          apiRequest.endpoint,
          data: _prepareRequestData(apiRequest),
          options: options,
        );
      case HttpMethod.patch:
        return await _dio.patch(
          apiRequest.endpoint,
          data: _prepareRequestData(apiRequest),
          options: options,
        );
      case HttpMethod.delete:
        return await _dio.delete(
          apiRequest.endpoint,
          data: apiRequest.data,
          options: options,
        );
    }
  }

  dynamic _prepareRequestData(ApiRequest apiRequest) {
    if (apiRequest.formData != null) {
      final formData = FormData();

      apiRequest.formData!.forEach((key, value) {
        if (value is File) {
          formData.files.add(MapEntry(
            key,
            MultipartFile.fromFileSync(
              value.path,
              filename: value.path.split('/').last,
            ),
          ));
        } else if (value is List<File>) {
          for (var file in value) {
            formData.files.add(MapEntry(
              key,
              MultipartFile.fromFileSync(
                file.path,
                filename: file.path.split('/').last,
              ),
            ));
          }
        } else {
          formData.fields.add(MapEntry(key, value.toString()));
        }
      });

      return formData;
    }

    return apiRequest.data;
  }

  ApiResponseResult<T> _handleSuccessResponse<T>(
      Response response,
      T Function(dynamic)? fromJson,
      ) {
    try {
      if (fromJson != null) {
        final data = fromJson(response.data);
        return right(ApiResponse.success(
          data,
          message: 'Success',
          statusCode: response.statusCode,
        ));
      } else {
        return right(ApiResponse.success(
          response.data as T,
          message: 'Success',
          statusCode: response.statusCode,
        ));
      }
    } catch (e) {
      Log.severe('Error parsing response: $e', e);
      return left(ServerFailure('Failed to parse response: $e'));
    }
  }

  NetworkFailure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ConnectionFailure(
          'Request timeout. Please check your connection.',
          statusCode: error.response?.statusCode,
        );

      case DioExceptionType.connectionError:
        return const ConnectionFailure('Connection error. Please check your internet.');

      case DioExceptionType.badResponse:
        return _handleHttpError(error.response!);

      case DioExceptionType.cancel:
        return const UnknownFailure('Request was cancelled');

      case DioExceptionType.unknown:
        return UnknownFailure(
          'Unknown error occurred: ${error.message}',
          statusCode: error.response?.statusCode,
        );

      default:
        return UnknownFailure(
          'Unexpected error: ${error.message}',
          statusCode: error.response?.statusCode,
        );
    }
  }

  NetworkFailure _handleHttpError(Response response) {
    final statusCode = response.statusCode ?? 0;
    final message = response.data?.toString() ?? 'Unknown error';

    switch (statusCode) {
      case 400:
        return ServerFailure('Bad request: $message', statusCode: statusCode);
      case 401:
        return ServerFailure('Unauthorized access', statusCode: statusCode);
      case 403:
        return ServerFailure('Access forbidden', statusCode: statusCode);
      case 404:
        return ServerFailure('Resource not found', statusCode: statusCode);
      case 422:
        return ServerFailure('Validation error: $message', statusCode: statusCode);
      case 500:
        return ServerFailure('Internal server error', statusCode: statusCode);
      case 502:
        return ServerFailure('Bad gateway', statusCode: statusCode);
      case 503:
        return ServerFailure('Service unavailable', statusCode: statusCode);
      default:
        return ServerFailure('Server error: $message', statusCode: statusCode);
    }
  }

  String _getHttpMethod(HttpMethod method) {
    switch (method) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.patch:
        return 'PATCH';
      case HttpMethod.delete:
        return 'DELETE';
    }
  }

  T? _getCachedData<T>(String endpoint, T Function(dynamic)? fromJson) {
    try {
      final cachedResponse = cacheService.getCachedResponse(endpoint);
      if (cachedResponse != null && fromJson != null) {
        return fromJson(cachedResponse);
      }
      return cachedResponse as T?;
    } catch (e) {
      Log.warning('Error getting cached data: $e');
      return null;
    }
  }

  Future<void> _cacheResponse(
      String endpoint,
      dynamic data, {
        Duration? timeout,
      }) async {
    try {
      await cacheService.cacheResponse(
        endpoint,
        data,
        timeout: timeout ?? CacheConstants.cacheValidDuration,
      );
    } catch (e) {
      Log.warning('Error caching response: $e');
    }
  }

  // Force refresh - ignores services
  Future<ApiResponseResult<T>> forceRefresh<T>(
      ApiRequest apiRequest, {
        T Function(dynamic)? fromJson,
      }) async {
    // Clear services for this endpoint
    await cacheService.clearCacheByKey(apiRequest.endpoint);

    // Make fresh request
    return request<T>(
      apiRequest.copyWith(useCache: false),
      fromJson: fromJson,
    );
  }
}

// Extension for ApiRequest to add copyWith method
extension ApiRequestExtension on ApiRequest {
  ApiRequest copyWith({
    String? endpoint,
    HttpMethod? method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? formData,
    Map<String, String>? headers,
    bool? requiresAuth,
    bool? useCache,
    Duration? cacheTimeout,
  }) {
    return ApiRequest(
      endpoint: endpoint ?? this.endpoint,
      method: method ?? this.method,
      data: data ?? this.data,
      formData: formData ?? this.formData,
      headers: headers ?? this.headers,
      requiresAuth: requiresAuth ?? this.requiresAuth,
      useCache: useCache ?? this.useCache,
      cacheTimeout: cacheTimeout ?? this.cacheTimeout,
    );
  }
}