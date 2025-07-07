import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/enums/language.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';

class Homecontroller extends GetxController {
  var isMenuOpen = false.obs;
  User? _user = FirebaseAuth.instance.currentUser;
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

  String getUserName() {
    return _user?.displayName?.trim().isNotEmpty == true
        ? _user!.displayName!
        : "User";
  }
  
  void toggleMenu() => isMenuOpen.value = !isMenuOpen.value;
}
