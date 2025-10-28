import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_counselling/app/constants/AppString.dart';
import 'package:project_counselling/app/data/enums/AuthFailedState.dart';
import '../data/models/apimodel/FirebaseAuthResponse.dart';
import 'package:project_counselling/app/data/models/apimodel/UserLoginWithPass.dart';
import 'package:project_counselling/app/data/models/apimodel/UserSignupRequest.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';

class Authrepo {
  final _appPref = Get.find<AppPref>();
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
        message: Appstring.successGoogleLogin,
      );
    } catch (e) {
      return Firebaseauthresponse(
        userCredential: null,
        message: Appstring.somethingWrong,
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
        message = Appstring.errorUserNotFound;
        print(Appstring.errorUserNotFound);
        return Firebaseauthresponse(
          userCredential: null,
          message: message,
          failedState: Authfailedstate.USER_NOTFOUND,
        );
      } else if (e.code == 'wrong-password') {
        message = Appstring.errorWrongPassword;
        print(Appstring.errorWrongPassword);
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
      return Firebaseauthresponse(
        userCredential: userCredential,
        message: Appstring.successUserCreate,
      );
    } on FirebaseAuthException catch (e) {
      String message = Appstring.errorFailedSignUp;
      if (e.code == 'email-already-in-use') {
        message = Appstring.errorEmailInUse;
        return Firebaseauthresponse(
          userCredential: null,
          message: message,
          failedState: Authfailedstate.USER_ALREADY_IN_USE,
        );
      } else if (e.code == 'invalid-email') {
        message = Appstring.errorEmailInvalid;
        return Firebaseauthresponse(
          userCredential: null,
          message: message,
          failedState: Authfailedstate.INVALID_REQUEST,
        );
      } else if (e.code == 'weak-password') {
        message = Appstring.errorWeakPassword;
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

  Future<Firebaseauthresponse> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      return Firebaseauthresponse(
        message: "Password reset link has been sent to your email.",
        failedState: Authfailedstate.NONE,
      );
    } on FirebaseAuthException catch (e) {
      String message;
      Authfailedstate failedState;
      if (e.code == 'user-not-found') {
        message = Appstring.errorUserNotFound;
        failedState = Authfailedstate.USER_NOTFOUND;
      } else if (e.code == 'invalid-email') {
        message = Appstring.errorEmailInvalid;
        failedState = Authfailedstate.INVALID_REQUEST;
      } else {
        message = Appstring.somethingWrong;
        failedState = Authfailedstate.UNKNOWN_ERROR;
      }
      return Firebaseauthresponse(
        message: message,
        failedState: failedState,
      );
    }
  }

  Future<void> signOut() async {
    await _appPref.clearUser();
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
