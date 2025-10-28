import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';

enum SnackbarType { success, error, info }

class Customsnackbar {
  static void show({
    required String title,
    required String subtitle,
    Widget? leadingIcon,
    SnackbarType type = SnackbarType.info,
  }) {
    Color backgroundColor;
    IconData icon;

    switch (type) {
      case SnackbarType.success:
        backgroundColor = Colors.green;
        icon = Icons.check_circle_outline;
        break;
      case SnackbarType.error:
        backgroundColor = Colors.redAccent;
        icon = Icons.error_outline;
        break;
      case SnackbarType.info:
      default:
        backgroundColor = primaryColor;
        icon = Icons.info_outline;
        break;
    }

    Get.snackbar(
      title,
      subtitle,
      snackPosition: SnackPosition.TOP,
      backgroundColor: white,
      colorText: Colors.black,
      icon: leadingIcon ?? Icon(icon, color: backgroundColor),
      duration: Duration(seconds: 2),
      borderRadius: 10,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    );
  }
}
