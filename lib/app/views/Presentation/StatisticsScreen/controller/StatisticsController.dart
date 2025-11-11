import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:project_counselling/app/data/repos/BreathingRepository.dart';
import 'package:project_counselling/app/data/repos/JournalRepository.dart';
import 'package:project_counselling/app/models/BreathingSession.dart';
import 'package:project_counselling/app/models/JournalEntry.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart'; 
import 'package:project_counselling/app/views/Utils/Colors.dart'; 
import 'package:project_counselling/app/views/Utils/Dimensions.dart'; 

class StatisticsController extends GetxController {
  final BreathingRepository _breathingRepository = Get.find<BreathingRepository>();
  final JournalRepository _journalRepository = Get.put(JournalRepository());

  var breathingSessions = <BreathingSession>[].obs;
  var journalEntries = <JournalEntry>[].obs;
  var isLoading = true.obs;

  // Breathing summary stats
  var totalSessions = 0.obs;
  var totalTime = 0.obs;
  var avgMoodImprovement = 0.0.obs;

  // Journal summary stats
  var totalJournalEntries = 0.obs;
  var avgJournalMood = 0.0.obs;

  // Chart data
  var weeklyChartData = <int, double>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      breathingSessions.value = await _breathingRepository.getSessions();
      journalEntries.value = await _journalRepository.getJournalEntries();
      _processData();
    } finally {
      isLoading(false);
    }
  }

  void _processData() {
    // Process breathing sessions
    if (breathingSessions.isEmpty) {
      totalSessions.value = 0;
      totalTime.value = 0;
      avgMoodImprovement.value = 0.0;
      weeklyChartData.value = {};
    } else {
      totalSessions.value = breathingSessions.length;
      totalTime.value = breathingSessions.map((s) => s.duration).sum;

      final moodImprovements = breathingSessions
          .where((s) => s.postMood > s.preMood)
          .map((s) => s.postMood - s.preMood);

      if (moodImprovements.isNotEmpty) {
        avgMoodImprovement.value = moodImprovements.average;
      } else {
        avgMoodImprovement.value = 0.0;
      }

      final today = DateTime.now();
      final last7Days = List.generate(7, (i) => today.subtract(Duration(days: i)));

      final Map<int, double> dailyTotals = {};
      for (var day in last7Days) {
        final sessionsOnDay = breathingSessions.where((s) =>
            s.timestamp.year == day.year &&
            s.timestamp.month == day.month &&
            s.timestamp.day == day.day);
        dailyTotals[day.weekday] = sessionsOnDay.map((s) => s.duration).sum.toDouble();
      }

      final processedData = <int, double>{};
      for (int i = 1; i <= 7; i++) {
        processedData[i] = dailyTotals[i] ?? 0.0;
      }
      weeklyChartData.value = processedData;
    }

    // Process journal entries
    if (journalEntries.isEmpty) {
      totalJournalEntries.value = 0;
      avgJournalMood.value = 0.0;
    } else {
      totalJournalEntries.value = journalEntries.length;
      avgJournalMood.value = journalEntries.map((e) => e.mood).average;
    }
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
                    "Are you sure you want to clear all your session data? This action cannot be undone.",
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
                      onPressed: () => Get.back(), 
                      backgroundColor: Colors.grey.shade300,
                      textColor: Colors.black87,
                    ),
                  ),
                  SizedBox(width: Dimensions.width(16)),
                  Expanded(
                    child: PrimaryButton(
                      text: "Yes, Clear",
                      onPressed: () {
                        Get.back(); 
                        clearAllData();
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

  void clearAllData() async {
    isLoading(true);
    await _breathingRepository.clearAllSessions();
    await _journalRepository.getJournalEntries().then((entries) => entries.forEach((entry) { _journalRepository.deleteJournalEntry(entry.id!); }));
    fetchData();
  }
}
