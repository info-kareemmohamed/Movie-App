import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_project/core/model/main_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../firebase_options.dart';
import '../utils/app_routes.dart';
import 'navigation.dart';

abstract class FirebaseHelper {
  static Future<void> firebaseInitialization() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> setUserMain() async {
    if (FirebaseAuth.instance.currentUser != null) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      UserMain.setInfoToInstance((await getUserFromFirestore(uid))!);
    } else {
      print('User document does not exist in Firestore');
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut().then((_) {
      UserMain.instance = null;
      NavigationHelper.navigateToReplacement(AppRoute.LOGIN);
    });
  }

  static Future<Map<String, dynamic>?> getUserFromFirestore(String id) async {
    Map<String, dynamic>? userData;
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('Users').doc(id).get();

    if (userSnapshot.exists) {
      userData = userSnapshot.data() as Map<String, dynamic>;
    } else {
      throw Exception('User document does not exist in Firestore');
    }
    return userData;
  }

  static Future<String?> setUserInFirestore(String name, String email) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'name': name,
        'email': email,
        'UId': FirebaseAuth.instance.currentUser!.uid,
      });
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  static Future<UserCredential> signInWithFacebook() async {
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

  static Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw Exception('Error in googleUser');
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential;
  }

  static Future<void> forgotPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static Future<bool> userExistsInFirestore(String userId) async {
    try {
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();
      return documentSnapshot.exists;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<void> _handleBackgroundMessage(
      RemoteMessage remoteMessage) async {
    print('Title:  ${remoteMessage.notification?.title}');
  }

  static Future<void> Notifications() async {
    FirebaseMessaging.instance.requestPermission();
    print('${await FirebaseMessaging.instance.getToken()} wwwwwwwww');
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }
}
