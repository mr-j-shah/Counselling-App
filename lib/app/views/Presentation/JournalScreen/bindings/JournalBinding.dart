import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/JournalScreen/controller/JournalController.dart';

class JournalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JournalController>(() => JournalController());
  }
}
