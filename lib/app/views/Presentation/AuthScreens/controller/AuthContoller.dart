import 'package:get/get.dart';
import 'package:project_counselling/app/routers/app_routes.dart';

class Authcontroller extends GetxController {
  RxBool isAgreed = false.obs;

  void toggleAgreement() {
    isAgreed.value = !isAgreed.value;
  }
  
  void navigateToSignUp(){
    Get.toNamed(Routes.SIGNUP_SCREEN);
  }

  void navigateBackToLogin(){
    Get.back();
  }
}
