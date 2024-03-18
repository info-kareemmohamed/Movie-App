import 'dart:core';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/helper/hive.dart';
import '../model/movie_favourite.dart';
import 'FavouriteMovieState.dart';

class FavouriteMovieCubit extends Cubit<FavouriteMovieStates> {
  late List<MovieFavourite> movies;

  FavouriteMovieCubit() : super(FavouriteMovieInitialState()) {
    movies = [];
  }

  List<MovieFavourite> getFavouriteMovie() {
    try {
      getData();
    } catch (e) {
      emit(FavouriteMovieErrorState('Failed to fetch movies: $e'));
    }
    return this.movies;
  }

  void deleteFavouriteMovie(String key) {
    try {
      HiveHelper.FavouriteBox.delete(key);
      getData();
      emit(DeleteFavouriteMovieSuccessState());
    } catch (e) {
      emit(FavouriteMovieErrorState('Failed to fetch movies: $e'));
    }
  }

  void getData() {
    this.movies = HiveHelper.FavouriteBox.values.toList() as List<MovieFavourite>;
    checkLength();
  }

  void checkLength() {
    print(movies.length);
    this.movies.length > 0
        ? emit(FavouriteMovieSuccessState(this.movies))
        : emit(FavouriteMovieEmptyState());
  }
}
