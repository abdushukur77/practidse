import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../utils/app_constants/app_constants.dart';

class ApiClient {
  ApiClient() {
    _init();
  }

  late Dio dio;

  void _init() {
    dio = Dio();

    dio.options = BaseOptions(
      queryParameters: {},
      baseUrl: AppConstants.baseUrl,
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        "Authorization": "Bearer ${AppConstants.apiKey}",
        "Content-Type": "application/Json"
      },
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          debugPrint("ENTER ON REQUEST:${options.uri}");
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          debugPrint("ENTER ON RESPONSE:${response.data}");
          return handler.next(response);
        },
        onError: (
          DioException error,
          ErrorInterceptorHandler handler,
        ) {
          debugPrint("ENTER ON ERROR:${error.message}");
          return handler.next(error);
        },
      ),
    );
  }
}
