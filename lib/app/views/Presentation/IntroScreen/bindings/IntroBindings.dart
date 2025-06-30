import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/IntroScreen/controller/IntroController.dart';


class Introbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Introcontroller>(() => Introcontroller());
  }
}