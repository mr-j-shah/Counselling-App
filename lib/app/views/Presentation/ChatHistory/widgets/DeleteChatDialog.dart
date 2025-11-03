import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

void showDeleteChatDialog(BuildContext context, {required VoidCallback onConfirm}) {
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
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outline_rounded,
                color: Colors.red,
                size: Dimensions.font(50),
              ),
            ),
            SizedBox(height: Dimensions.height(24)),
            AppText(
              text: "Delete Chat?",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            AppText(
              text: "Are you sure you want to permanently delete this chat session?",
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
                    text: "Cancel",
                    onPressed: () => Get.back(), // Just close the dialog
                    backgroundColor: Colors.grey.shade300,
                    textColor: Colors.black87,
                  ),
                ),
                SizedBox(width: Dimensions.width(16)),
                Expanded(
                  child: PrimaryButton(
                    text: "Delete",
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
