import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/TopDoctors/controller/TopDoctorsController.dart';

class TopDoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopDoctorsController());
  }
}
