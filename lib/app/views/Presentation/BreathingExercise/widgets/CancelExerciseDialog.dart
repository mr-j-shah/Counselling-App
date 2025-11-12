import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

void showCancelExerciseDialog(BuildContext context, {required VoidCallback onConfirm}) {
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
                color: Colors.orange.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange,
                size: Dimensions.font(50),
              ),
            ),
            SizedBox(height: Dimensions.height(24)),
            AppText(
              text: "Cancel Exercise?",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            AppText(
              text: "Are you sure you want to stop the breathing exercise?",
              align: TextAlign.center,
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
            SizedBox(height: Dimensions.height(24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "No",
                    onPressed: () => Get.back(), // Just close the dialog
                    backgroundColor: Colors.grey.shade300,
                    textColor: Colors.black87,
                  ),
                ),
                SizedBox(width: Dimensions.width(16)),
                Expanded(
                  child: PrimaryButton(
                    text: "Yes",
                    onPressed: onConfirm,
                    backgroundColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
