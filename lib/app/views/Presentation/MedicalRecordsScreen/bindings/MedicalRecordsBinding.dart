import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/MedicalRecordsScreen/controller/MedicalRecordsController.dart';

class MedicalRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalRecordsController>(() => MedicalRecordsController());
  }
}
