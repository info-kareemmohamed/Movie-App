import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/helper/navigation.dart';
import 'package:flutter_project/core/utils/app_routes.dart';
import 'package:flutter_project/features/login/cubit/LoginStates.dart';
import 'package:flutter_project/features/login/repository/login.dart';
import 'package:flutter_project/core/common/widget/SnackBar.dart';
import '../../../core/helper/validation.dart';
import '../../../core/model/app_data.dart';
import '../../../core/utils/Constants.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  bool visibility = true, _languageEn = AppData.instance.Language == ENGLISH;

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
      _showSnackBar(_languageEn
          ? 'No user found or Wrong Password . Please check your Email and Password.'
          : "لم يتم العثور على مستخدم أو كلمة مرور خاطئة. يرجى التحقق من البريد الإلكتروني وكلمة المرور الخاصة بك.");
    } else if (code == 'too-many-requests') {
      _showSnackBar(_languageEn
          ? '''Many failed login attempts 
          Please Closing App and Try Again'''
          : "لعديد من محاولات تسجيل الدخول الفاشلة يرجى إغلاق التطبيق والمحاولة مرة أخرى");
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
      } else if (code == 'there') {
        NavigationHelper.navigateToReplacement(AppRoute.APP_LAYOUT);
      }
      emit(LoginSuccessState());
    } catch (e) {
      _showSnackBar(_languageEn
          ? 'Failed to sign in with Google Network Error'
          : "فشل تسجيل الدخول بسبب خطأ في شبكة Google");

      print('Failed to sign in with Google: $e');
      emit(LoginErrorState());
    }
  }

  void setDataToLogin(bool validate, String email, String password) {
    if (validate) {
      login(
        email: email,
        password: password,
      );
    }
  }

  String? validateMessageEmail(String? email) {
    return Validation.validateEmail(email);
  }

  String? validateMessagePassword(String? password) {
    return Validation.validatePassword(password);
  }

  void forgotPassword(String email) async {
    String? validationMessage = Validation.validateEmail(email);
    if (validationMessage != null) {
      _showSnackBar(validationMessage);
    } else {
      int codeMessage = await LoginRepo.forgotPassword(email);
      if (codeMessage == 0) {
        _showSnackBar(_languageEn
            ? 'Email is incorrect.'
            : "عنوان البريد الإلكتروني غير صحيح.");
      } else if (codeMessage == 1) {
        _showSnackBar(_languageEn
            ? 'The password reset email has been sent.'
            : "تم إرسال البريد الإلكتروني لإعادة تعيين كلمة المرور.");
      }
    }
  }

  void _showSnackBar(String message) {
    showSnackBar(
      NavigationHelper.navigatorKey.currentContext!,
      message,
      Colors.red,
    );
  }
}
