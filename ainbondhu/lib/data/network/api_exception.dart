import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() {
    return 'ApiException: $message (Status: $statusCode)';
  }

  static ApiException fromDioError(DioException error) {
    String message = 'An unexpected error occurred';
    int? statusCode = error.response?.statusCode;
    dynamic data = error.response?.data;

    switch (error.type) {
      case DioExceptionType.cancel:
        message = 'Request to server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with server';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with server';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with server';
        break;
      case DioExceptionType.badResponse:
        message = _handleBadResponse(statusCode, data);
        break;
      case DioExceptionType.connectionError:
         message = 'No internet connection';
         break;
      default:
        message = 'Something went wrong';
        break;
    }

    return ApiException(
      message: message,
      statusCode: statusCode,
      data: data,
    );
  }

  static String _handleBadResponse(int? statusCode, dynamic data) {
    if (data is Map && data.containsKey('message')) {
      return data['message'];
    }
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Received invalid status code: $statusCode';
    }
  }
}
