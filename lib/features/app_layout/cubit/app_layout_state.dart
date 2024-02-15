part of 'app_layout_cubit.dart';

@immutable
abstract class AppLayoutStates {}

class InitialAppLayoutState extends AppLayoutStates {}

class ChangeModeState extends AppLayoutStates {}

class AllowNotificationState extends AppLayoutStates {}

class ChangeBottomState extends AppLayoutStates {}

class SelectLanguage extends AppLayoutStates {}
