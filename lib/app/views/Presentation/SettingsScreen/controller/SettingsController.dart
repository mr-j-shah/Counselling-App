import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/enums/language.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/Presentation/SettingsScreen/widgets/LanguageBottomSheet.dart';

class SettingsController extends GetxController {
  final AppPref _appPref = Get.find<AppPref>();

  // Observables for switch states
  var textMessagesEnabled = true.obs;
  var phoneCallsEnabled = true.obs;

  // Observables for values
  var selectedLanguage = "English".obs;
  var selectedCurrency = "\$-USD".obs;
  var linkedAccounts = "Facebook, Google".obs;

  @override
  void onInit() {
    super.onInit();
    _loadSelectedLanguage();
  }

  void _loadSelectedLanguage() {
    final savedLanguage = _appPref.getLanguage();
    if (savedLanguage != null && savedLanguage.isNotEmpty) {
      selectedLanguage.value = savedLanguage;
    }
  }

  void toggleTextMessages(bool value) {
    textMessagesEnabled.value = value;
    Get.snackbar("Settings Updated", "Text messages ${value ? 'enabled' : 'disabled'}");
  }

  void togglePhoneCalls(bool value) {
    phoneCallsEnabled.value = value;
    Get.snackbar("Settings Updated", "Phone calls ${value ? 'enabled' : 'disabled'}");
  }

  // --- Navigation Handlers ---

  void changePassword() {
    // Get.toNamed(AppRoutes.CHANGE_PASSWORD_SCREEN);
    // Get.snackbar("Navigation", "To Change Password Screen (${AppRoutes.CHANGE_PASSWORD_SCREEN})");
  }

  void goToNotificationsSettings() {
    // Get.toNamed(AppRoutes.NOTIFICATIONS_SETTINGS_SCREEN);
    // Get.snackbar("Navigation", "To Notifications Settings Screen (${AppRoutes.NOTIFICATIONS_SETTINGS_SCREEN})");
  }

  void goToStatistics() {
    // Get.toNamed(AppRoutes.STATISTICS_SCREEN);
    // Get.snackbar("Navigation", "To Statistics Screen (${AppRoutes.STATISTICS_SCREEN})");
  }

  void goToAboutUs() {
    Get.toNamed(Routes.ABOUT_US_SCREEN);
  }

  void changeLanguage(BuildContext context) {
    showLanguageBottomSheet(context, (Language language) {
      _updateLanguage(language);
    });
  }

  void _updateLanguage(Language language) {
    selectedLanguage.value = language.toDisplayName();
    _appPref.setLanguage(language.toDisplayName());
    Get.snackbar("Language Updated", "Conversation language set to ${language.toDisplayName()}");
  }

  void changeCurrency() {
    // Get.toNamed(AppRoutes.CURRENCY_SELECTION_SCREEN);
    // Get.snackbar("Navigation", "To Currency Selection Screen (${AppRoutes.CURRENCY_SELECTION_SCREEN})");
  }

  void manageLinkedAccounts() {
    // Get.toNamed(AppRoutes.LINKED_ACCOUNTS_SCREEN);
    // Get.snackbar("Navigation", "To Linked Accounts Screen (${AppRoutes.LINKED_ACCOUNTS_SCREEN})");
  }
}
