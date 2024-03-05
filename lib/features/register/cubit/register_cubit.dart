import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/helper/navigation.dart';
import 'package:flutter_project/core/helper/validation.dart';
import 'package:flutter_project/core/utils/app_routes.dart';
import 'package:flutter_project/features/login/screens/widget/SnackBar.dart';
import 'package:flutter_project/features/register/repository/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialSignUpState());

  bool visibility = true;

  void changePasswordVisibility() {
    visibility = !visibility;
    emit(ChangeVisibilityState());
  }

  bool visibilityConfirmPass = true;

  void changePasswordVisibilityConfirmPass() {
    visibilityConfirmPass = !visibilityConfirmPass;
    emit(ChangeVisibilityConfirmPassState());
  }

  void signUp({String? name, String? email, String? password}) async {
    emit(RegisterLoadingState());
    try {
      String code = await RegisterRepo.signUp(name!, email!, password!);
      if (code != '') {
        if (code == 'email-already-in-use') {
          showSnackBar(
            NavigationHelper.navigatorKey.currentContext!,
            'The Account already exists for that Email',
            Colors.red,
          );
        }
        emit(RegisterErrorState(code));
      } else {
        NavigationHelper.navigateToReplacement(AppRoute.APP_LAYOUT);
        emit(RegisterSuccessState());
      }
    } catch (e) {
      print(e);
    }
  }

  String? validateMessageName(String? name) {
    return Validation.validateName(name);
  }

  String? validateMessageEmail(String? email) {
    return Validation.validateEmail(email);
  }

  String? validateMessagePasswoed(String? password) {
    return Validation.validatePassword(password);
  }

  String? validateMessagePasswoedConfirm(
      String? passwordConfirm, String password) {
    return Validation.validatePasswordConfirm(passwordConfirm, password);
  }

  void setDataToSignUp(
      bool validate, String name, String email, String password) {
    if (validate) {
      signUp(
        name: name,
        email: email,
        password: password,
      );
    }
  }
}
