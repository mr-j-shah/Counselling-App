import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/BreathingExercise/controller/BreathingController.dart';

class BreathingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BreathingController());
  }
}
