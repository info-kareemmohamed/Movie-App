
import 'package:flutter_project/core/services/datasource/model/MovieDetailsResponse.dart';

import '../datasource/model/MovieResponse.dart';
import '../datasource/model/MovieSimilarResponse.dart';

abstract class SimilarMovieStates{}

class SimilarMovieInitialState extends SimilarMovieStates {}

class SimilarMovieErrorState extends SimilarMovieStates {
  final String? message;
  SimilarMovieErrorState(this.message);
}

class SimilarMovieSuccessState extends SimilarMovieStates {
  final MovieListSimilar movie;
  SimilarMovieSuccessState(this.movie);
}
