import 'package:get/get.dart';
import '../controller/AvatarDetailController.dart';

class AvatarDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvatarDetailController());
  }
}
