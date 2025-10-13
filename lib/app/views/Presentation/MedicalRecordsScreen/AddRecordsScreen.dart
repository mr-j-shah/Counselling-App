import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart'; // Added for PrimaryButton
import 'package:project_counselling/app/views/Presentation/MedicalRecordsScreen/controller/AddRecordsController.dart';
import 'package:project_counselling/app/views/Presentation/MedicalRecordsScreen/model/RecordType.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';

import '../HomeScreen/widgets/HomeBottomnavigation.dart';

class AddRecordsScreen extends StatelessWidget {
  const AddRecordsScreen({super.key});

  Widget _buildRecordTypeIcon(
    AddRecordsController controller,
    RecordType type,
    IconData icon,
    String label,
  ) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.selectRecordType(type),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.padding(12)),
              decoration: BoxDecoration(
                color: controller.selectedRecordType.value == type
                    ? primaryColor.withOpacity(0.1)
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(Dimensions.radius(10)),
                border: Border.all(
                  color: controller.selectedRecordType.value == type
                      ? primaryColor
                      : Colors.grey[300]!,
                  width: 1.5,
                ),
              ),
              child: Icon(
                icon,
                size: Dimensions.font(28),
                color: controller.selectedRecordType.value == type
                    ? primaryColor
                    : Colors.grey[700],
              ),
            ),
            SizedBox(height: Dimensions.height(8)),
            Text(
              label,
              style: TextStyle(
                fontSize: Dimensions.font(12),
                color: controller.selectedRecordType.value == type
                    ? primaryColor
                    : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final AddRecordsController controller = Get.find<AddRecordsController>();
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column( // Main screen Column
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppbar(title: Appstring.addMedicalRecord), // Assuming Appstring.addMedicalRecord is correct title
              Expanded( // This Expanded gives bounded height to the Column below
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image Selection Area (Fixed Height)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.padding(16),
                        vertical: Dimensions.padding(16),
                      ),
                      child: SizedBox(
                        height: Dimensions.height(120),
                        child: Obx(
                          () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.selectedImages.length + 1,
                            itemBuilder: (context, index) {
                              if (index == controller.selectedImages.length) {
                                return GestureDetector(
                                  onTap: controller.addMoreImages,
                                  child: Container(
                                    width: Dimensions.width(100),
                                    margin: EdgeInsets.only(right: Dimensions.width(8)),
                                    decoration: BoxDecoration(
                                      color: Colors.teal[50],
                                      borderRadius: BorderRadius.circular(Dimensions.radius(12)),
                                      border: Border.all(color: Colors.teal[200]!, width: 1),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_circle_outline, color: primaryColor, size: Dimensions.font(30)),
                                        SizedBox(height: Dimensions.height(4)),
                                        Text("Add more", textAlign: TextAlign.center, style: TextStyle(fontSize: Dimensions.font(12), color: primaryColor)),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return Container(
                                width: Dimensions.width(100),
                                height: Dimensions.height(120),
                                margin: EdgeInsets.only(right: Dimensions.width(8)),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(Dimensions.radius(12)),
                                  image: controller.selectedImages[index] == "mock_image_placeholder.png"
                                      ? const DecorationImage(image: AssetImage('assets/images/profile_placeholder.png'), fit: BoxFit.cover)
                                      : null,
                                ),
                                child: controller.selectedImages[index] != "mock_image_placeholder.png"
                                    ? Center(child: Text(controller.selectedImages[index]))
                                    : null,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.padding(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Appstring.recordFor, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                            SizedBox(height: Dimensions.height(8)),
                            Obx(() => ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(controller.recordFor.value, style: textTheme.titleLarge?.copyWith(color: primaryColor, fontWeight: FontWeight.w500)),
                                  trailing: IconButton(icon: Icon(Icons.edit_outlined, color: Colors.grey.shade600), onPressed: controller.editRecordFor),
                                )),
                            Divider(height: Dimensions.height(24)),
                            Text("Type of record", style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                            SizedBox(height: Dimensions.height(16)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildRecordTypeIcon(controller, RecordType.Report, Icons.assessment_outlined, "Report"),
                                _buildRecordTypeIcon(controller, RecordType.Prescription, Icons.description_outlined, "Prescription"),
                                _buildRecordTypeIcon(controller, RecordType.Invoice, Icons.receipt_long_outlined, "Invoice"),
                              ],
                            ),
                            Divider(height: Dimensions.height(24)),
                            Text("Record created on", style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                            SizedBox(height: Dimensions.height(8)),
                            Obx(() => ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(controller.formattedRecordDate, style: textTheme.titleLarge?.copyWith(color: primaryColor, fontWeight: FontWeight.w500)),
                                  trailing: IconButton(icon: Icon(Icons.edit_outlined, color: Colors.grey.shade600), onPressed: () => controller.editRecordDate(context)),
                                )),
                            SizedBox(height: Dimensions.height(24)), // Space before button
                            Center(
                              child: PrimaryButton( // Changed from ElevatedButton
                                text: "Upload record",
                                onPressed: controller.uploadRecord,
                              ),
                            ),
                            SizedBox(height: Dimensions.height(10)), // Bottom padding within the card's scrollable area
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
