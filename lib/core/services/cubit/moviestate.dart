

import 'package:flutter_project/core/services/datasource/model/MovieResponse.dart';

abstract class MoviesStat{}

class MoviesInitialState extends MoviesStat{}

class MoviesErrorState extends MoviesStat{
  String? message;
  MoviesErrorState(this.message);
}

class MoviesSuccessState extends MoviesStat {
 final List<Results> movies;
  MoviesSuccessState(this.movies);

}

