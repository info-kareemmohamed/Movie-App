
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/home/screens/HomeScreen.dart';

import '../screens/widget/SnackBar.dart';
import 'SocialStates.dart';


class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(InitialSocialLoginState());


  bool visibility = true;

  void changePasswordVisibility() {
    visibility = !visibility;
    emit(ChangeVisibilityState());
  }

  bool isEmail(String em) {
    String p = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    RegExp regExp = RegExp(p);
    return !regExp.hasMatch(em);
  }

  Future<void> login({String? email, String? password, context}) async {
    emit(SocialLoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
        emit(SocialLoginSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      print('kkkkkkkkkkkkkkkkkkkkkkkk  ${e.code}');
      if (e.code == 'user-not-found') {
        showSnackBar(
          context,
          'No user found for that Email',
          Colors.red,
        );
      } else if (e.code == 'wrong-password') {
        showSnackBar(
          context,
          'Wrong Password provided for that user',
          Colors.red,
        );
      } else if (e.code == 'too-many-requests') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
              child: Column(
                children: [
                  Text('Many failed login attempts '),
                  Text('Please resetting your Password and Try Again'),
                ],
              )),
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 1000),
        ));
      } else if (e.code == 'user-disabled') {
        showSnackBar(
          context,
          'Sorry You are Disabled  :(',
          Colors.red,
        );
      }
    }
    emit(SocialLoginErrorState());
  }
}
