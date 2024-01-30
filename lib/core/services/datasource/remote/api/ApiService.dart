
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project/core/services/datasource/model/MovieCast.dart';
import 'package:flutter_project/core/services/datasource/remote/api/Constants.dart';
import '../../../../../features/movie_details/data/models/video_movie.dart';
import '../../model/MovieDetailsResponse.dart';
import '../../model/MovieResponse.dart';
import '../../model/MovieSimilarResponse.dart';
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
  Future<Movie> fetchMovieDetails(String url) async {

    Response response = await DioConfig.getDio().get(url);


    if (response.statusCode == 200) {

      return Movie.fromJson(response.data);
    } else {
      throw Exception('Unable to fetch');
    }
  }

  Future<MovieListSimilar> fetchMovieMovieSimilar(String url) async {

    Response response = await DioConfig.getDio().get(url);


    if (response.statusCode == 200) {

      return MovieListSimilar.fromJson(response.data);
    } else {
      throw Exception('Unable to fetch');
    }
  }
  Future<List<Cast>> fetchCastMovie(String url) async {

    Response response = await DioConfig.getDio().get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['cast'];
      List<Cast> castList = data.map((json) => Cast.fromJson(json)).toList();
      return castList;
    } else {
      throw Exception('Unable to fetch');
    }
  }


Future< MovieDetail> fetchVideoMovie(String url) async {

  Response response = await DioConfig.getDio().get(url);

  if (response.statusCode == 200) {
    return MovieDetail.fromJson(response.data);

  } else {
    throw Exception('Unable to fetch');
  }
}
}
