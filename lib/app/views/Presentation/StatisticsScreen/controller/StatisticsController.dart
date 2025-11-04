import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:project_counselling/app/data/repos/BreathingRepository.dart';
import 'package:project_counselling/app/models/BreathingSession.dart';

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
    if (sessions.isEmpty) return;

    // Calculate summary stats
    totalSessions.value = sessions.length;
    totalTime.value = sessions.map((s) => s.duration).sum;

    final moodImprovements = sessions
        .where((s) => s.postMood > s.preMood)
        .map((s) => s.postMood - s.preMood);

    if (moodImprovements.isNotEmpty) {
      avgMoodImprovement.value = moodImprovements.average;
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
}
