import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static const String _USER_CREDENTIAL = "user_credential";
  static const String _USER_PIN = "user_pin";
  static const String _USER_LANGUAGE = "user_language"; // Added language key

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

  /// Set user credential.
  Future<void> setUser(String credential) async {
    await _prefs?.setString(_USER_CREDENTIAL, credential);
  }

  /// Get user credential.
  String? getUser() {
    return _prefs?.getString(_USER_CREDENTIAL);
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
