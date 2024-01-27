import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/services/datasource/model/MovieResponse.dart';
import 'package:flutter_project/core/services/datasource/remote/api/ApiService.dart';

part 'trending_day_movies_state.dart';

class TrendingDayMoviesCubit extends Cubit<TrendingDayMoviesStates> {
  late List<Results> movies;
  TrendingDayMoviesCubit() : super(TrendingDayMoviesInitialState()) {
    movies = [];
  }

  Future<List<Results>> getTrendingDayMovies(String endPoint) {
    try {
      ApiService.apiService.fetchMovie(endPoint).then((value) {
        movies = value.results ?? [];
        emit(TrendingDayMoviesSuccessState(movies));
      });
    } catch (e) {
      throw TrendingDayMoviesErrorState('Failed to fetch movies: $e');
    }
    return Future.value(movies);
  }
}
