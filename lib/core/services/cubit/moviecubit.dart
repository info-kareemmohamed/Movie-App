import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/moviestate.dart';

import '../datasource/model/MovieResponse.dart';
import '../datasource/remote/api/ApiService.dart';

class MoviesCubit extends Cubit<MoviesStat> {
  late List<Results> movies;
  MoviesCubit() : super(MoviesInitialState()) {
    movies = [];
  }

  Future<List<Results>> getAllMovies(String url) {
    try {
      ApiService.apiService.fetchMovie(url).then((value) {
        movies = value.results ?? [];
        emit(MoviesSuccessState(movies));
      });
    } catch (e) {
      throw MoviesErrorState('Failed to fetch movies: $e');
    }
    return Future.value(movies);
  }

  Future<List<Results>> getPopular(String endPoint) {
    try {
      ApiService.apiService.fetchMovie(endPoint).then((value) {
        movies = value.results ?? [];
        emit(MoviesSuccessState(movies));
      });
    } catch (e) {
      throw MoviesErrorState('Failed to fetch movies: $e');
    }
    return Future.value(movies);
  }
  Future<List<Results>> getT(String endPoint) {
    try {
      ApiService.apiService.fetchMovie(endPoint).then((value) {
        movies = value.results ?? [];
        emit(MoviesTSuccessState(movies));
      });
    } catch (e) {
      throw MoviesErrorState('Failed to fetch movies: $e');
    }
    return Future.value(movies);
  }
}
