
import 'package:flutter_project/features/movie_details/model/MovieDetailsResponse.dart';


import '../../model/MovieSimilarResponse.dart';

abstract class SimilarMovieStates{}

class SimilarMovieInitialState extends SimilarMovieStates {}

class SimilarMovieErrorState extends SimilarMovieStates {
  final String? message;
  SimilarMovieErrorState(this.message);
}

class SimilarMovieSuccessState extends SimilarMovieStates {
  final List<MovieSimilar> movie;
  SimilarMovieSuccessState(this.movie);
}
