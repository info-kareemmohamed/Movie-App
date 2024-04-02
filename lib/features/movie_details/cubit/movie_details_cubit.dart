import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../core/helper/hive.dart';
import '../../favourite/model/movie_favourite.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  bool allMovies = false;
  bool isFavourite = false;

  void showAllMovies() {
    allMovies = true;
    emit(MovieDetailsShowMoreMoviesState());
  }

  void ISThere(String key) {
    print('${key} ');
    print(HiveHelper.FavouriteBox.get(key) == null
        ? this.isFavourite = false
        : this.isFavourite = true);
  }

  void onClick(String key, MovieFavourite movie) {
    isFavourite = !isFavourite;
    print(this.isFavourite);
    this.isFavourite ? HiveHelper.FavouriteBox.put(key, movie) : HiveHelper.FavouriteBox.delete(key);
    emit(MovieFavouriteState());
  }
}
