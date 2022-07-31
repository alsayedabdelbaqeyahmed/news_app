import 'package:dio/dio.dart';

class DioHelper {
  static Dio? _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        // if an error occured return data
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    String? path,
    Map<String, dynamic>? map,
  }) async {
    return await _dio!
        .get(
      path!,
      queryParameters: map,
    )
        .catchError(
      (e) {
        print(e.toString());
        throw (e.toString());
      },
    );
  }
}
