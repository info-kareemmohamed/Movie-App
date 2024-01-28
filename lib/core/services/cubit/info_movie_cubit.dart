import 'package:flutter_bloc/flutter_bloc.dart';

import '../datasource/model/MovieDetailsResponse.dart';
import '../datasource/remote/api/ApiService.dart';
import 'info_movie_state.dart';

class InfoMovieCubit extends Cubit<InfoMovieStates> {
  Movie? movie;
  InfoMovieCubit() : super(InfoMovieInitialState()) {}

  Movie? getInfoMovie(String Url) {
    emit(InfoMovieInitialState());
    try {
      ApiService.apiService.fetchMovieDetails(Url).then((value) {
        movie = value;
        print('dddddddddddddddddddddddddddddddddddddddddddddddd${movie}');
        emit(InfoMovieSuccessState(movie!));
      });
    } catch (e) {
      print(e.toString());
      throw InfoMovieErrorState('Failed to fetch movies: $e');
    }
    return movie;
  }
}
