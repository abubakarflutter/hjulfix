import 'package:dio/dio.dart';

import '../../utils/logging.dart';

class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration delay;

  RetryInterceptor({this.maxRetries = 3, this.delay = const Duration(seconds: 1)});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final retryCount = options.extra['retryCount'] ?? 0;

    if (retryCount < maxRetries && _shouldRetry(err)) {
      Log.info('Retrying request ${retryCount + 1}/$maxRetries: ${options.uri}');

      await Future.delayed(Duration(seconds: delay.inSeconds * (retryCount + 1 as int)));

      options.extra['retryCount'] = retryCount + 1;

      try {
        final response = await Dio().fetch(options);
        return handler.resolve(response);
      } catch (e) {
        return super.onError(err, handler);
      }
    }

    super.onError(err, handler);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode != null &&
            err.response!.statusCode! >= 500);
  }
}