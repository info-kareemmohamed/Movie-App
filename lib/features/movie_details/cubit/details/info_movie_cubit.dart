import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/MovieDetailsResponse.dart';
import '../../../../core/services/datasource/remote/api/ApiService.dart';
import 'info_movie_state.dart';

class InfoMovieCubit extends Cubit<InfoMovieStates> {
  Movie? movie;

  InfoMovieCubit() : super(InfoMovieInitialState()) {}

  Movie? getInfoMovie(String Url) {
    try {
      ApiService.apiService.fetchMovie(Url).then((value) {

          movie = Movie().fromJson(value);
          emit(InfoMovieSuccessState(movie!));

      });
    } catch (e) {
      throw InfoMovieErrorState('Failed to fetch movies: $e');
    }
    return movie;
  }
}
