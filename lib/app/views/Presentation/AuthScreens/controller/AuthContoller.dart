import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/constants/AppString.dart';
import 'package:project_counselling/app/repos/AuthRepo.dart';
import 'package:project_counselling/app/routers/app_routes.dart';
import 'package:project_counselling/app/views/Utils/CustomSnackbar.dart';
import 'package:project_counselling/app/views/Utils/Loading.dart';

class Authcontroller extends GetxController {
  RxBool isAgreed = false.obs;
  RxBool isPasswordVisible = false.obs;
  Authrepo _authrepo = new Authrepo();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  void loginWithGoogle() async {
    await _authrepo.signInWithGoogle();
    Get.offAllNamed(Routes.HOME);
  }

  void loginWithFaceBook() {
    Loading.show();
    Timer(Duration(seconds: 5), () {
      Loading.hide();
      Customsnackbar.show(
        title: Appstring.login,
        subtitle:
            "Currently Facebook login is Suspended! Please try some other Social Login.",
      );
    });
  }
}
