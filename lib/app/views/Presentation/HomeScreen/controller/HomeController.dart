import 'package:get/get.dart';
import 'package:project_counselling/app/data/enums/language.dart';
import 'package:project_counselling/app/data/models/apimodel/User.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';

class Homecontroller extends GetxController {
  var isMenuOpen = false.obs;
  final AppPref _appPref = Get.find<AppPref>();
  User? _user;

  // To manage the selected tab index for bottom navigation
  var selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _user = _appPref.getUser();
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
    return _user?.name.trim().isNotEmpty == true ? _user!.name : "User";
  }

  void toggleMenu() => isMenuOpen.value = !isMenuOpen.value;
}
