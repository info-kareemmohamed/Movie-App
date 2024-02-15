import 'package:flutter_project/features/home/model/MovieResponse.dart';

abstract class TrendingWeekMoviesStates {}

class TrendingWeekMoviesInitialState extends TrendingWeekMoviesStates {}

class TrendingWeekMoviesErrorState extends TrendingWeekMoviesStates {
  String? message;
  TrendingWeekMoviesErrorState(this.message);
}

class TrendingWeekMoviesSuccessState extends TrendingWeekMoviesStates {
  final List<MovieResponse> movies;
  TrendingWeekMoviesSuccessState(this.movies);
}
