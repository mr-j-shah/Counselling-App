import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/controller/AuthContoller.dart';

class Authbinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<Authcontroller>(() => Authcontroller(),fenix: true);
  }
  
}