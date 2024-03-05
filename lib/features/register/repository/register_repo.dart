import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/helper/firebase.dart';
import '../../../core/model/main_user.dart';

abstract class RegisterRepo {
  static Future<String> signUp(
      String name, String email, String password) async {
    String code = '';
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) {
        FirebaseHelper.setUserInFirestore(name, email);
        UserMain.setDataToInstance(
            FirebaseAuth.instance.currentUser!.uid, name, email, password, "");
      });
    } on FirebaseAuthException catch (e) {
      return code = e.code;
    }
    return code;
  }
}
