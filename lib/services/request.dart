import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'http://18.141.188.211:7049/api';

  static Dio dio = Dio(BaseOptions(baseUrl: baseUrl));


  static Future<Response> post(
    String path,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  ) async {
    headers ??= {};
    body ??= {};
    queryParams ??= {};

    try {
      final response = await dio.post(
        path,
        queryParameters: queryParams,
        data: body,
        options: Options(headers: {...headers}),
      );
      return response;
    } on DioError catch (e) {
      throw new Exception(e);
    }
  }

  static Future<Response> get(
    String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  ) async {
    headers ??= {};
    queryParams ??= {};
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: {...headers}),
      );
      return response;
    } on DioError catch (e) {
      throw new Exception(e);
    }
  }

  static Future<dynamic> put(
    String path,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  ) async {
    headers ??= {};
    body ??= {};
    queryParams ??= {};
    try {
      final response = await dio.put(
        path,
        queryParameters: queryParams,
        data: body,
        options: Options(headers: {...headers}),
      );
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data);
      } else {
        throw Exception(e.message);
      }
    }
  }

}