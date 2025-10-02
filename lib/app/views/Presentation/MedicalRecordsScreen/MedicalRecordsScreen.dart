import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Added for date formatting
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/MedicalRecordsScreen/controller/MedicalRecordsController.dart';
import 'package:project_counselling/app/views/Presentation/MedicalRecordsScreen/model/MedicalRecordModel.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final MedicalRecordsController controller = Get.find<MedicalRecordsController>();
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: 'Medical Records'),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.medicalRecords.isEmpty) {
                    // Modified to pass only necessary params, button is now global
                    return _buildEmptyStateUI(context, textTheme);
                  }
                  return ListView.builder(
                    padding: EdgeInsets.all(Dimensions.padding(16)),
                    itemCount: controller.medicalRecords.length,
                    itemBuilder: (context, index) {
                      final record = controller.medicalRecords[index];
                      return _buildRecordItem(context, record, textTheme);
                    },
                  );
                }),
              ),
              // "Add a record" button, visible when not loading
              Obx(() {
                if (controller.isLoading.value) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: EdgeInsets.all(Dimensions.padding(16)),
                  child: ElevatedButton(
                    onPressed: controller.navigateToAddMedicalRecord,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1ABC9C), // Teal color from screenshot
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width(32),
                        vertical: Dimensions.height(14),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.radius(12)),
                      ),
                      minimumSize: Size(double.infinity, Dimensions.height(50)), // Full width
                    ),
                    child: Text(
                      'Add a record',
                      style: textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Updated Empty State UI (button removed from here)
  Widget _buildEmptyStateUI(BuildContext context, TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.padding(24)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/medical_clipboard.png', // Placeholder - replace with your actual asset path
            height: Dimensions.height(120),
            // Consider adding a color if it's an icon that needs tinting
          ),
          SizedBox(height: Dimensions.height(24)),
          Text(
            'Add a medical record.',
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Dimensions.height(8)),
          Text(
            'A detailed health history helps a doctor diagnose you better.',
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordItem(BuildContext context, MedicalRecordModel record, TextTheme textTheme) {
    return Card(
      margin: EdgeInsets.only(bottom: Dimensions.height(16)),
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius(12))),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.padding(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: Dimensions.width(60),
                  padding: EdgeInsets.symmetric(vertical: Dimensions.height(8)),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1ABC9C).withOpacity(0.8), // Teal color from screenshot
                    borderRadius: BorderRadius.circular(Dimensions.radius(8)),
                  ),
                  child: Column(
                    children: [
                      Text(DateFormat('dd').format(record.date), style: textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text(DateFormat('MMM').format(record.date).toUpperCase(), style: textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height(8)),
                if (record.isNew)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width(10), vertical: Dimensions.height(4)),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.circular(Dimensions.radius(4)),
                      border: Border.all(color: Colors.blueGrey.shade200, width: 0.5)
                    ),
                    child: Text('NEW', style: textTheme.labelSmall?.copyWith(color: const Color(0xFF1ABC9C), fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                  ),
              ],
            ),
            SizedBox(width: Dimensions.width(16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(record.title, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87)),
                  SizedBox(height: Dimensions.height(4)),
                  Text(
                    'Record for ${record.recordedFor}',
                    style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF1ABC9C), fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: Dimensions.height(8)),
                  Text(record.summary, style: textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.grey.shade500),
              onPressed: () {
                Get.snackbar('Info', 'More options for ${record.recordedFor}');
              },
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
