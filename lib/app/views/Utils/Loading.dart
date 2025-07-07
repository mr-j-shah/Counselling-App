// lib/utils/loading.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';

class Loading {
  static bool _isDialogOpen = false;

  static void show({String message = "Please wait..."}) {
    if (_isDialogOpen) return;

    _isDialogOpen = true;

    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: bottomSheetHandle,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: Colors.black),
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hide() {
    if (_isDialogOpen) {
      _isDialogOpen = false;
      if (Get.isDialogOpen ?? false) {
        Get.back(); // Close the dialog
      }
    }
  }
}
