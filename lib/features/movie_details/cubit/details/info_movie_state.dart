
import 'package:flutter_project/features/movie_details/model/MovieDetailsResponse.dart';

import '../../../home/model/MovieResponse.dart';

abstract class InfoMovieStates {}

class InfoMovieInitialState extends InfoMovieStates {}

class InfoMovieErrorState extends InfoMovieStates {
  final String? message;
  InfoMovieErrorState(this.message);
}

class InfoMovieSuccessState extends InfoMovieStates {
  final Movie movie;
  InfoMovieSuccessState(this.movie);
}
