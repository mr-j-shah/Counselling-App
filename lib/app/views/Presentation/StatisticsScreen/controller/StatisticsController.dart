import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:project_counselling/app/data/repos/BreathingRepository.dart';
import 'package:project_counselling/app/models/BreathingSession.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart'; // Import PrimaryButton
import 'package:project_counselling/app/views/Utils/Colors.dart'; // Import Colors for primaryColor
import 'package:project_counselling/app/views/Utils/Dimensions.dart'; // Import Dimensions

class StatisticsController extends GetxController {
  final BreathingRepository _breathingRepository = Get.find<BreathingRepository>();

  var sessions = <BreathingSession>[].obs;
  var isLoading = true.obs;

  // Summary stats
  var totalSessions = 0.obs;
  var totalTime = 0.obs;
  var avgMoodImprovement = 0.0.obs;

  // Chart data
  var weeklyChartData = <int, double>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSessions();
  }

  void fetchSessions() async {
    try {
      isLoading(true);
      sessions.value = await _breathingRepository.getSessions();
      _processData();
    } finally {
      isLoading(false);
    }
  }

  void _processData() {
    if (sessions.isEmpty) {
      totalSessions.value = 0;
      totalTime.value = 0;
      avgMoodImprovement.value = 0.0;
      weeklyChartData.value = {};
      return;
    }

    // Calculate summary stats
    totalSessions.value = sessions.length;
    totalTime.value = sessions.map((s) => s.duration).sum;

    final moodImprovements = sessions
        .where((s) => s.postMood > s.preMood)
        .map((s) => s.postMood - s.preMood);

    if (moodImprovements.isNotEmpty) {
      avgMoodImprovement.value = moodImprovements.average;
    } else {
      avgMoodImprovement.value = 0.0;
    }

    // Process data for the weekly bar chart (last 7 days)
    final today = DateTime.now();
    final last7Days = List.generate(7, (i) => today.subtract(Duration(days: i)));

    final Map<int, double> dailyTotals = {};
    for (var day in last7Days) {
      final sessionsOnDay = sessions.where((s) =>
          s.timestamp.year == day.year &&
          s.timestamp.month == day.month &&
          s.timestamp.day == day.day);
      dailyTotals[day.weekday] = sessionsOnDay.map((s) => s.duration).sum.toDouble();
    }

    // Ensure all 7 days of the week are present for the chart
    final processedData = <int, double>{};
    for (int i = 1; i <= 7; i++) {
      processedData[i] = dailyTotals[i] ?? 0.0;
    }
    weeklyChartData.value = processedData;
    
  }

  void startNewSession() {
    Get.toNamed(Routes.BREATHING_EXERCISE_SCREEN);
  }

  void showClearDataConfirmationDialog() {
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
              const AppText(
                text: "Clear All Data?",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: Dimensions.height(8)),
              const AppText(
                text:
                    "Are you sure you want to clear all your breathing session data? This action cannot be undone.",
                align: TextAlign.center,
                color: Colors.grey,
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
                      text: "Yes, Clear",
                      onPressed: () {
                        Get.back(); // Close the dialog
                        clearBreathingSessionData();
                      },
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

  void clearBreathingSessionData() async {
    isLoading(true);
    await _breathingRepository.clearAllSessions();
    sessions.clear(); // Clear local observable list
    _processData(); // Re-process to update summary stats and chart data to empty
    isLoading(false);
  }
}
