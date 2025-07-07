import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class CustomDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String subtitle,
    String confirmText = 'Ok',
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return Get.dialog<T>(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius(6)),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: Dimensions.width(24)),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.padding(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              AppText(
                text: title,
                fontSize: Dimensions.font(26),
                fontWeight: FontWeight.bold,
                align: TextAlign.center,
              ),
              SizedBox(height: Dimensions.height(12)),
              // Subtitle / message
              AppText(
                text: subtitle,
                fontSize: Dimensions.font(16),
                color: bottomSheetSubtitle,
                align: TextAlign.center,
              ),
              SizedBox(height: Dimensions.height(24)),
              // Buttons row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Optional Cancel Button
                  if (cancelText != null) ...[
                    AppText(
                      text: cancelText,
                      onClick: () {
                        if (onCancel != null) {
                          onCancel();
                        } else {
                          Get.back<T>();
                        }
                      },
                      style: TextStyle(
                        fontSize: Dimensions.font(16),
                        color: primaryColor
                      ),
                    ),
                    SizedBox(width: Dimensions.width(8)),
                  ],
                  SizedBox(width: Dimensions.width(30),),
                  // Confirm Button
                  AppText(
                    text: confirmText,
                    fontSize: Dimensions.font(16),
                    color: primaryColor,
                    onClick: () {
                      if (onConfirm != null) {
                        onConfirm();
                      } else {
                        Get.back<T>();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
