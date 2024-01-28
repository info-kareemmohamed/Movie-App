import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/services/datasource/model/MovieResponse.dart';
import '../../../core/services/datasource/remote/api/ApiService.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  bool allMovies = false;

  void showAllMovies() {
    allMovies = true;
    emit(MovieDetailsShowMoreMoviesState());
  }





  bool isFavourite = false;
  void addFavourite() {
    isFavourite = !isFavourite;
    emit(MovieFavouriteState());
  }
}
