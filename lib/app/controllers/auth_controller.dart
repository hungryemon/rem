import 'package:get/get.dart';
import 'package:rem/routes/app_routes.dart';

import '../base/base_rem_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends BaseRemController {
  static AuthController instance() {
    final AuthController authController =
        Get.find(tag: (AuthController).toString());
    return authController;
  }

  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  User? currentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  String getUserId() {
    return _auth.currentUser?.uid ?? '';
  }

  googleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.offAndToNamed(AppRoutes.splash);
  }
}
