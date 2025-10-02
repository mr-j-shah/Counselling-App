import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_counselling/app/views/Presentation/AddRecordsScreen/model/RecordType.dart';

class AddRecordsController extends GetxController {
  // Observables for UI state
  var selectedImages = <String>[].obs; // Placeholder for image paths or identifiers
  var recordFor = "Abdullah Mamun".obs; // Default or fetched user
  var selectedRecordType = RecordType.Prescription.obs;
  var recordDate = DateTime.now().obs;

  // For displaying the formatted date
  String get formattedRecordDate => DateFormat('dd MMM, yyyy').format(recordDate.value);

  @override
  void onInit() {
    super.onInit();
    // Add a mock image for initial display if needed
    // selectedImages.add("mock_image_placeholder.png"); // Replace with actual placeholder or logic
  }

  void addMoreImages() {
    // TODO: Implement image picking logic (gallery/camera)
    selectedImages.add("new_mock_image.png"); // Placeholder action
    Get.snackbar("Image Added", "Placeholder for adding more images.");
  }

  void selectRecordType(RecordType type) {
    selectedRecordType.value = type;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: recordDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != recordDate.value) {
      recordDate.value = picked;
    }
  }

  void editRecordFor() {
    // TODO: Implement logic to change the person for whom the record is
    Get.snackbar("Edit Record For", "Placeholder for editing patient name.");
  }

   void editRecordDate(BuildContext context) {
    selectDate(context);
  }

  void uploadRecord() {
    // TODO: Implement actual record upload logic (API call)
    Get.snackbar(
      "Upload Record", 
      "Record for ${recordFor.value} (${selectedRecordType.value.toString().split('.').last}) on $formattedRecordDate submitted! (Mock)",
      snackPosition: SnackPosition.BOTTOM,
    );
    // Potentially navigate back or clear form
    // Get.back();
  }
}
