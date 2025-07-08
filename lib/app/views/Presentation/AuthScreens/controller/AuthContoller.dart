import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/constants/AppString.dart';
import 'package:project_counselling/app/data/enums/AuthFailedState.dart';
import 'package:project_counselling/app/data/models/apimodel/UserLoginWithPass.dart';
import 'package:project_counselling/app/data/models/apimodel/UserSignupRequest.dart';
import '../../../../data/models/User.dart' as localUser;
import 'package:project_counselling/app/repos/AuthRepo.dart';
import 'package:project_counselling/app/repos/UserRepo.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/Utils/CustomSnackbar.dart';
import 'package:project_counselling/app/views/Utils/Loading.dart';

class Authcontroller extends GetxController {
  RxBool isAgreed = false.obs;
  RxBool isPasswordVisible = false.obs;

  // Login Field Validator
  RxBool isLoginEmailValid = true.obs;

  // Sign Up Field Validator
  RxBool isSignUpEmailValid = true.obs;

  Authrepo _authrepo = new Authrepo();
  Userrepo _userrepo = new Userrepo();

  TextEditingController nameSignUpController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();

  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  final emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  final passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
  );

  void toggleAgreement() {
    isAgreed.value = !isAgreed.value;
  }

  void togglePasswordVisiblity() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void navigateToSignUp() {
    Get.toNamed(Routes.SIGNUP_SCREEN);
  }

  void navigateBackToLogin() {
    Get.back();
  }

  void onChanegdLoginEmail(String value) {
    if (emailRegExp.hasMatch(value)) {
      isLoginEmailValid.value = true;
    } else {
      isLoginEmailValid.value = false;
    }
  }

  void onChanegdSignUpEmail(String value) {
    if (emailRegExp.hasMatch(value)) {
      isSignUpEmailValid.value = true;
    } else {
      isSignUpEmailValid.value = false;
    }
  }

  void loginWithPassword() async {
    var email = emailLoginController.text;
    var password = passwordLoginController.text;

    if (email.isEmpty || email.length < 3) {
      Customsnackbar.show(
        title: Appstring.login,
        subtitle: Appstring.errorEmailValidation,
      );
      return;
    }

    if (password.isEmpty || password.length < 8) {
      Customsnackbar.show(
        title: Appstring.login,
        subtitle: Appstring.errorPasswordValidation,
      );
      return;
    }

    Loading.show();
    await _authrepo
        .signInWithEmailPassword(
          Userloginwithpass(
            email: emailLoginController.text,
            password: passwordLoginController.text,
          ),
        )
        .then((value) {
          if (value.failedState == Authfailedstate.NONE) {
            Customsnackbar.show(
              title: Appstring.login,
              subtitle: value.message,
              leadingIcon: Icon(Icons.check),
            );
            Get.offAllNamed(Routes.HOME);
            Loading.hide();
          } else {
            Loading.hide();
            Customsnackbar.show(
              title: Appstring.login,
              subtitle: value.message,
            );
          }
        });
  }

  void signUpUser() async {
    var name = nameSignUpController.text;
    var email = emailSignUpController.text;
    var password = passwordSignUpController.text;
    if (!isAgreed.value) {
      Customsnackbar.show(
        title: Appstring.login,
        subtitle: Appstring.errorTnCSignUp,
      );
      return;
    }

    if (name.isEmpty || name.length < 3) {
      Customsnackbar.show(
        title: Appstring.signUp,
        subtitle: Appstring.errorNameSignUp,
      );
      return;
    }

    if (email.isEmpty || email.length < 3) {
      Customsnackbar.show(
        title: Appstring.signUp,
        subtitle: Appstring.errorEmailValidation,
      );
      return;
    }

    if (password.isEmpty ||
        password.length < 8 ||
        !passwordRegExp.hasMatch(password)) {
      Customsnackbar.show(
        title: Appstring.signUp,
        subtitle: Appstring.errorPasswordSignUp,
      );
      return;
    }

    Loading.show();
    await _authrepo
        .signUpWithEmail(
          Usersignuprequest(email: email, name: name, password: password),
        )
        .then((value) {
          if (value.failedState == Authfailedstate.NONE) {
            _userrepo.addUser(localUser.User(name: name, email: email)).then((
              addValue,
            ) {
              Loading.hide();
              Customsnackbar.show(
                title: Appstring.login,
                subtitle: value.message,
                leadingIcon: Icon(Icons.check),
              );
            });
          } else {
            Loading.hide();
            Customsnackbar.show(
              title: Appstring.login,
              subtitle: value.message,
            );
          }
        })
        .catchError((e) {
          Loading.hide();
          Customsnackbar.show(title: Appstring.login, subtitle: e.toString());
        });
  }

  void loginWithGoogle() async {
    Loading.show();
    await _authrepo.signInWithGoogle().then((value) {
      if (value.failedState == Authfailedstate.NONE) {
        var firebaseUser = FirebaseAuth.instance.currentUser;
        _userrepo
            .addUser(
              localUser.User(
                name: firebaseUser!.displayName!,
                email: firebaseUser.email!,
              ),
            )
            .then((addValue) {
              Loading.hide();
              Customsnackbar.show(
                title: Appstring.login,
                subtitle: value.message,
                leadingIcon: Icon(Icons.check),
              );
              Get.offAllNamed(Routes.HOME);
            });
      } else {
        Loading.hide();
        Customsnackbar.show(title: Appstring.login, subtitle: value.message);
      }
    });
  }

  void loginWithFaceBook() {
    Loading.show();
    Timer(Duration(seconds: 5), () {
      Loading.hide();
      Customsnackbar.show(
        title: Appstring.login,
        subtitle: Appstring.faceBookSuspend,
      );
    });
  }
}
