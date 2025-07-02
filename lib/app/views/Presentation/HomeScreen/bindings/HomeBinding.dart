import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/SideMenuController.dart';


class Homebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Homecontroller>(() => Homecontroller());
    Get.lazyPut<Sidemenucontroller>(()=>Sidemenucontroller());
  }
}