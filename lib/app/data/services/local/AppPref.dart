import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_counselling/app/data/models/apimodel/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static const String _USER_DATA = "user_data";
  static const String _USER_LANGUAGE = "user_language";
  static const String _JOURNAL_REMINDER = "journal_reminder";
  static const String _JOURNAL_REMINDER_TIME = "journal_reminder_time";
  static const String _MINDFULNESS_REMINDER = "mindfulness_reminder";
  static const String _MINDFULNESS_REMINDER_TIME = "mindfulness_reminder_time";

  static final AppPref _instance = AppPref._internal();
  SharedPreferences? _prefs;

  factory AppPref() {
    return _instance;
  }

  AppPref._internal();

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setUser(User user) async {
    final userJson = jsonEncode(user.toJson());
    await _prefs?.setString(_USER_DATA, userJson);
  }

  User? getUser() {
    final userJson = _prefs?.getString(_USER_DATA);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  Future<void> clearUser() async {
    await _prefs?.remove(_USER_DATA);
  }

  Future<void> setLanguage(String language) async {
    await _prefs?.setString(_USER_LANGUAGE, language);
  }

  String? getLanguage() {
    return _prefs?.getString(_USER_LANGUAGE);
  }

  // Reminder settings
  Future<void> setJournalReminder(bool value) async {
    await _prefs?.setBool(_JOURNAL_REMINDER, value);
  }

  bool getJournalReminder() {
    return _prefs?.getBool(_JOURNAL_REMINDER) ?? false;
  }

  Future<void> setJournalReminderTime(TimeOfDay time) async {
    await _prefs?.setString(_JOURNAL_REMINDER_TIME, "${time.hour}:${time.minute}");
  }

  TimeOfDay getJournalReminderTime() {
    final timeString = _prefs?.getString(_JOURNAL_REMINDER_TIME);
    if (timeString != null) {
      final parts = timeString.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }
    return const TimeOfDay(hour: 21, minute: 0);
  }

  Future<void> setMindfulnessReminder(bool value) async {
    await _prefs?.setBool(_MINDFULNESS_REMINDER, value);
  }

  bool getMindfulnessReminder() {
    return _prefs?.getBool(_MINDFULNESS_REMINDER) ?? false;
  }

  Future<void> setMindfulnessReminderTime(TimeOfDay time) async {
    await _prefs?.setString(_MINDFULNESS_REMINDER_TIME, "${time.hour}:${time.minute}");
  }

  TimeOfDay getMindfulnessReminderTime() {
    final timeString = _prefs?.getString(_MINDFULNESS_REMINDER_TIME);
    if (timeString != null) {
      final parts = timeString.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }
    return const TimeOfDay(hour: 10, minute: 0);
  }
}
