import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/services/datasource/model/MovieResponse.dart';
import 'package:flutter_project/core/services/datasource/remote/api/ApiService.dart';

part 'trending_day_movies_state.dart';

class TrendingDayMoviesCubit extends Cubit<TrendingDayMoviesStates> {
  late List<MovieResponse> movies;
  TrendingDayMoviesCubit() : super(TrendingDayMoviesInitialState()) {
    movies = [];
  }

  Future<List<MovieResponse>> getTrendingDayMovies(String url) {
    try {
      ApiService.apiService.fetchMovie(url).then((value) {

        if (value.containsKey('results')) {
          movies = List<Map<String, dynamic>>.from(value['results'])
              .map((json) => MovieResponse().fromJson(json))
              .toList();
          emit(TrendingDayMoviesSuccessState(movies));
        }
      });
    } catch (e) {
      throw TrendingDayMoviesErrorState('Failed to fetch movies: $e');
    }
    return Future.value(movies);
  }
}
