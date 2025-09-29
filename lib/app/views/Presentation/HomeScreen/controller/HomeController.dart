import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/enums/language.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';

class Homecontroller extends GetxController {
  var isMenuOpen = false.obs;
  User? _user = FirebaseAuth.instance.currentUser;

  // To manage the selected tab index for bottom navigation
  var selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print("HomeController initialized!");
  }

  @override
  void onClose() {
    print("HomeController disposed!");
    super.onClose();
  }

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
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
