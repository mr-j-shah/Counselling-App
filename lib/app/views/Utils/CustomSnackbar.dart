import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';

class Customsnackbar {
  static void show({
    required String title,
    required String subtitle,
    Widget? leadingIcon,
  }) {
    Get.snackbar(
      title,
      subtitle,
      snackPosition: SnackPosition.TOP,
      backgroundColor: white,
      colorText: Colors.black,
      icon: leadingIcon ?? Icon(Icons.error_outline, color: Colors.black),
      duration: Duration(seconds: 4),
      borderRadius: 10,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    );
  }
}
