import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/cubit/moviestate.dart';

import '../datasource/model/MovieResponse.dart';
import '../datasource/remote/api/ApiService.dart';
import '../datasource/remote/apiLinks/AllApi.dart';

class MoviesCubit extends Cubit<MoviesStat> {
  late List<Results> movies;

  MoviesCubit() : super(MoviesInitialState()) {
    movies = [];
  }

  List<Results> getAllMovies() {
    ApiService.apiService.fetchMovie(popularmovieurl).then((value) {
      try {
        movies = value.results ?? [];
        emit(MoviesSuccessState(movies));
      } catch (e) {
        emit(MoviesErrorState('Unable to fetch movies'));
      }
    });
    return this.movies;
  }
}
