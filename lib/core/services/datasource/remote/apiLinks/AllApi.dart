import 'package:flutter_project/core/model/app_data.dart';
import 'package:flutter_project/core/services/datasource/remote/api/Constants.dart';

String trendingWeekUrl =
    '$baseUrl/trending/all/week?language=${AppData.instance.Language}&api_key=$apiKey';
String trendingDayUrl =
    '$baseUrl/trending/all/day?language=${AppData.instance.Language}&api_key=$apiKey';
String topRatedMovieUrl =
    '$baseUrl/movie/top_rated?language=${AppData.instance.Language}&api_key=$apiKey';
//----------------------
String popularMovieUrl =
    '$baseUrl/movie/popular?language=${AppData.instance.Language}&api_key=$apiKey';
String nowPlayingMovieUrl =
    '$baseUrl/movie/now_playing?language=${AppData.instance.Language}&api_key=$apiKey';
String upcomingMovieUrl =
    '$baseUrl/movie/upcoming?language=${AppData.instance.Language}&api_key=$apiKey';
String youtubeBaseUrl = 'https://www.youtube.com/watch?v=';
String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

String getEndPoint(String endpoint, movieId) {
  return '${baseUrl}/${endpoint}/${movieId}?language=${AppData.instance.Language}&api_key=${apiKey}';
}

String getEndPoint2(String endpoint, movieId) {
  return '${baseUrl}/movie/${movieId}/${endpoint}?language=${AppData.instance.Language}&api_key=${apiKey}';
}
