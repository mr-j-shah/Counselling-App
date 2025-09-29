import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/constants/AppAssets.dart';
import 'package:project_counselling/app/constants/AppString.dart';
import 'package:project_counselling/app/repos/AuthRepo.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/Utils/CustomDialog.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/model/SideMenu.dart';

class Sidemenucontroller extends GetxController {
  Rx<int> selectedTile = (-1).obs;
  int tilesAnimationTime = 200;
  int tilesOnClickPauseTime = 400;
  final User? _user = FirebaseAuth.instance.currentUser;
  final Authrepo _authrepo = Authrepo();
  @override
  void onInit() {
    super.onInit();
  }

  void navigateToPrivacyPolicy() {
    Get.toNamed(Routes.POLICY_SCREEN);
  }

  void navigateToTermsAndService() { // Added this method
    Get.toNamed(Routes.TERMS_SERVICE_SCREEN);
  }

  void navigateToProfileScreen() {
    Get.toNamed(Routes.PROFILE_SCREEN);
  }

  void logOutUser() {
    CustomDialog.show(
      context: Get.context!,
      title: Appstring.logOut,
      subtitle: Appstring.sureToLogOut,
      cancelText: Appstring.cancel,
      onConfirm: () async {
        await _authrepo.signOut();
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      },
    );
  }

  void sideMenuClick(int index) {
    switch (index) {
      case 3:
        navigateToPrivacyPolicy();
        break;
      case 4: // Updated for Terms and Service
        navigateToTermsAndService();
        break;
      default:
    }
  }

  String getUserName() {
    return _user?.displayName ?? "User";
  }

  String getEmail() {
    return "+91 9978530638";
  }

  List<SidemenuModel> sideMenuItems = [
    SidemenuModel(
      index: 1,
      title: Appstring.mySessions,
      icon: Appassets.mySessionsIcon,
    ),
    SidemenuModel(
      index: 2,
      title: Appstring.payments,
      icon: Appassets.paymentsIcon,
    ),
    SidemenuModel(
      index: 3,
      title: Appstring.privacyAndPolicy,
      icon: Appassets.privacyPolicyIcon,
    ),
    SidemenuModel( // Added Terms and Service
      index: 4,
      title: Appstring.termsOfService, // Assuming you added this to AppString.dart
      icon: Appassets.privacyPolicyIcon, // You might need to add/change this asset
    ),
    SidemenuModel(
      index: 5, // Updated index
      title: Appstring.helpCenter,
      icon: Appassets.helpIcon,
    ),
    SidemenuModel(
      index: 6, // Updated index
      title: Appstring.settings,
      icon: Appassets.settingsIcon,
    ),
  ];
}
