import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  bool allMovies = false;

  void showAllMovies() {
    allMovies = true;
    emit(MovieDetailsShowMoreMovies());
  }
}
