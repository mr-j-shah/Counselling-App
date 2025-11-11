// 📦 Aura Mind - Notification Service
// Author: Jinay Shah
// Purpose: Local notifications + "Remind Me Later" feature
// Packages: flutter_local_notifications, timezone

import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';

class NotificationService {
  // 🔔 Singleton Pattern
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  // Plugin Instance
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  // ⚙️ Initialize Notifications
  Future<void> init() async {
    if (_initialized) return;

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);

    await _notificationsPlugin.initialize(initSettings);
    await requestExactAlarmPermission(); // <-- add this line

    _initialized = true;
  }

  // 📅 Schedule a Notification
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? payload,
  }) async {
    final tz.TZDateTime tzTime = tz.TZDateTime.from(scheduledTime, tz.local);

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tzTime, // tz.TZDateTime.from(scheduledTime, tz.local)
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'aura_mind_channel',
          'Aura Mind Reminders',
          channelDescription: 'Mindfulness & journaling reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexact,
      payload: payload,
    );

    debugPrint('✅ Notification scheduled at: $tzTime ($title)');
  }

  // 🎲 Schedule Random Daily Reminder
  Future<void> scheduleRandomDailyReminder({
    required int id,
    required String title,
    required String body,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    String? payload,
  }) async {
    final random = Random();
    final now = tz.TZDateTime.now(tz.local);

    final start = tz.TZDateTime(tz.local, now.year, now.month, now.day, startTime.hour, startTime.minute);
    final end = tz.TZDateTime(tz.local, now.year, now.month, now.day, endTime.hour, endTime.minute);
    
    if (end.isBefore(start) || end.isAtSameMomentAs(start)) {
      debugPrint("🔴 Random notification end time must be after start time.");
      return;
    }

    final int minuteDifference = end.difference(start).inMinutes;
    final int randomMinutes = random.nextInt(minuteDifference);
    
    tz.TZDateTime scheduledTime = start.add(Duration(minutes: randomMinutes));

    if (scheduledTime.isBefore(now)) {
       scheduledTime = scheduledTime.add(const Duration(days: 1));
    }
    
    await scheduleNotification(
        id: id,
        title: title,
        body: body,
        scheduledTime: scheduledTime,
        payload: payload ?? 'random_reminder');
  }

  // 🔁 Remind Me Later (Dynamic Reschedule)
  Future<void> remindMeLater({
    required Duration delay,
    required String title,
    required String body,
  }) async {
    final laterTime = DateTime.now().add(delay);
    final int newId = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    await scheduleNotification(
      id: newId,
      title: title,
      body: body,
      scheduledTime: laterTime,
    );

    debugPrint('⏰ Reminder rescheduled after ${delay.inMinutes} mins');
  }

  // 🗓️ Schedule Daily Reminder (e.g., Journal at 9 PM)
  Future<void> scheduleDailyReminder({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
  }) async {
    final now = DateTime.now();
    final scheduled = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final firstTime = scheduled.isBefore(now)
        ? scheduled.add(const Duration(days: 1))
        : scheduled;

    await scheduleNotification(
      id: id,
      title: title,
      body: body,
      scheduledTime: firstTime,
    );
  }

  // 🔕 Cancel a specific notification
  Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
    debugPrint('❌ Cancelled notification with ID: $id');
  }

  // 🔕 Cancel all notifications
  Future<void> cancelAll() async {
    await _notificationsPlugin.cancelAll();
    debugPrint('🧹 All notifications cancelled');
  }

  // 📋 List all pending notifications
  Future<List<PendingNotificationRequest>> listAllPending() async {
    final pending = await _notificationsPlugin.pendingNotificationRequests();
    debugPrint('🔍 Pending notifications: ${pending.length}');
    return pending;
  }

  // 🧠 Smart Suggestions (for AI-triggered notifications)
  Future<void> triggerSmartNotification({
    required String context,
    required String message,
  }) async {
    final now = DateTime.now().add(const Duration(minutes: 1)); // triggers in 1 min
    final id = now.millisecondsSinceEpoch ~/ 1000;

    await scheduleNotification(
      id: id,
      title: 'Aura Mind Suggestion 🌿',
      body: message,
      scheduledTime: now,
      payload: context,
    );
  }
}

final _plugin = FlutterLocalNotificationsPlugin();

Future<void> requestExactAlarmPermission() async {
  // Works on Android 13+ only
  final androidImplementation =
      _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  final granted = await androidImplementation?.requestNotificationsPermission();
  if (granted == null || !granted) {
    debugPrint("⚠️ Exact alarm permission NOT granted");
  } else {
    debugPrint("✅ Exact alarm permission granted");
  }
}
