import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/PopularProfiles/controller/PopularProfilesController.dart';

class PopularProfilesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopularProfilesController());
  }
}
