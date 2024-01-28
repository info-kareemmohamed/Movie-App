

import 'package:flutter_bloc/flutter_bloc.dart';

import '../datasource/model/MovieDetailsResponse.dart';
import '../datasource/model/MovieResponse.dart';
import '../datasource/remote/api/ApiService.dart';
import 'info_movie_state.dart';

class InfoMovieCubit extends Cubit<InfoMovieStates> {
  late Movie movie;
  InfoMovieCubit() : super(InfoMovieInitialState()) {

  }

  Future<Movie> getInfoMovie(String Url) {
    try {
      ApiService.apiService.fetchMovieDetails(Url).then((value) {
        movie = value ;
        emit(InfoMovieSuccessState(movie));
      });
    } catch (e) {
      throw InfoMovieErrorState('Failed to fetch movies: $e');
    }
    return Future.value(movie);
  }
}
