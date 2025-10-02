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
    Get.toNamed(Routes.MEDICAL_RECORDS_SCREEN); // Updated navigation
  }

  void navigateToPrivacyPolicy() {
    Get.toNamed(Routes.POLICY_SCREEN);
  }

  void navigateToTermsAndService() {
    Get.toNamed(Routes.TERMS_SERVICE_SCREEN);
  }

  void navigateToHelpCenter() {
    Get.toNamed(Routes.HELP_CENTER_SCREEN);
  }

  void navigateToSettingsScreen() {
    Get.toNamed(Routes.SETTINGS_SCREEN);
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
      case 1: // My Sessions - Placeholder if no specific navigation yet
        Get.snackbar("Info", "My Sessions clicked, no action defined yet.");
        break;
      case 2: // Medical Records
        navigateToMedicalRecords();
        break;
      case 3: // Payments - Placeholder if no specific navigation yet
        Get.snackbar("Info", "Payments clicked, no action defined yet.");
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
      case 7: // Settings
        navigateToSettingsScreen();
        break;
      default:
        Get.snackbar("Info", "Menu item $index clicked, no action defined.");
    }
  }

  String getUserName() {
    return _user?.displayName ?? "User";
  }

  String getEmail() {
    // This should ideally fetch real email if available or a placeholder
    return _user?.email ?? "your_email@example.com"; 
  }

  List<SidemenuModel> sideMenuItems = [
    SidemenuModel(
      index: 1,
      title: Appstring.mySessions,
      icon: Appassets.mySessionsIcon,
    ),
    SidemenuModel(
      index: 2,
      title: Appstring.medicalRecords,
      icon: Appassets.medicalRecordIcon, 
    ),
    SidemenuModel(
      index: 3,
      title: Appstring.payments,
      icon: Appassets.paymentsIcon,
    ),
    SidemenuModel(
      index: 4,
      title: Appstring.privacyAndPolicy,
      icon: Appassets.privacyPolicyIcon,
    ),
    SidemenuModel(
      index: 5,
      title: Appstring.termsOfService,
      icon: Appassets.privacyPolicyIcon,
    ),
    SidemenuModel(
      index: 6,
      title: Appstring.helpCenter,
      icon: Appassets.helpIcon,
    ),
    SidemenuModel(
      index: 7,
      title: Appstring.settings,
      icon: Appassets.settingsIcon,
    ),
  ];
}
