import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/BreathingExercise/controller/BreathingController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

import '../../../Constants/AppAssets.dart';

class BreathingExerciseScreen extends GetView<BreathingController> {
  const BreathingExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Obx(() {
            return Column(
              children: [
                CustomAppbar(title: "Box Breathing"),
                Expanded(
                  child: controller.isExercising.value
                      ? _buildExerciseView()
                      : _buildSelectionView(),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildSelectionView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // This is a placeholder to push the content down slightly, matching the exercise view's layout.
        const SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Appassets.BreathingExerciseImage,
                  width: Dimensions.width(200)),
              SizedBox(height: Dimensions.height(10)),
              AppText(
                align: TextAlign.center,
                style: TextStyle(
                    fontSize: Dimensions.font(18),
                    fontWeight: FontWeight.normal),
                text:
                    "A simple yet powerful breathing technique that helps calm the mind and reduce stress. Inhale for 4 seconds, hold for 4 seconds, exhale for 4 seconds — then repeat.",
              ),
              SizedBox(height: Dimensions.height(30)),
              AppText(
                style: TextStyle(
                    fontSize: Dimensions.font(22), fontWeight: FontWeight.bold),
                text: "Select Duration",
              ),
              SizedBox(height: Dimensions.height(30)),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [2, 5, 10].map((minutes) {
                      final isSelected =
                          controller.selectedDuration.value == minutes;
                      return GestureDetector(
                        onTap: () => controller.setDuration(minutes),
                        child: Container(
                          width: Dimensions.width(100),
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height(14)),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? primaryColor.withOpacity(0.1)
                                : Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius(30)),
                            border: Border.all(
                              color: isSelected
                                  ? primaryColor
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: AppText(
                              text: "$minutes min",
                              style: TextStyle(
                                fontSize: Dimensions.font(16),
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? primaryColor
                                    : Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: Dimensions.height(40)),
          child: Column(
            children: [
              Opacity(
                opacity: 0.0,
                child: Text(
                  "00:00",
                  style: TextStyle(
                      fontSize: Dimensions.font(48),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: Dimensions.height(20)),
              PrimaryButton(
                text: "Start",
                onPressed: controller.startExercise,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
        Obx(() => AnimatedContainer(
              duration: const Duration(seconds: 4),
              width: Dimensions.width(controller.circleSize.value),
              height: Dimensions.width(controller.circleSize.value),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.8),
              ),
              child: Center(
                child: Text(
                  controller.breathingStateText,
                  style: TextStyle(
                    fontSize: Dimensions.font(28),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(bottom: Dimensions.height(40)),
          child: Column(
            children: [
              Obx(() => Text(
                    "${(controller.remainingTime.value ~/ 60).toString().padLeft(2, '0')}:${(controller.remainingTime.value % 60).toString().padLeft(2, '0')}",
                    style: TextStyle(fontSize: Dimensions.font(48), fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: Dimensions.height(20)),
              PrimaryButton(
                text: "Stop",
                onPressed: controller.stopExercise,
                backgroundColor: Colors.redAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
