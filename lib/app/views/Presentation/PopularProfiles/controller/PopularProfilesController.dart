import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/Avatar.dart';

class PopularProfilesController extends GetxController {
  late final List<Avatar> avatarList;

  @override
  void onInit() {
    super.onInit();
    avatarList = Get.arguments as List<Avatar>;
  }
}
