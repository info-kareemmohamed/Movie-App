part of 'top_rated_movies_cubit.dart';

@immutable
abstract class TopRatedMoviesState {}

class TopRatedInitialState extends TopRatedMoviesState {}

class TopRatedErrorState extends TopRatedMoviesState {
  final String? message;
  TopRatedErrorState(this.message);
}

class TopRatedSuccessState extends TopRatedMoviesState {
  final List<MovieResponse> movies;
  TopRatedSuccessState(this.movies);
}
