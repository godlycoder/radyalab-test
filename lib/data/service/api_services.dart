import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_interceptors.dart';

class ApiServices {
  final _dio = Dio( 
      BaseOptions(
        baseUrl: 'https://playground-rest-api-vk3y7f3hta-et.a.run.app',
        connectTimeout: 5000,
        receiveTimeout: 3000,
      )
  );

  ApiServices() {
    _dio.interceptors
        .add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90
        )
    );
    _dio.interceptors.add(AppInterceptors(_dio));
  }

  Future<Response> fetchAllFood() {
    return _dio.get('/foods');
  }

}