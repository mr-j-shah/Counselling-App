import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/BottomSheetHandle.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/BreathingExercise/controller/BreathingController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

void showCustomRhythmEditor(BuildContext context) {
  final BreathingController controller = Get.find<BreathingController>();

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
            const AppText(
              text: "Custom Rhythm Editor",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            const AppText(
              text: "Adjust the duration for each phase of the exercise.",
              fontSize: 14,
              color: bottomSheetSubtitle,
              align: TextAlign.center,
            ),
            SizedBox(height: Dimensions.height(20)),
            _buildSlider("Inhale", controller.inhaleDuration, (value) => controller.inhaleDuration.value = value.toInt()),
            _buildSlider("Hold", controller.holdDuration, (value) => controller.holdDuration.value = value.toInt()),
            _buildSlider("Exhale", controller.exhaleDuration, (value) => controller.exhaleDuration.value = value.toInt()),
            SizedBox(height: Dimensions.height(20)),
            PrimaryButton(
              text: "Apply",
              onPressed: () => Get.back(),
            ),
            SizedBox(height: Dimensions.height(30)),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}

Widget _buildSlider(String label, RxInt value, ValueChanged<double> onChanged) {
  return Row(
    children: [
      SizedBox(
        width: Dimensions.width(80),
        child: AppText(text: label, fontSize: 16),
      ),
      Expanded(
        child: Obx(() => Slider(
              value: value.value.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: value.value.toString(),
              onChanged: onChanged,
              activeColor: primaryColor,
            )),
      ),
      Obx(() => AppText(text: "${value.value}s", fontSize: 16, fontWeight: FontWeight.bold)),
    ],
  );
}
