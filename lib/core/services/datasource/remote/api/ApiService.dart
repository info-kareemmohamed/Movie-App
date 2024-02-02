
import 'package:dio/dio.dart';
import 'DioConfig.dart';



class ApiService {
  ApiService._();

  static final ApiService apiService = ApiService._();


  Future<Map<String, dynamic>> fetchMovie(String URL) async {
    Response response = await DioConfig.getDio().get(URL);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Unable to fetch');
    }
  }
}

