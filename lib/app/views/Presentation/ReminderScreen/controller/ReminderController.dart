import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/services/local/NotificationService.dart';
import 'package:project_counselling/app/data/services/local/AppPref.dart';

class ReminderController extends GetxController {
  final NotificationService _notificationService = Get.find<NotificationService>();
  final AppPref _appPref = Get.find<AppPref>();

  // Journal Reminder
  var journalReminder = false.obs;
  var journalReminderTime = const TimeOfDay(hour: 21, minute: 0).obs;

  // Mindfulness Reminder
  var mindfulnessReminder = false.obs;
  var mindfulnessReminderTime = const TimeOfDay(hour: 10, minute: 0).obs;

  @override
  void onInit() {
    super.onInit();
    _loadReminderSettings();
  }

  void _loadReminderSettings() {
    journalReminder.value = _appPref.getJournalReminder();
    journalReminderTime.value = _appPref.getJournalReminderTime();
    mindfulnessReminder.value = _appPref.getMindfulnessReminder();
    mindfulnessReminderTime.value = _appPref.getMindfulnessReminderTime();
  }

  void toggleJournalReminder(bool value) {
    journalReminder.value = value;
    _appPref.setJournalReminder(value);
    if (value) {
      _notificationService.scheduleDailyReminder(
        id: 0,
        title: '✍️ Reflect on your day',
        body: 'How are you feeling tonight?',
        time: journalReminderTime.value,
      );
    } else {
      _notificationService.cancelNotification(0);
    }
  }

  void pickJournalReminderTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: journalReminderTime.value,
    );
    if (pickedTime != null && pickedTime != journalReminderTime.value) {
      journalReminderTime.value = pickedTime;
      _appPref.setJournalReminderTime(pickedTime);
      // Reschedule notification if reminder is active
      if (journalReminder.value) {
        toggleJournalReminder(true);
      }
    }
  }

  void toggleMindfulnessReminder(bool value) {
    mindfulnessReminder.value = value;
    _appPref.setMindfulnessReminder(value);
    if (value) {
      _notificationService.scheduleDailyReminder(
        id: 1,
        title: '🧘 Time for a mindful moment',
        body: 'Take a deep breath and find your calm.',
        time: mindfulnessReminderTime.value,
      );
    } else {
      _notificationService.cancelNotification(1);
    }
  }

  void pickMindfulnessReminderTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: mindfulnessReminderTime.value,
    );
    if (pickedTime != null && pickedTime != mindfulnessReminderTime.value) {
      mindfulnessReminderTime.value = pickedTime;
      _appPref.setMindfulnessReminderTime(pickedTime);
      // Reschedule notification if reminder is active
      if (mindfulnessReminder.value) {
        toggleMindfulnessReminder(true);
      }
    }
  }
}
