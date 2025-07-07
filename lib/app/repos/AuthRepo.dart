import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_counselling/app/data/models/apimodel/FirebaseAuthResponse.dart';

class Authrepo {
  Future<Firebaseauthresponse> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var authCred = await FirebaseAuth.instance.signInWithCredential(credential);
    return Firebaseauthresponse(userCredential: authCred, message: "");
  }

  Future<UserCredential?> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Error: ${e.code}');
      }
      return null;
    }
  }

  Future<UserCredential?> signUpWithEmail(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password,
          );
      print("User created: ${userCredential.user!.email}");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String message = "Signup failed";
      if (e.code == 'email-already-in-use') {
        message = 'Email already in use';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email format';
      } else if (e.code == 'weak-password') {
        message = 'Password is too weak';
      }
      return null;
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
