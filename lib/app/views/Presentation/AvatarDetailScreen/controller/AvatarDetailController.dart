import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/Avatar.dart';

class AvatarDetailController extends GetxController {
  late final Avatar avatar;

  @override
  void onInit() {
    super.onInit();
    // Retrieve the Avatar object passed from the previous screen.
    avatar = Get.arguments as Avatar;
  }
}
