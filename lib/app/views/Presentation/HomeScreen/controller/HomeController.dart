import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/models/language.dart';
import 'package:project_counselling/app/routers/app_routes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomDialog.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Homecontroller extends GetxController {
  var isMenuOpen = false.obs;

  @override
  void onInit() {
    super.onInit();
    print("CounterController initialized!");
  }

  @override
  void onClose() {
    print("CounterController disposed!");
    super.onClose();
  }

  void navigateToCounsellingHindi() {
    Get.toNamed(Routes.SPEECH_TEXT, arguments: Language.HINDI);
  }

  void navigateToCounsellingEnglish() {
    Get.toNamed(Routes.SPEECH_TEXT, arguments: Language.ENGLISH);
  }

  void navigateToPrivacyPolicy() {
    Get.toNamed(Routes.POLICY_SCREEN);
  }

  void logOutUser() {
    CustomDialog.show(
      context: Get.context!,
      title: "Log Out",
      subtitle: "Are you sure you want to logout?",
      cancelText: "Cancel",
      onConfirm: () {
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      },
    );
  }

  void toggleMenu() => isMenuOpen.value = !isMenuOpen.value;
}
