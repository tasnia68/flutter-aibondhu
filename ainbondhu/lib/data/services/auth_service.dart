import 'package:ainbondhu/data/network/api_client.dart';
import 'package:ainbondhu/data/network/api_endpoints.dart';

class AuthService {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> login(String phoneNumber) async {
    // This is a mock implementation for demonstration
    // In real app: return await _apiClient.post(ApiEndpoints.login, data: {'phone': phoneNumber});

    // Simulating API delay
    await Future.delayed(const Duration(seconds: 1));
    return {
      'success': true,
      'message': 'OTP sent successfully',
    };
  }

  Future<Map<String, dynamic>> verifyOtp(String phoneNumber, String otp) async {
    // In real app: return await _apiClient.post(ApiEndpoints.verifyOtp, data: {'phone': phoneNumber, 'otp': otp});

    await Future.delayed(const Duration(seconds: 1));
    return {
      'success': true,
      'token': 'mock_jwt_token',
      'user': {
        'id': 1,
        'name': 'Test User',
        'phone': phoneNumber,
      }
    };
  }
}
