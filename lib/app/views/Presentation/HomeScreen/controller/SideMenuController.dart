import 'package:get/get.dart';
import 'package:project_counselling/app/constants/AppAssets.dart';
import 'package:project_counselling/app/constants/AppString.dart';
import 'package:project_counselling/app/data/models/apimodel/User.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/repos/AuthRepo.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/Utils/CustomDialog.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/model/SideMenu.dart';

class Sidemenucontroller extends GetxController {
  Rx<int> selectedTile = (-1).obs;
  int tilesAnimationTime = 200;
  int tilesOnClickPauseTime = 400;

  final AppPref _appPref = Get.find<AppPref>();
  final Authrepo _authrepo = Authrepo();
  User? _user;

  @override
  void onInit() {
    super.onInit();
    _user = _appPref.getUser();
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

  void navigateToBoxBreathingScreen() {
    Get.toNamed(Routes.BREATHING_EXERCISE_SCREEN);
  }

  void navigateToProfileScreen() {
    Get.toNamed(Routes.PROFILE_SCREEN);
  }

  void navigateToChatHistory() {
    Get.toNamed(Routes.CHAT_HISTORY_SCREEN);
  }

  void logOutUser() {
    CustomDialog.show(
      context: Get.context!,
      title: Appstring.logOut,
      subtitle: Appstring.sureToLogOut,
      cancelText: Appstring.cancel,
      onConfirm: () async {
        await _authrepo.signOut();
        await _appPref.clearUser(); // Clear user from prefs
        Get.offAllNamed(Routes.INTRO_SCREEN); // Navigate to Intro
      },
    );
  }

  void sideMenuClick(int index) {
    switch (index) {
      case 1: // My Sessions - Placeholder if no specific navigation yet
        navigateToChatHistory();
        break;
      case 2:
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
      case 8: // Box Breathing
        navigateToBoxBreathingScreen();
        break;
      default:
        Get.snackbar("Info", "Menu item $index clicked, no action defined.");
    }
  }

  String getUserName() {
    return _user?.name ?? "User";
  }

  String getEmail() {
    return _user?.email ?? "your_email@example.com";
  }

  List<SidemenuModel> sideMenuItems = [
    SidemenuModel(
      index: 1,
      title: Appstring.mySessions,
      icon: Appassets.mySessionsIcon,
    ),
    // SidemenuModel(
    //   index: 2,
    //   title: Appstring.medicalRecords,
    //   icon: Appassets.medicalRecordIcon,
    // ),
    // SidemenuModel(
    //   index: 3,
    //   title: Appstring.payments,
    //   icon: Appassets.paymentsIcon,
    // ),
    SidemenuModel(
      index: 8,
      title: "Box Breathing",
      icon: Appassets.breathingIcon,
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
