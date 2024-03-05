import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'name': name,
          'email': email,
          'password': password,
          'UId': FirebaseAuth.instance.currentUser!.uid,
        });

        UserMain.setDataToInstance(
            FirebaseAuth.instance.currentUser!.uid, name, email, password, "");
      });
    } on FirebaseAuthException catch (e) {
      return code = e.code;
    }
    return code;
  }
}
