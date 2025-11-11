import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/ReminderScreen/controller/ReminderController.dart';

class ReminderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReminderController>(() => ReminderController());
  }
}
