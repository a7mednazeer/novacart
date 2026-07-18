import 'package:dio/dio.dart';

/// Factory for a pre-configured [Dio] instance.
///
/// Centralizing base options + interceptors here means every repository
/// gets consistent timeouts, logging, and (later) auth-token injection
/// without repeating boilerplate.
abstract class DioClient {
  DioClient._();

  static Dio create({String? baseUrl}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    return dio;
  }
}
