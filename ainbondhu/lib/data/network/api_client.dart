import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_endpoints.dart';
import 'api_exception.dart';

class ApiClient {
  late final Dio _dio;

  // Singleton instance
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  ApiClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add auth token if available
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // Wrap DioError with custom ApiException
          return handler.next(e);
        },
      ),
    );

    // Add logging in debug mode
    // if (kDebugMode) {
    //   _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // }
  }

  Dio get dio => _dio;

  // Generic GET method
  Future<T> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data as T;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  // Generic POST method
  Future<T> post<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(path, data: data, queryParameters: queryParameters);
      return response.data as T;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  // Generic PUT method
  Future<T> put<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put(path, data: data, queryParameters: queryParameters);
      return response.data as T;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  // Generic DELETE method
  Future<T> delete<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(path, data: data, queryParameters: queryParameters);
      return response.data as T;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
