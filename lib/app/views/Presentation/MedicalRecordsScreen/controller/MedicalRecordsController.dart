import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/MedicalRecordsScreen/model/MedicalRecordModel.dart';

class MedicalRecordsController extends GetxController {
  var medicalRecords = <MedicalRecordModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMedicalRecords();
  }

  Future<void> fetchMedicalRecords() async {
    try {
      isLoading(true);
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1)); // Reduced delay for faster testing
      
      // TODO: Replace with actual API call
      final List<MedicalRecordModel> fetchedRecords = [
        MedicalRecordModel(
          id: '1',
          title: 'Records added by you',
          recordedFor: 'Abdullah mamun',
          date: DateTime(DateTime.now().year, 2, 27), // Assuming current year, Feb 27
          summary: '1 Prescription',
          isNew: true,
        ),
        MedicalRecordModel(
          id: '2',
          title: 'Records added by you',
          recordedFor: 'Abdullah shuvo',
          date: DateTime(DateTime.now().year, 2, 28), // Assuming current year, Feb 28
          summary: '1 Prescription',
          isNew: true,
        ),
        MedicalRecordModel(
          id: '3',
          title: 'Records added by you',
          recordedFor: 'Shruti Kedia',
          date: DateTime(DateTime.now().year, 3, 1), // Assuming current year, Mar 1
          summary: '1 Prescription',
          isNew: true,
        ),
      ];
      
      medicalRecords.assignAll(fetchedRecords);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch medical records: ${e.toString()}');
      // In case of error, ensure records are empty to show empty state or handle appropriately
      medicalRecords.clear(); 
    } finally {
      isLoading(false);
    }
  }

  void navigateToAddMedicalRecord() {
    // TODO: Define and navigate to the AddMedicalRecordScreen
    // For example: Get.toNamed(Routes.ADD_MEDICAL_RECORD_SCREEN);
    Get.snackbar('Navigate', 'To Add Medical Record Screen (Not Implemented)');
    // After adding a record, you might want to refresh the list:
    // fetchMedicalRecords(); 
  }
}
