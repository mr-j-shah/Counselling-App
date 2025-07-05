import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/routers/app_routes.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomDialog.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/model/SideMenu.dart';

class Sidemenucontroller extends GetxController {
  Rx<int> selectedTile = (-1).obs;
  int tilesAnimationTime = 200;
  int tilesOnClickPauseTime = 400;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void navigateToPrivacyPolicy() {
    Get.toNamed(Routes.POLICY_SCREEN);
  }

  void navigateToProfileScreen() {
    Get.toNamed(Routes.PROFILE_SCREEN);
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

  void sideMenuClick(int index) {
    switch (index) {
      case 3:
        navigateToPrivacyPolicy();
        break;
      default:
    }
  }

  List<SidemenuModel> sideMenuItems = [
    SidemenuModel(index: 1, title: Appstring.myChats),
    SidemenuModel(index: 2, title: Appstring.payments),
    SidemenuModel(index: 3, title: Appstring.privacyAndPolicy),
    SidemenuModel(index: 4, title: Appstring.helpCenter),
    SidemenuModel(index: 5, title: Appstring.settings),
  ];
}
