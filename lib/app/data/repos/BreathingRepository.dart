import 'package:get/get.dart';
import 'package:project_counselling/app/data/provider/db/DatabaseHelper.dart';
import 'package:project_counselling/app/models/BreathingSession.dart';

class BreathingRepository {
  final DatabaseHelper _dbHelper = Get.find<DatabaseHelper>();

  Future<void> addSession({
    required int duration,
    required int preMood,
    required int postMood,
  }) async {
    final timestamp = DateTime.now().toIso8601String();
    await _dbHelper.addSession(
      duration: duration,
      timestamp: timestamp,
      preMood: preMood,
      postMood: postMood,
    );
  }

  Future<List<BreathingSession>> getSessions() async {
    return await _dbHelper.getSessions();
  }
}
