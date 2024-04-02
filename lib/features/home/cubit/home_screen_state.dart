part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class SelectedValueState extends HomeScreenStates {}

class LanguageUpdateState extends HomeScreenStates {}

class ErrorState extends HomeScreenStates {
  final String? message;
  ErrorState(this.message);
}
