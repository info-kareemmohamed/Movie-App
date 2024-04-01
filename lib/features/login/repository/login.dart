import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import '../../../core/model/main_user.dart';

abstract class LoginRepo {
  static Future<String> login(String? email, String? password) async {
    String code = '';
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      UserMain.setInfoToInstance((await FirebaseHelper.getUserFromFirestore(
          userCredential.user!.uid))!);
    } on FirebaseAuthException catch (e) {
      return code = e.code;
    }
    return code;
  }

  static Future<String> loginWithGoogle() async {
    String code = '';
    try {
      final UserCredential userCredential =
          (await FirebaseHelper.signInWithGoogle())!;

      if (!await FirebaseHelper.userExistsInFirestore(
          userCredential.user!.uid)) {
        await _userNotExistsInFirestore(userCredential);
      } else {
        code = 'there';
        UserMain.setInfoToInstance((await FirebaseHelper.getUserFromFirestore(
            userCredential.user!.uid))!);
      }
    } on FirebaseAuthException catch (e) {
      return code = e.code;
    }

    return code;
  }

  static Future<int> forgotPassword(String email) async {
    if (email.isNotEmpty) return await FirebaseHelper.forgotPassword(email);
    return 3;
  }

  static Future<void> _userNotExistsInFirestore(
      UserCredential userCredential) async {
    await FirebaseHelper.setUserInFirestore(
            userCredential.user!.displayName ?? '',
            userCredential.user!.email ?? '') ??
        '';

    UserMain.setDataToInstance(
        FirebaseAuth.instance.currentUser!.uid,
        userCredential.user!.displayName ?? "",
        userCredential.user!.email ?? '',
        '',
        "");
  }
}
