import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/AddRecordsScreen/controller/AddRecordsController.dart';
import 'package:project_counselling/app/views/Presentation/AddRecordsScreen/model/RecordType.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart'; // Assuming your primaryColor is here

class AddRecordsScreen extends StatelessWidget {
  const AddRecordsScreen({super.key});

  Widget _buildRecordTypeIcon(AddRecordsController controller, RecordType type, IconData icon, String label) {
    return Obx(() => GestureDetector(
      onTap: () => controller.selectRecordType(type),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.padding(12)),
            decoration: BoxDecoration(
              color: controller.selectedRecordType.value == type ? primaryColor.withOpacity(0.1) : Colors.grey[200],
              borderRadius: BorderRadius.circular(Dimensions.radius(10)),
              border: Border.all(
                color: controller.selectedRecordType.value == type ? primaryColor : Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            child: Icon(
              icon, 
              size: Dimensions.font(28),
              color: controller.selectedRecordType.value == type ? primaryColor : Colors.grey[700],
            ),
          ),
          SizedBox(height: Dimensions.height(8)),
          Text(label, style: TextStyle(fontSize: Dimensions.font(12), color: controller.selectedRecordType.value == type ? primaryColor : Colors.grey[700])),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final AddRecordsController controller = Get.find<AddRecordsController>();
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: 'Add Records'),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(Dimensions.padding(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Section
                      SizedBox(
                        height: Dimensions.height(120),
                        child: Obx(() => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.selectedImages.length + 1,
                              itemBuilder: (context, index) {
                                if (index == controller.selectedImages.length) {
                                  // "Add more images" button
                                  return GestureDetector(
                                    onTap: controller.addMoreImages,
                                    child: Container(
                                      width: Dimensions.width(100),
                                      margin: EdgeInsets.only(right: Dimensions.width(8)),
                                      decoration: BoxDecoration(
                                        color: Colors.teal[50], // Light teal background
                                        borderRadius: BorderRadius.circular(Dimensions.radius(12)),
                                        border: Border.all(color: Colors.teal[200]!, width: 1),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add_circle_outline, color: primaryColor, size: Dimensions.font(30)),
                                          SizedBox(height: Dimensions.height(4)),
                                          Text("Add more images", textAlign: TextAlign.center, style: TextStyle(fontSize: Dimensions.font(12), color: primaryColor)),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                // Display selected image (placeholder)
                                return Container(
                                  width: Dimensions.width(100),
                                  height: Dimensions.height(120),
                                  margin: EdgeInsets.only(right: Dimensions.width(8)),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(Dimensions.radius(12)),
                                    image: controller.selectedImages[index] == "mock_image_placeholder.png" 
                                           ? const DecorationImage(image: AssetImage('assets/images/profile_placeholder.png'), fit: BoxFit.cover) // Replace with your placeholder asset
                                           : null, // Handle other image types later (e.g., FileImage)
                                  ),
                                  child: controller.selectedImages[index] != "mock_image_placeholder.png" 
                                         ? Center(child: Text(controller.selectedImages[index])) // Show placeholder text for new images
                                         : null,
                                );
                              },
                            )),
                      ),
                      SizedBox(height: Dimensions.height(24)),

                      // Record For
                      Text("Record for", style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                      SizedBox(height: Dimensions.height(8)),
                      Obx(() => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(controller.recordFor.value, style: textTheme.titleLarge?.copyWith(color: primaryColor, fontWeight: FontWeight.w500)),
                        trailing: IconButton(icon: Icon(Icons.edit_outlined, color: Colors.grey.shade600), onPressed: controller.editRecordFor),
                      )),
                      Divider(height: Dimensions.height(24)),

                      // Type of record
                      Text("Type of record", style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                      SizedBox(height: Dimensions.height(16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildRecordTypeIcon(controller, RecordType.Report, Icons.assessment_outlined, "Report"),
                          _buildRecordTypeIcon(controller, RecordType.Prescription, Icons.description_outlined, "Prescription"), // Replace with actual prescription icon
                          _buildRecordTypeIcon(controller, RecordType.Invoice, Icons.receipt_long_outlined, "Invoice"),
                        ],
                      ),
                      Divider(height: Dimensions.height(24)),

                      // Record created on
                      Text("Record created on", style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                      SizedBox(height: Dimensions.height(8)),
                      Obx(() => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(controller.formattedRecordDate, style: textTheme.titleLarge?.copyWith(color: primaryColor, fontWeight: FontWeight.w500)),
                        trailing: IconButton(icon: Icon(Icons.edit_calendar_outlined, color: Colors.grey.shade600), onPressed: () => controller.editRecordDate(context)),
                      )),
                      SizedBox(height: Dimensions.height(30)),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.padding(16)),
                child: ElevatedButton(
                  onPressed: controller.uploadRecord,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: Size(double.infinity, Dimensions.height(50)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius(12))),
                  ),
                  child: Text("Upload record", style: textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
