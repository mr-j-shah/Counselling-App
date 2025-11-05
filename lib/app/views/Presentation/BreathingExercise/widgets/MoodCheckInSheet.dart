import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/BottomSheetHandle.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

void showMoodCheckInSheet({
  required BuildContext context,
  required String title,
  required Function(int) onMoodSelected,
}) {
  final selectedMood = 5.obs; // Default to a neutral mood

  Get.bottomSheet(
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
            const Bottomsheethandle(),
            AppText(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            const AppText(
              text: "Rate your current stress/anxiety level on a scale of 1-10.",
              fontSize: 14,
              color: bottomSheetSubtitle,
              align: TextAlign.center,
            ),
            SizedBox(height: Dimensions.height(20)),
            Obx(() => AppText(
                  text: "${selectedMood.value}",
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                )),
            Obx(() => Slider(
                  value: selectedMood.value.toDouble(),
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: selectedMood.value.toString(),
                  onChanged: (value) => selectedMood.value = value.toInt(),
                  activeColor: primaryColor,
                )),
            SizedBox(height: Dimensions.height(20)),
            PrimaryButton(
              text: "Continue",
              onPressed: () async {
                Get.back();
                await onMoodSelected(selectedMood.value);
              },
            ),
            SizedBox(height: Dimensions.height(30)),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
