import 'package:project_counselling/app/config/flavor_config.dart';

class ApiConstants {
  static String get BASE_URL => FlavorConfig.instance.baseUrl;
  static const Duration CONNECT_TIMEOUT = Duration(seconds: 60);
  static const Duration RECEIVE_TIMEOUT = Duration(seconds: 60);
}
