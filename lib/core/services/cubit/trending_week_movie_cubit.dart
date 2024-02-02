import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/trending_week_movie_state.dart';

import '../datasource/model/MovieResponse.dart';
import '../datasource/remote/api/ApiService.dart';

class TrendingWeekMoviesCubit extends Cubit<TrendingWeekMoviesStates> {
  late List<MovieResponse> movies;
  TrendingWeekMoviesCubit() : super(TrendingWeekMoviesInitialState()) {
    movies = [];
  }

  Future<List<MovieResponse>> getTrendingWeekWeek(String url) {
    try {
      ApiService.apiService.fetchMovie(url).then((value) {
        if (value.containsKey('results')) {
          movies = List<Map<String, dynamic>>.from(value['results'])
              .map((json) => MovieResponse().fromJson(json))
              .toList();
          emit(TrendingWeekMoviesSuccessState(movies));
        }

      });
    } catch (e) {
      throw TrendingWeekMoviesErrorState('Failed to fetch movies: $e');
    }
    return Future.value(movies);
  }

}
