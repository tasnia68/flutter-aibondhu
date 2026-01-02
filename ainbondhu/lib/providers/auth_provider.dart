import 'package:flutter/material.dart';
import 'package:ainbondhu/data/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'base_provider.dart';

class AuthProvider extends BaseProvider {
  final AuthService _authService = AuthService();
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(String phoneNumber) async {
    setState(ViewState.busy);
    try {
      final response = await _authService.login(phoneNumber);
      if (response['success'] == true) {
        setState(ViewState.idle);
        return true;
      } else {
        setError(response['message'] ?? 'Login failed');
        return false;
      }
    } catch (e) {
      setError(e.toString());
      return false;
    }
  }

  Future<bool> verifyOtp(String phoneNumber, String otp) async {
    setState(ViewState.busy);
    try {
      final response = await _authService.verifyOtp(phoneNumber, otp);
      if (response['success'] == true) {
        // Save token
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', response['token']);

        _isAuthenticated = true;
        setState(ViewState.idle);
        return true;
      } else {
        setError(response['message'] ?? 'OTP verification failed');
        return false;
      }
    } catch (e) {
      setError(e.toString());
      return false;
    }
  }
}
