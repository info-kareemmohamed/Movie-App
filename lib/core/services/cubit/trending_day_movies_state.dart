part of 'trending_day_movies_cubit.dart';

@immutable
abstract class TrendingDayMoviesStates {}

class TrendingDayMoviesInitialState extends TrendingDayMoviesStates {}

class TrendingDayMoviesErrorState extends TrendingDayMoviesStates {
  final String? message;
  TrendingDayMoviesErrorState(this.message);
}

class TrendingDayMoviesSuccessState extends TrendingDayMoviesStates {
  final List<MovieResponse> movies;
  TrendingDayMoviesSuccessState(this.movies);
}
