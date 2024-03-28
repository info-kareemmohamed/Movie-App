import '../model/movie_favourite.dart';

abstract class FavouriteMovieStates {}

class FavouriteMovieInitialState extends FavouriteMovieStates {}

class FavouriteMovieErrorState extends FavouriteMovieStates {
  final String? message;
  FavouriteMovieErrorState(this.message);
}

class FavouriteMovieSuccessState extends FavouriteMovieStates {
  final List<MovieFavourite> movies;
  FavouriteMovieSuccessState(this.movies);
}

class DeleteFavouriteMovieSuccessState extends FavouriteMovieStates {
  final List<MovieFavourite> movies;
  DeleteFavouriteMovieSuccessState(this.movies);
}

class FavouriteMovieEmptyState extends FavouriteMovieStates {}
