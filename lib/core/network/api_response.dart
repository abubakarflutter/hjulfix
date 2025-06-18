// core/network/api_response.dart
import 'package:fpdart/fpdart.dart';

// API Response wrapper
class ApiResponse<T> {
  final T? data;
  final String? message;
  final int? statusCode;
  final bool success;

  const ApiResponse({
    this.data,
    this.message,
    this.statusCode,
    required this.success,
  });

  factory ApiResponse.success(T data, {String? message, int? statusCode}) {
    return ApiResponse(
      data: data,
      message: message,
      statusCode: statusCode,
      success: true,
    );
  }

  factory ApiResponse.error(String message, {int? statusCode}) {
    return ApiResponse<T>(
      message: message,
      statusCode: statusCode,
      success: false,
    );
  }
}

// Network Failures
abstract class NetworkFailure {
  final String message;
  final int? statusCode;

  const NetworkFailure(this.message, {this.statusCode});
}

class ServerFailure extends NetworkFailure {
  const ServerFailure(super.message, {super.statusCode});
}

class ConnectionFailure extends NetworkFailure {
  const ConnectionFailure(super.message, {super.statusCode});
}

class CacheFailure extends NetworkFailure {
  const CacheFailure(super.message, {super.statusCode});
}

class UnknownFailure extends NetworkFailure {
  const UnknownFailure(super.message, {super.statusCode});
}

// Type aliases for better readability
typedef ApiResult<T> = Either<NetworkFailure, T>;
typedef ApiResponseResult<T> = Either<NetworkFailure, ApiResponse<T>>;

// HTTP Methods enum
enum HttpMethod { get, post, put, patch, delete }

// API Request model
class ApiRequest {
  final String endpoint;
  final HttpMethod method;
  final Map<String, dynamic>? data;
  final Map<String, dynamic>? formData;
  final Map<String, String>? headers;
  final bool requiresAuth;
  final bool useCache;
  final Duration? cacheTimeout;

  const ApiRequest({
    required this.endpoint,
    required this.method,
    this.data,
    this.formData,
    this.headers,
    this.requiresAuth = true,
    this.useCache = false,
    this.cacheTimeout,
  });
}