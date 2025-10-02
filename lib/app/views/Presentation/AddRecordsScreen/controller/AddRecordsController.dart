import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_counselling/app/views/Presentation/AddRecordsScreen/model/RecordType.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart'; // Added import for primaryColor

class AddRecordsController extends GetxController {
  var selectedImages = <String>[].obs;
  var recordFor = "Abdullah Mamun".obs;
  var selectedRecordType = RecordType.Prescription.obs;
  var recordDate = DateTime.now().obs;

  String get formattedRecordDate =>
      DateFormat('dd MMM, yyyy').format(recordDate.value);

  @override
  void onInit() {
    super.onInit();
    // selectedImages.add("mock_image_placeholder.png");
  }

  void addMoreImages() {
    selectedImages.add("new_mock_image.png");
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
      builder: (BuildContext context, Widget? child) {
        // Added builder to theme the picker
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor, // Your app's primary color
              onPrimary: Colors.white, // Text color on primary color
              surface: Colors.white, // Background of the picker
              onSurface: Colors.black, // Text color on the surface
            ),
            dialogBackgroundColor: Colors.white,
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != recordDate.value) {
      recordDate.value = picked;
    }
  }

  void editRecordFor() {
    final TextEditingController textEditingController = TextEditingController(
      text: recordFor.value,
    );

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Rounded corners
        ),
        title: const Text("Edit Patient Name"),
        content: SingleChildScrollView( // Wrap with SingleChildScrollView to prevent overflow
          child: TextField(
            controller: textEditingController,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "Full Name",
              hintText: "Enter the patient's full name",
              // Style to match app UI
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              labelStyle: TextStyle(color: primaryColor),
            ),
            cursorColor: primaryColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // Close the dialog
            child: Text("Cancel", style: TextStyle(color: Colors.grey.shade600)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor, // Use app's primary color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {
              if (textEditingController.text.isNotEmpty) {
                recordFor.value = textEditingController.text;
              }
              Get.back(); // Close the dialog
            },
            child: const Text("Update", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void editRecordDate(BuildContext context) {
    selectDate(context);
  }

  void uploadRecord() {
    Get.snackbar(
      "Upload Record",
      "Record for ${recordFor.value} (${selectedRecordType.value.toString().split('.').last}) on $formattedRecordDate submitted! (Mock)",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
