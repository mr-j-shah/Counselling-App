import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_counselling/app/services/network/failstate.dart';

class Firebaseauthresponse {
  UserCredential? userCredential;
  String? message;
  Firebaseauthresponse({this.userCredential, this.message});
}
