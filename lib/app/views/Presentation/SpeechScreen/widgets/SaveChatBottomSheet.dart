import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/controller/SpeechController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

import '../../../AppWidgets/BottomSheetHandle.dart';

void showSaveChatBottomSheet(BuildContext context) {
  final SpeechController controller = Get.find<SpeechController>();

  Get.bottomSheet(
    isDismissible: true, // Allow dismissing by tapping outside
    SafeArea(
      child: Container(
        padding: EdgeInsets.all(Dimensions.padding(24)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius(20)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Handle
            Bottomsheethandle(),
            Container(
              padding: EdgeInsets.all(Dimensions.padding(20)),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.save_alt_rounded,
                color: primaryColor,
                size: Dimensions.font(50),
              ),
            ),
            SizedBox(height: Dimensions.height(24)),
            AppText(
              text: "Save Your Session?",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            AppText(
              text: "Do you want to save this chat session before you leave?",
              align: TextAlign.center,
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
            SizedBox(height: Dimensions.height(24)),
            PrimaryButton(
              text: "Save Chat",
              onPressed: () {
                // controller.saveChatSession();
                if (Get.isBottomSheetOpen ?? false) {
                  Get.back(); // Close bottom sheet
                }
                Get.back(); // Navigate back from screen
              },
            ),
            SizedBox(height: Dimensions.height(12)),
            TextButton(
              onPressed: () {
                if (Get.isBottomSheetOpen ?? false) {
                  Get.back(); // Close bottom sheet
                }
                Get.back(); // Navigate back from screen
              },
              child: AppText(
                text: "Don't Save",
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: Dimensions.height(10)),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
