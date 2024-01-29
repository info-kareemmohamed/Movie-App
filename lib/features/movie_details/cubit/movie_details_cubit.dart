import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/services/datasource/model/MovieResponse.dart';
import '../../../core/services/datasource/remote/api/ApiService.dart';
import '../../../core/utils/Constants.dart';
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
    print('${key} gggggggggggggggggggggggggggggggg');
    print(box.get(key) == null
        ? this.isFavourite = false
        : this.isFavourite = true);
  }

  void onClick(String key, MovieFavourite movie) {
    isFavourite = !isFavourite;
    print(this.isFavourite);
    this.isFavourite ? box.put(key, movie) : box.delete(key);
    emit(MovieFavouriteState());
  }
}
