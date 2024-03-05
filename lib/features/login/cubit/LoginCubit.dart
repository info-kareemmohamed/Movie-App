import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/app_layout/screens/app_layout_screen.dart';
import 'package:flutter_project/features/login/cubit/LoginStates.dart';
import 'package:flutter_project/features/login/screens/pages/profile_picture.dart';
import 'package:flutter_project/features/login/screens/widget/SnackBar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  bool visibility = true;

  void changePasswordVisibility() {
    visibility = !visibility;
    emit(ChangeVisibilityState());
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

  Future<void> login({String? email, String? password, context}) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AppLayoutScreen()),
            (route) => false);
        emit(LoginSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        showSnackBar(
          context,
          'No user found or Wrong Password . Please check your Email and Password.',
          Colors.red,
        );
      } else if (e.code == 'too-many-requests') {
        showSnackBar(
          context,
          '''Many failed login attempts 
          Please Closing App and Try Again''',
          Colors.red,
        );
      }
    }
    emit(LoginErrorState());
  }

  Future<UserCredential?> signInWithGoogle(
      {required BuildContext context}) async {
    emit(LoginLoadingState());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(LoginCancelledState());

        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'name': userCredential.user!.displayName,
        'email': userCredential.user!.email,
        'UId': FirebaseAuth.instance.currentUser!.uid,
      }).then((value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePicture()),
          (route) => false,
        );
      });

      emit(LoginSuccessState());
      return userCredential;
    } catch (e) {
      showSnackBar(
        context,
        'Failed to sign in with Google Network Error',
        Colors.red,
      );
      print('Failed to sign in with Google: $e');
      emit(LoginErrorState());
      rethrow;
    }
  }
}
