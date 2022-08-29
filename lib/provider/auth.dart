import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth with ChangeNotifier {
  var auth = FirebaseAuth.instance;

  Stream<User?> changeState() {
    return auth.idTokenChanges();
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void logOut() async {
    await auth.signOut();
  }

  void register(String email, String password) async {
    try {
      final UserCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserCredential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void resetPassword(String email) async {
    if (email != "") {
      await auth.sendPasswordResetEmail(email: email);
    }
  }

  // login menggunakan google
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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

// sign in with anonymous accounr
  Future signInWithAnom() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
}
