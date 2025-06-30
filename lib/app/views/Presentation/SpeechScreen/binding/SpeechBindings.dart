import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/controller/SpeechController.dart';

class SpeechBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeechController>(() => SpeechController(),fenix: true);
  }
}