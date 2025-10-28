import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart' as AppString;
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/AppTextField.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/ChangePassword/controller/ChangePasswordController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

import '../../AppWidgets/DefaultBackground.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "Change Password"),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(Dimensions.padding(20)),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Update Your Password",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: Dimensions.height(8)),
                        AppText(
                          text:
                              "Please enter your current password and a new password to update your account.",
                          fontSize: 14,
                          color: bottomSheetSubtitle,
                        ),
                        SizedBox(height: Dimensions.height(20)),
                        Apptextfield(
                          controller: controller.currentPasswordController,
                          hintText: "Current Password",
                          obscureText: true,
                        ),
                        SizedBox(height: Dimensions.height(16)),
                        Apptextfield(
                          controller: controller.newPasswordController,
                          hintText: "New Password",
                          obscureText: true,
                        ),
                        SizedBox(height: Dimensions.height(16)),
                        Apptextfield(
                          controller: controller.confirmPasswordController,
                          hintText: "Confirm New Password",
                          obscureText: true,
                        ),
                        SizedBox(height: Dimensions.height(30)),
                        Center(
                          child: PrimaryButton(
                            text: "Save",
                            onPressed: controller.changePassword,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
