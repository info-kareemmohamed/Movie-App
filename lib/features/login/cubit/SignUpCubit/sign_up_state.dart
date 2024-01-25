part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpStates {}

class InitialSignUpState extends SignUpStates {}

class ChangeVisibilityState extends SignUpStates {}

class ChangeVisibilityConfirmPassState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {}
