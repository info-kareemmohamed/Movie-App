import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/helper/navigation.dart';
import 'package:flutter_project/core/utils/app_routes.dart';
import 'package:flutter_project/features/login/cubit/LoginStates.dart';
import 'package:flutter_project/features/login/repository/login.dart';
import 'package:flutter_project/core/common/widget/SnackBar.dart';
import '../../../core/helper/validation.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  bool visibility = true;

  void changePasswordVisibility() {
    visibility = !visibility;
    emit(ChangeVisibilityState());
  }

  Future<void> login({String? email, String? password}) async {
    emit(LoginLoadingState());
    try {
      String code = await LoginRepo.login(email, password);

      if (code != '') {
        codeMessageError(code);
        emit(LoginErrorState());
      } else {
        NavigationHelper.navigateToReplacement(AppRoute.APP_LAYOUT);
        emit(LoginSuccessState());
      }
    } catch (e) {
      print(e);
    }
  }

  void codeMessageError(String code) {
    if (code == 'invalid-credential') {
      showSnackBar(
        NavigationHelper.navigatorKey.currentContext!,
        'No user found or Wrong Password . Please check your Email and Password.',
        Colors.red,
      );
    } else if (code == 'too-many-requests') {
      showSnackBar(
        NavigationHelper.navigatorKey.currentContext!,
        '''Many failed login attempts 
          Please Closing App and Try Again''',
        Colors.red,
      );
    }
  }

  void signInWithGoogle() async {
    emit(LoginLoadingState());
    try {
      String code = await LoginRepo.loginWithGoogle();

      if (code == 'null') {
        emit(LoginCancelledState());
        return null;
      } else if (code == '') {
        NavigationHelper.navigateToReplacement(AppRoute.PROFILEPICTURE);
        emit(LoginSuccessState());
      }
    } catch (e) {
      showSnackBar(
        NavigationHelper.navigatorKey.currentContext!,
        'Failed to sign in with Google Network Error',
        Colors.red,
      );
      print('Failed to sign in with Google: $e');
      emit(LoginErrorState());
    }
  }

  void setDataToLogin(bool validate, String email, String password) {
    if (visibility) {
      login(
        email: email,
        password: password,
      );
    }
  }

  String? validateMessageEmail(String? email) {
    return Validation.validateEmail(email);
  }

  String? validateMessagePasswoed(String? password) {
    return Validation.validatePassword(password);
  }
}
