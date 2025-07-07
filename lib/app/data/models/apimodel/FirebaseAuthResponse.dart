import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_counselling/app/data/enums/failstate.dart';

class Firebaseauthresponse {
  UserCredential? userCredential;
  String? message;
  FailedState failedState;
  Firebaseauthresponse({
    this.userCredential,
    this.message,
    this.failedState = FailedState.NONE,
  });
}
