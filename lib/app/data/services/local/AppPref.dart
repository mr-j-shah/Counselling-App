import 'dart:convert';

import 'package:project_counselling/app/data/models/apimodel/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static const String _USER_DATA = "user_data"; // Changed key for clarity
  static const String _USER_LANGUAGE = "user_language";

  static final AppPref _instance = AppPref._internal();
  SharedPreferences? _prefs;

  factory AppPref() {
    return _instance;
  }

  AppPref._internal();

  /// Initialize the SharedPreferences instance (should be called in main)
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Set user data.
  Future<void> setUser(User user) async {
    final userJson = jsonEncode(user.toJson());
    await _prefs?.setString(_USER_DATA, userJson);
  }

  /// Get user data.
  User? getUser() {
    final userJson = _prefs?.getString(_USER_DATA);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  /// Clear user data from shared preferences.
  Future<void> clearUser() async {
    await _prefs?.remove(_USER_DATA);
  }

  /// Set user-selected language.
  Future<void> setLanguage(String language) async {
    await _prefs?.setString(_USER_LANGUAGE, language);
  }

  /// Get user-selected language.
  String? getLanguage() {
    return _prefs?.getString(_USER_LANGUAGE);
  }
}
