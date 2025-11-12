import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/AmbientMixerScreen/controller/AmbientAIController.dart';

class AmbientAIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AmbientAIController>(() => AmbientAIController());
  }
}
