import 'dart:core';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/Constants.dart';
import '../model/movie_favourite.dart';
import 'FavouriteMovieState.dart';

class FavouriteMovieCubit extends Cubit<FavouriteMovieStates> {
  late List<MovieFavourite> movies;

  FavouriteMovieCubit() : super(FavouriteMovieInitialState()) {
    movies = [];
  }

  List<MovieFavourite> getFavouriteMovie() {
    try {
      this.movies =  box.values.toList() as List<MovieFavourite>;
      emit(FavouriteMovieSuccessState(movies));
    } catch (e) {
      throw FavouriteMovieErrorState('Failed to fetch movies: $e');
    }
    return this.movies;
  }

  void deleteFavouriteMovie(String key) {
    try {
      box.delete(key);
      emit(FavouriteMovieDeleteSuccessState());
    } catch (e) {
      throw FavouriteMovieErrorState('Failed to fetch movies: $e');
    }
  }


}
