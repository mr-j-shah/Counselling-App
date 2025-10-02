import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../routers/AppRoutes.dart';

class SettingsController extends GetxController {
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
    // TODO: Load initial settings if needed from storage (e.g., GetStorage) or API
  }

  void toggleTextMessages(bool value) {
    textMessagesEnabled.value = value;
    // TODO: Save this preference (e.g., using GetStorage)
    Get.snackbar("Settings Updated", "Text messages ${value ? 'enabled' : 'disabled'}");
  }

  void togglePhoneCalls(bool value) {
    phoneCallsEnabled.value = value;
    // TODO: Save this preference (e.g., using GetStorage)
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
    // Get.toNamed(AppRoutes.ABOUT_US_SCREEN);
    // Get.snackbar("Navigation", "To About Us Screen (${AppRoutes.ABOUT_US_SCREEN})");
  }

  void changeLanguage() {
    // Get.toNamed(AppRoutes.LANGUAGE_SELECTION_SCREEN);
    // Get.snackbar("Navigation", "To Language Selection Screen (${AppRoutes.LANGUAGE_SELECTION_SCREEN})");
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