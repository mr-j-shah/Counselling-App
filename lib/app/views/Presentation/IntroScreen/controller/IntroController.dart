import 'dart:async';
import 'package:get/get.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Introcontroller extends GetxController {
  var positionIndex = 0.obs;
  var animationDuration = const Duration(milliseconds: 800);
  @override
  void onInit() {
    super.onInit();
    _startCycle();
  }

  void _startCycle() {
    Timer.periodic(const Duration(seconds: 5), (_) {
      // Main stay states: 0 (left), 2 (right), 4 (left again)
      if (positionIndex.value == 0) {
        positionIndex.value = 1; // to center
        Future.delayed(const Duration(milliseconds: 1200), () {
          positionIndex.value = 2; // to right
        });
      } else if (positionIndex.value == 2) {
        positionIndex.value = 3; // to center
        Future.delayed(const Duration(milliseconds: 1200), () {
          positionIndex.value = 0; // to left again
        });
      }
    });
  }

  double getTop() {
    switch (positionIndex.value) {
      case 1:
        return Dimensions.height(110);
      case 3:
        return Dimensions.height(110); // center height
      default:
        return -Dimensions.height(20); // top
    }
  }

  double? getLeft() {
    switch (positionIndex.value) {
      case 0:
        return -Dimensions.width(200); // far left
      case 1:
        return Dimensions.width(20);
      case 3:
        return Dimensions.width(20); // center
      case 2:
        return Dimensions.width(46); // right-side anchor
      default:
        return Dimensions.width(46);
    }
  }

  double? getRight() {
    switch (positionIndex.value) {
      case 0:
        return Dimensions.width(46); // left anchor
      case 1:
        return Dimensions.width(20);
      case 3:
        return Dimensions.width(20); // center
      case 2:
        return -Dimensions.width(200); // far right
      default:
        return Dimensions.width(46);
    }
  }


  String getTitleText() {
    switch (positionIndex.value) {
      case 0:
        return "Find Trusted Counsellors";
      case 1:
        return "Find Trusted Counsellors";
      case 2:
        return "Talk. Heal. Grow.";
      case 3:
        return "Talk. Heal. Grow.";
      default:
        return "";
    }
  }
  String getDescriptionText() {
    switch (positionIndex.value) {
      case 0:
        return "Talk openly. Get the right guidance when you need it most. AI-powered counselling that listens, understands, and supports you.";
      case 1:
        return "Talk openly. Get the right guidance when you need it most. AI-powered counselling that listens, understands, and supports you.";
      case 2:
        return "Our AI counsellor helps you navigate emotions, stress, and decisions — with compassion and real-time conversation support.";
      case 3:
        return "Our AI counsellor helps you navigate emotions, stress, and decisions — with compassion and real-time conversation support.";
      default:
        return "";
    }
  }

  void navigateToLogin(){
    Get.offAndToNamed(Routes.LOGIN_SCREEN);
  }

  void navigateToHome(){
    Get.offAndToNamed(Routes.HOME);
  }
}
