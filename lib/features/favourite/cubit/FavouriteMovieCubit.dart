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
      getData();
    } catch (e) {
      throw FavouriteMovieErrorState('Failed to fetch movies: $e');
    }
    return this.movies;
  }

  void deleteFavouriteMovie(String key) {
    try {
      box.delete(key);
       getData();
    } catch (e) {
      throw FavouriteMovieErrorState('Failed to fetch movies: $e');
    }
  }



  void getData(){
    this.movies =  box.values.toList() as List<MovieFavourite>;
    checkLength();
  }

  void checkLength(){
    this.movies.length>0? emit(FavouriteMovieSuccessState(this.movies)):
    emit(FavouriteMovieEmptyState());
  }






}
