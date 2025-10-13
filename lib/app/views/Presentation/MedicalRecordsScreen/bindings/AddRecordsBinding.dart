import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/MedicalRecordsScreen/controller/AddRecordsController.dart';

class AddRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRecordsController>(() => AddRecordsController());
  }
}
