import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/CustomerProfile/controller/ProfileScreenController.dart';

class Profilescreenbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Profilescreencontroller());
  }
}
