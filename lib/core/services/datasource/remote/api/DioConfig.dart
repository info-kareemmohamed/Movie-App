import 'package:dio/dio.dart';

import 'Constants.dart';

class DioConfig{
  static Dio getDio(){
    Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
}
}