import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppTextField.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/Widget/SocialButtonsRow.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/controller/AuthContoller.dart';

import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  final Authcontroller authcontroller = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: DefaultBackground(
          context,
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.height(127)),
                    AppText(
                      text: Appstring.loginTitle,
                      fontSize: Dimensions.font(28),
                      fontWeight: FontWeight.bold,
                      align: TextAlign.center,
                    ),
                    SizedBox(height: Dimensions.height(10)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.padding(45),
                      ),
                      child: AppText(
                        text: Appstring.loginSubTitle,
                        fontSize: 14,
                        align: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: Dimensions.height(50)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.padding(20),
                      ),
                      child: Socialbuttonsrow(),
                    ),
                    SizedBox(height: Dimensions.height(37)),

                    // Email
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width(20),
                      ),
                      child: Apptextfield(
                        controller: emailController,
                        hintText: 'itsmemamun1@gmail.com',
                      ),
                    ),
                    SizedBox(height: Dimensions.height(18)),

                    // Password
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width(20),
                      ),
                      child: Apptextfield(
                        controller: TextEditingController(),
                        hintText: 'Password',
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: Dimensions.height(32)),

                    PrimaryButton(
                      text: Appstring.loginButtonText,
                      onPressed: () {},
                    ),
                    SizedBox(height: Dimensions.height(19)),

                    AppText(
                      text: Appstring.loginForgotPass,
                      color: primaryColor,
                      fontSize: Dimensions.font(14),
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: Dimensions.height(45)),
                    AppText(
                      text: Appstring.loginDontHaveAcc,
                      color: primaryColor,
                      fontSize: Dimensions.font(14),
                      fontWeight: FontWeight.bold,
                      onClick: authcontroller.navigateToSignUp,
                    ),
                    SizedBox(height: Dimensions.height(30)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showForgotPasswordBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Padding(
        padding: EdgeInsetsGeometry.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text(
                "Forgot password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),
              const Text(
                "Enter your email for the verification process,\nwe will send 4 digits code to your email.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // Email TextField
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Continue Button
              PrimaryButton(text: "Continue", onPressed: () {}),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
