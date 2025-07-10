import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static const String _USER_CREDENTIAL = "user_credential";
  static const String _USER_PIN = "user_pin";

  static SharedPreferences? _prefs;

  AppPref() {
    init();
  }

  /// Initialize the SharedPreferences instance (should be called in main)
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Set PIN separately
  Future<void> setUser(String pin) async {
    await _prefs?.setString(_USER_CREDENTIAL, pin);
  }

  /// Get PIN
  String? getUser() {
    return _prefs?.getString(_USER_CREDENTIAL);
  }
}
