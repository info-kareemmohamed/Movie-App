import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/model/main_user.dart';
import 'package:flutter_project/features/login/screens/pages/profile_picture.dart';
import 'package:flutter_project/features/login/screens/widget/SnackBar.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialSignUpState());

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

  bool isGmailEmail(String em) {
    String gmailRegExp = r"^[a-zA-Z0-9_.+-]+@gmail\.com$";
    RegExp regExp = RegExp(gmailRegExp);
    return regExp.hasMatch(em);
  }

  bool isValidEmail(String em) {
    String generalEmailRegExp =
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    RegExp generalRegExp = RegExp(generalEmailRegExp);
    return generalRegExp.hasMatch(em);
  }

  bool isName(String em) {
    String p = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
    RegExp regExp = RegExp(p);
    return !regExp.hasMatch(em);
  }

  Future<void> signUp(
      {String? name, String? email, String? password, context}) async {
    emit(SignUpLoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'name': name,
          'email': email,
          'password': password,
          'UId': FirebaseAuth.instance.currentUser!.uid,
        });

        UserMain.setDataToInstance(FirebaseAuth.instance.currentUser!.uid, name??"", email, password, "");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePicture()),
            (route) => false);
        emit(SignUpSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(
          context,
          'The Password provided is too Weak',
          Colors.red,
        );
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(
          context,
          'The Account already exists for that Email',
          Colors.red,
        );
      }
    }
    emit(SignUpErrorState());
  }
}
