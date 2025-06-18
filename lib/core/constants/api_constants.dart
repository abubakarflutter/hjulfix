class ApiConstants {
  static const String baseUrl = 'https://app.hjulfix.dk';

  static const Duration connectionTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
  static const Duration sendTimeout = Duration(seconds: 10);

  // Endpoints
  static const String login = '/auth/login';
  static const String home = '/home';
  static const String profile = '/profile';
}