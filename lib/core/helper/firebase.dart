import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_project/core/model/main_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../firebase_options.dart';

Future<void> firebaseInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> setUserMain() async {
  if (FirebaseAuth.instance.currentUser != null) {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference userRef =
        FirebaseFirestore.instance.collection('Users').doc(uid);

    DocumentSnapshot userSnapshot = await userRef.get();

    if (userSnapshot.exists) {
      Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>;

      if (userData != null) {
        // Pass the userData to setInfoToInstance method
        UserMain.setInfoToInstance(userData);
      } else {
        print('User data is null');
      }
    } else {
      print('User document does not exist in Firestore');
    }
  }
}




Future<UserCredential> signInWithFacebook() async {
  try {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final AccessToken accessToken = loginResult.accessToken!;
      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      throw FirebaseAuthException(
        code: 'Facebook Login Failed',
        message: 'The Facebook login was not successful.',
      );
    }
  } on FirebaseAuthException catch (e) {
    // Handle Firebase authentication exceptions
    print('Firebase Auth Exception: ${e.message}');
    throw e; // rethrow the exception
  } catch (e) {
    // Handle other exceptions
    print('Other Exception: $e');
    throw e; // rethrow the exception
  }
}

Future<void> forgotPassword(String email) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
