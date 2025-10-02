import 'package:flutter/material.dart'; // Added for BuildContext
import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/MedicalRecordsScreen/model/MedicalRecordModel.dart';
import 'package:project_counselling/app/views/Presentation/MedicalRecordsScreen/widgets/AddRecordBottomSheet.dart'; // Added import
import 'package:project_counselling/app/routers/AppRoutes.dart'; // Added import
import 'package:project_counselling/app/views/Utils/Loading.dart';

import '../../../../Constants/AppString.dart';
import '../../../AppWidgets/AppText.dart';
import '../../../AppWidgets/AppTextField.dart';
import '../../../AppWidgets/BottomSheetHandle.dart';
import '../../../AppWidgets/PrimaryButton.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/Dimensions.dart';

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
      
      final List<MedicalRecordModel> fetchedRecords = [
        MedicalRecordModel(
          id: '1',
          title: 'Records added by you',
          recordedFor: 'Abdullah mamun',
          date: DateTime(DateTime.now().year, 2, 27),
          summary: '1 Prescription',
          isNew: true,
        ),
        MedicalRecordModel(
          id: '2',
          title: 'Records added by you',
          recordedFor: 'Abdullah shuvo',
          date: DateTime(DateTime.now().year, 2, 28),
          summary: '1 Prescription',
          isNew: true,
        ),
        MedicalRecordModel(
          id: '3',
          title: 'Records added by you',
          recordedFor: 'Shruti Kedia',
          date: DateTime(DateTime.now().year, 3, 1),
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

  void _navigateToActualAddScreen() {
    // This will be the common action for all bottom sheet options for now
    Get.toNamed(Routes.ADD_RECORDS_SCREEN);
  }

  void navigateToAddMedicalRecord() {
    Get.bottomSheet(
      AddRecordBottomSheet(
        onTakePhoto: () {
          // TODO: Implement take photo logic
          Get.snackbar("Take Photo", "Camera functionality not implemented yet.");
          _navigateToActualAddScreen();
        },
        onUploadFromGallery: () {
          // TODO: Implement upload from gallery logic
          Get.snackbar("Upload Gallery", "Gallery functionality not implemented yet.");
          _navigateToActualAddScreen();
        },
        onUploadFiles: () {
          // TODO: Implement upload files logic
          Get.snackbar("Upload Files", "File picker functionality not implemented yet.");
          _navigateToActualAddScreen();
        },
      ),
      isScrollControlled: true, // Important for fitting content
      backgroundColor: Colors.transparent, // To use the bottom sheet's own decoration
    );
  }

  void showForgotPasswordBottomSheet(BuildContext context) {
    Dimensions.init(context);
    Get.bottomSheet(
      SafeArea(
        child: Container(
          padding: EdgeInsets.all(Dimensions.padding(20)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(Dimensions.width(30)),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Bottomsheethandle(),
              AppText(text:
              Appstring.forgotPasTitle,
                  fontSize: 20, fontWeight: FontWeight.bold
              ),
              SizedBox(height: Dimensions.height(8)),
              AppText(
                text:
                Appstring.forgotPasSubTitle,
                fontSize: 14,
                color: bottomSheetSubtitle,
              ),
              SizedBox(height: Dimensions.height(20)),
              Apptextfield(
                controller: TextEditingController(),
                hintText: Appstring.email,
              ),
              SizedBox(height: Dimensions.height(20)),
              Center(child: PrimaryButton(text: Appstring.continueTxt, onPressed: () {})),
              SizedBox(height: Dimensions.height(30)),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

}
