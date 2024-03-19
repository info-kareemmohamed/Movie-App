part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class SelectedValueState extends HomeScreenStates {}

class LanguageUpdateState extends HomeScreenStates {}

// class TopRatedSuccessState extends HomeScreenStates  {
//   final List<MovieResponse> movies;
//   TopRatedSuccessState(this.movies);
// }
// class TrendingDayMoviesSuccessState extends HomeScreenStates  {
//   final List<MovieResponse> movies;
//   TrendingDayMoviesSuccessState(this.movies);
// }
//
// class TrendingWeekMoviesSuccessState extends HomeScreenStates {
//   final List<MovieResponse> movies;
//   TrendingWeekMoviesSuccessState(this.movies);
// }
//
class ErrorState extends HomeScreenStates {
  final String? message;
  ErrorState(this.message);
}
