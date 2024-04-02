import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'Constants.dart';

class DioConfig {

  static Dio getDio() {
    Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(LogInterceptor(responseBody: true));

    // //Create a DioCacheManager and Add the cache interceptor to the Dio instance
    // dio.interceptors
    //     .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);

    return dio;
  }
}
