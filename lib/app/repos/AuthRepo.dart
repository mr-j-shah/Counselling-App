import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_counselling/app/data/enums/AuthFailedState.dart';
import 'package:project_counselling/app/data/models/apimodel/FirebaseAuthResponse.dart';
import 'package:project_counselling/app/data/models/apimodel/UserLoginWithPass.dart';
import 'package:project_counselling/app/data/models/apimodel/UserSignupRequest.dart';

class Authrepo {
  Future<Firebaseauthresponse> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      var authCred = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      return Firebaseauthresponse(
        userCredential: authCred,
        message: "Google login success!",
      );
    } catch (e) {
      return Firebaseauthresponse(
        userCredential: null,
        message: "Something went wrong!",
        failedState: Authfailedstate.UNKNOWN_ERROR,
      );
    }
  }

  Future<Firebaseauthresponse> signInWithEmailPassword(
    Userloginwithpass userLoginRequest,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userLoginRequest.email.trim(),
        password: userLoginRequest.password,
      );
      return Firebaseauthresponse(userCredential: credential);
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
        print('No user found for that email.');
        return Firebaseauthresponse(
          userCredential: null,
          message: message,
          failedState: Authfailedstate.USER_NOTFOUND,
        );
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
        print('Wrong password provided for that user.');
        return Firebaseauthresponse(
          userCredential: null,
          message: message,
          failedState: Authfailedstate.WRONG_PASSWORD,
        );
      } else {
        message = 'Error: ${e.code}';
        print('Error: ${e.code}');
        return Firebaseauthresponse(
          userCredential: null,
          message: message,
          failedState: Authfailedstate.UNKNOWN_ERROR,
        );
      }
    }
  }

  Future<Firebaseauthresponse> signUpWithEmail(
    Usersignuprequest signupRequest,
  ) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: signupRequest.email.trim(),
            password: signupRequest.password,
          );
      print("User created: ${userCredential.user!.email}");
      return Firebaseauthresponse(userCredential: userCredential, message: "User Created Successfully!");
    } on FirebaseAuthException catch (e) {
      String message = "Signup failed";
      if (e.code == 'email-already-in-use') {
        message = 'Email already in use';
        return Firebaseauthresponse(
          userCredential: null,
          message: message,
          failedState: Authfailedstate.USER_ALREADY_IN_USE,
        );
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email format';
        return Firebaseauthresponse(
          userCredential: null,
          message: message,
          failedState: Authfailedstate.INVALID_REQUEST,
        );
      } else if (e.code == 'weak-password') {
        message = 'Password is too weak';
        return Firebaseauthresponse(
          userCredential: null,
          message: message,
          failedState: Authfailedstate.INVALID_REQUEST,
        );
      } else {
        return Firebaseauthresponse(
          userCredential: null,
          message: message,
          failedState: Authfailedstate.UNKNOWN_ERROR,
        );
      }
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
