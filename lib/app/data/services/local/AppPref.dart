import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static const String _USER_AUTH = "user_auth";
  static const String _USER_PIN = "user_pin";

  static SharedPreferences? _prefs;

  /// Initialize the SharedPreferences instance (should be called in main)
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
  
    /// Set PIN separately
  static Future<void> setPin(String pin) async {
    await _prefs?.setString(_USER_AUTH, pin);
  }

  /// Get PIN
  static String? getPin() {
    return _prefs?.getString(_USER_PIN);
  }

}
