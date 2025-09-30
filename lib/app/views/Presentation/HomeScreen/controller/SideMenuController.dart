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

  void navigateToMedicalRecords() {
    // TODO: Implement navigation to Medical Records Screen
    Get.snackbar("Coming Soon", "Medical Records screen is under development.");
    // Example: Get.toNamed(Routes.MEDICAL_RECORDS_SCREEN);
  }

  void navigateToPrivacyPolicy() {
    Get.toNamed(Routes.POLICY_SCREEN);
  }

  void navigateToTermsAndService() {
    Get.toNamed(Routes.TERMS_SERVICE_SCREEN);
  }

  void navigateToHelpCenter() { // Added this method
    Get.toNamed(Routes.HELP_CENTER_SCREEN);
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
      case 2: // Medical Records
        navigateToMedicalRecords();
        break;
      case 4: // Privacy & Policy
        navigateToPrivacyPolicy();
        break;
      case 5: // Terms and Service
        navigateToTermsAndService();
        break;
      case 6: // Help Center
        navigateToHelpCenter();
        break;
      default:
        Get.snackbar("Info", "Menu item $index clicked, no action defined.");
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
    SidemenuModel( // Added Medical Records
      index: 2,
      title: Appstring.medicalRecords,
      icon: Appassets.medicalRecordIcon, // Ensure this asset exists
    ),
    SidemenuModel(
      index: 3, // Shifted from 2
      title: Appstring.payments,
      icon: Appassets.paymentsIcon,
    ),
    SidemenuModel(
      index: 4, // Shifted from 3
      title: Appstring.privacyAndPolicy,
      icon: Appassets.privacyPolicyIcon,
    ),
    SidemenuModel(
      index: 5, // Shifted from 4
      title: Appstring.termsOfService,
      icon: Appassets.termsServiceIcon, // Ensure this asset exists (check AppAssets.dart)
    ),
    SidemenuModel(
      index: 6, // Shifted from 5
      title: Appstring.helpCenter,
      icon: Appassets.helpIcon,
    ),
    SidemenuModel(
      index: 7, // Shifted from 6
      title: Appstring.settings,
      icon: Appassets.settingsIcon,
    ),
  ];
}
