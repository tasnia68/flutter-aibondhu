class ApiEndpoints {
  // Base URL - Replace with actual URL or use environment variables
  static const String baseUrl = 'https://api.ainbondhu.com/v1';

  // Auth endpoints
  static const String login = '/auth/login';
  static const String verifyOtp = '/auth/verify-otp';
  static const String refreshToken = '/auth/refresh-token';

  // User endpoints
  static const String userProfile = '/user/profile';
}
