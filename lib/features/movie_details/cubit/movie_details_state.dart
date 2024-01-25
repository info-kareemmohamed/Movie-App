part of 'movie_details_cubit.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsShowMoreMoviesState extends MovieDetailsState {}

class MovieFavouriteState extends MovieDetailsState {}
