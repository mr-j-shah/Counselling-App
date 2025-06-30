import 'package:get/get.dart';
import 'package:project_counselling/app/models/language.dart';
import 'package:project_counselling/app/routers/app_routes.dart';

class Homecontroller extends GetxController {

  var isMenuOpen = false.obs;

  @override
  void onInit() {
    super.onInit();
    print("CounterController initialized!");
  }

  @override
  void onClose() {
    print("CounterController disposed!");
    super.onClose();
  }

  void navigateToCounsellingHindi(){
    Get.toNamed(Routes.SPEECH_TEXT, arguments: Language.HINDI);
  }
  void navigateToCounsellingEnglish(){
    Get.toNamed(Routes.SPEECH_TEXT, arguments: Language.ENGLISH);
  }

  void toggleMenu() => isMenuOpen.value = !isMenuOpen.value;
}