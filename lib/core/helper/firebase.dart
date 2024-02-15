import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../firebase_options.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


Future<void> firebaseInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  UserCredential userc =
      await FirebaseAuth.instance.signInWithCredential(credential);
  print(userc.user?.displayName);
  return userc;
}




Future<UserCredential> signInWithFacebook() async {
  try {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final AccessToken accessToken = loginResult.accessToken!;
      final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
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




Future<void> forgotPassword(String email) async{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}

