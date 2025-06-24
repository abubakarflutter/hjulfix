class ApiConstants {
  static const String baseUrl = 'https://app.hjulfix.dk/api/';
  // static const String baseUrl = 'https://app.hjulfix.dk/api/v2/';

  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Endpoints
  static const String login = 'login';
  static const String home = '/home';
  static const String profile = '/profile';
}