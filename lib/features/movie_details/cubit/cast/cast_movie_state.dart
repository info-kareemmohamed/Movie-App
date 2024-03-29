
import 'package:flutter_project/features/movie_details/model/MovieCast.dart';

abstract class CastMovieStates {}

class CastMovieInitialState extends CastMovieStates {}

class CastMovieErrorState extends CastMovieStates {
  final String? message;
  CastMovieErrorState(this.message);
}

class CastMovieSuccessState extends CastMovieStates {
  final  List<Cast> casts;
  CastMovieSuccessState(this.casts);
}
