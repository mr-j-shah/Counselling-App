import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/SettingsScreen/controller/SettingsController.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
