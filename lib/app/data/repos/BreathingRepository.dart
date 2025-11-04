import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/provider/db/DatabaseHelper.dart';

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
    debugPrint("Session Saved Successfully");
  }
}
