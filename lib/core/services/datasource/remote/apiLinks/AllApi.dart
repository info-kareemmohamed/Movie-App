import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/services/datasource/remote/api/Constants.dart';


class ApiUrl {
  static final ApiUrl _instance = ApiUrl._();


  // Private constructor
  ApiUrl._();

  static final ApiUrl instance = _instance;

  // Instance variables
  String language = AppData.instance.Language;

  String get trendingWeekUrl =>
      '$baseUrl/trending/all/week?language=${language}&api_key=$apiKey';

  String get trendingDayUrl =>
      '$baseUrl/trending/all/day?language=${language}&api_key=$apiKey';

  String get topRatedMovieUrl =>
      '$baseUrl/movie/top_rated?language=${language}&api_key=$apiKey';

  String get popularMovieUrl =>
      '$baseUrl/movie/popular?language=${language}&api_key=$apiKey';

  String get nowPlayingMovieUrl =>
      '$baseUrl/movie/now_playing?language=${language}&api_key=$apiKey';

  String get upcomingMovieUrl =>
      '$baseUrl/movie/upcoming?language=${language}&api_key=$apiKey';

  String get youtubeBaseUrl => 'https://www.youtube.com/watch?v=';

  String get imageBaseUrl => 'https://image.tmdb.org/t/p/w500';

  String getEndPoint(String endpoint, movieId) {
    return '$baseUrl/$endpoint/$movieId?language=${language}&api_key=$apiKey';
  }

  String getEndPoint2(String endpoint, movieId) {
    return '$baseUrl/movie/$movieId/$endpoint?language=${language}&api_key=$apiKey';
  }
}