
import 'package:flutter_project/core/services/datasource/model/MovieDetailsResponse.dart';

import '../datasource/model/MovieResponse.dart';

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
