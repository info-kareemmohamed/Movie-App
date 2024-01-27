import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/trending_week_movie_state.dart';

import '../datasource/model/MovieResponse.dart';
import '../datasource/remote/api/ApiService.dart';

class TrendingWeekMoviesCubit extends Cubit<TrendingWeekMoviesStates> {
  late List<Results> movies;
  TrendingWeekMoviesCubit() : super(TrendingWeekMoviesInitialState()) {
    movies = [];
  }

  Future<List<Results>> getTrendingWeekWeek(String url) {
    try {
      ApiService.apiService.fetchMovie(url).then((value) {
        movies = value.results ?? [];
        emit(TrendingWeekMoviesSuccessState(movies));
      });
    } catch (e) {
      throw TrendingWeekMoviesErrorState('Failed to fetch movies: $e');
    }
    return Future.value(movies);
  }

  // Future<List<Results>> getT(String endPoint) {
  //   try {
  //     ApiService.apiService.fetchMovie(endPoint).then((value) {
  //       movies = value.results ?? [];
  //       emit(MoviesTSuccessState(movies));
  //     });
  //   } catch (e) {
  //     throw MoviesErrorState('Failed to fetch movies: $e');
  //   }
  //   return Future.value(movies);
  // }
}
