part of 'register_cubit.dart';


abstract class RegisterStates {}

class InitialSignUpState extends RegisterStates {}

class ChangeVisibilityState extends RegisterStates {}

class ChangeVisibilityConfirmPassState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String? code;
  RegisterErrorState(String code){
    this.code=code;
  }
}
