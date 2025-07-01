import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppTextField.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/Widget/ForgotPassword.dart';
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
        child: Defaultbackground(
          child: SingleChildScrollView(
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
                      onClick: () {
                        showForgotPasswordBottomSheet(context);
                      },
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
}
