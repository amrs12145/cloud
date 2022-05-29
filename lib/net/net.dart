import 'package:dio/dio.dart';

class Net {
  static final Dio dio = _initialize();

  static Dio _initialize() {
    final dio = Dio(
      BaseOptions(
        // baseUrl: 'http://192.168.1.0:8000/api/v1/',
        baseUrl: 'https://staging.recpeep.com/api/v1/',
        connectTimeout: 10000,
        receiveTimeout: 10000,
        sendTimeout: 10000,
      ),
    );

    return dio;
  }
}
