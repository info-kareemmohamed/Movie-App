
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project/core/services/datasource/remote/api/Constants.dart';
import '../../model/MovieResponse.dart';
import 'DioConfig.dart';



class ApiService {
  ApiService._();

  static final ApiService apiService = ApiService._();

  Future<MovieResponse> fetchMovie(String url) async {

    Response response = await DioConfig.getDio().get(url);


    if (response.statusCode == 200) {
      return MovieResponse.fromJson(response.data);
    } else {
      throw Exception('Unable to fetch');
    }
  }
}