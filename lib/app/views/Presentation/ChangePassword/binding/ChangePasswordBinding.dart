import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/ChangePassword/controller/ChangePasswordController.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}
