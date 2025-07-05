import 'package:get/get.dart';
import 'package:project_counselling/app/data/repos/AuthRepo.dart';
import 'package:project_counselling/app/routers/app_routes.dart';

class Authcontroller extends GetxController {
  RxBool isAgreed = false.obs;
  Authrepo _authrepo = new Authrepo();

  void toggleAgreement() {
    isAgreed.value = !isAgreed.value;
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
}
