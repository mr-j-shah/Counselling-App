import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/enums/language.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/Presentation/SettingsScreen/widgets/LanguageBottomSheet.dart';

import '../../../../Constants/AppString.dart';
import '../../../Utils/CustomSnackbar.dart';

class SettingsController extends GetxController {
  final AppPref _appPref = Get.find<AppPref>();

  // Observables for switch states
  var textMessagesEnabled = true.obs;
  var phoneCallsEnabled = true.obs;

  // Observables for values
  var selectedLanguage = Language.ENGLISH.obs;
  var selectedCurrency = "\$-USD".obs;
  var linkedAccounts = "Facebook, Google".obs;
  final isPasswordAuthentication = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSelectedLanguage();
    _checkAuthProvider();
  }

  void _loadSelectedLanguage() {
    final savedLanguage = _appPref.getLanguage();
    if (savedLanguage != null && savedLanguage.isNotEmpty) {
      try {
        selectedLanguage.value = Language.values.firstWhere((e) => e.toDisplayName() == savedLanguage);
      } catch (e) {
        // Handle cases where the saved language is no longer valid
        selectedLanguage.value = Language.ENGLISH;
      }
    }
  }

  void _checkAuthProvider() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Check if the provider list contains a password provider
      isPasswordAuthentication.value = user.providerData
          .any((userInfo) => userInfo.providerId == 'password');
    } else {
      Customsnackbar.show(
          title: Appstring.settingsChangePassword,
          subtitle: "Third party login is not supported this feature.",
          leadingIcon: Icon(Icons.password)
      );
    }
  }

  void goToAboutUs() {
    Get.toNamed(Routes.ABOUT_US_SCREEN);
  }

  void changeLanguage(BuildContext context) {
    showLanguageBottomSheet(context, selectedLanguage.value, (Language language) {
      _updateLanguage(language);
    });
  }

  void _updateLanguage(Language language) {
    selectedLanguage.value = language;
    _appPref.setLanguage(language.toDisplayName());
    Get.back();
    Customsnackbar.show(
      title: "Language Updated",
      subtitle: "Conversation language set to ${language.toDisplayName()}",
      leadingIcon: Icon(Icons.language)
    );
  }

  void goToChangePassword() {
    if (isPasswordAuthentication.value) {
      Get.toNamed(Routes.CHANGE_PASSWORD_SCREEN);
    }
  }
}
