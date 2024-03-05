import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/core/helper/firebase.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/model/main_user.dart';

abstract class LoginRepo {
  static Future<String> login(String? email, String? password) async {
    String code = '';
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } on FirebaseAuthException catch (e) {
      return code = e.code;
    }

    return code;
  }

  static Future<String> loginWithGoogle() async {
    String code = '';
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return code = 'null';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      code = await FirebaseHelper.setUserInFirestore(
              userCredential.user!.displayName ?? '',
              userCredential.user!.email ?? '') ??
          '';
      if (code == '')
        UserMain.setDataToInstance(
            FirebaseAuth.instance.currentUser!.uid,
            userCredential.user!.displayName ?? "",
            userCredential.user!.email ?? '',
            '',
            "");
    } on FirebaseAuthException catch (e) {
      return code = e.code;
    }

    return code;
  }
}
