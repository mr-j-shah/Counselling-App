import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/AvatarDetail/controller/AvatarDetailController.dart';

class AvatarDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvatarDetailController());
  }
}
