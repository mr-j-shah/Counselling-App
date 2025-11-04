import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

void showExerciseCompleteDialog(BuildContext context) {
  debugPrint("Visible Dialog");
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius(20)),
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.padding(24)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.padding(20)),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up_alt_rounded,
                color: primaryColor,
                size: Dimensions.font(50),
              ),
            ),
            SizedBox(height: Dimensions.height(24)),
            AppText(
              text: "Well Done!",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            AppText(
              text: "You've successfully completed the breathing exercise.",
              align: TextAlign.center,
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
            SizedBox(height: Dimensions.height(24)),
            PrimaryButton(
              text: "Done",
              onPressed: () {
                Get.back(); // Close the dialog
              },
            ),
          ],
        ),
      ),
    ),
  );
}
