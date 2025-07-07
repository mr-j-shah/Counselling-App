import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_counselling/app/data/enums/AuthFailedState.dart';

class Firebaseauthresponse {
  UserCredential? userCredential;
  String message;
  Authfailedstate failedState;
  Firebaseauthresponse({
    this.userCredential,
    this.message = "",
    this.failedState = Authfailedstate.NONE,
  });
}
