import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/AppTextField.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/Widget/SocialButtonsRow.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/Widget/TermsAndCondition.dart';
import 'package:project_counselling/app/views/Presentation/AuthScreens/controller/AuthContoller.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class Signupscreen extends StatelessWidget {
  Signupscreen({super.key});

  final Authcontroller authcontrollerSignup = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Dimensions.height(100)),
                    AppText(
                      text: Appstring.signUpScreenTitle,
                      fontSize: Dimensions.font(28),
                      fontWeight: FontWeight.bold,
                      align: TextAlign.center,
                    ),
                    SizedBox(height: Dimensions.height(10)),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: Dimensions.padding(45),
                      ),
                      child: AppText(
                        text: Appstring.signUpScreenSubTitle,
                        fontSize: 14,
                        align: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: Dimensions.height(50)),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: Dimensions.padding(20),
                      ),
                      child: Socialbuttonsrow(),
                    ),
                    SizedBox(height: Dimensions.height(37)),
                    // Email Field
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: Dimensions.width(20),
                      ),
                      child: Apptextfield(
                        controller: TextEditingController(),
                        hintText: "Name",
                      ),
                    ),
                    SizedBox(height: Dimensions.height(18)),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: Dimensions.width(20),
                      ),
                      child: Apptextfield(
                        controller: TextEditingController(),
                        hintText: "Email",
                      ),
                    ),
                    SizedBox(height: Dimensions.height(18)),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: Dimensions.width(20),
                      ),
                      child: Apptextfield(
                        controller: TextEditingController(),
                        hintText: "Password",
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: Dimensions.height(14)),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: Dimensions.width(20),
                      ),
                      child: Termsandcondition(),
                    ),
                    SizedBox(height: Dimensions.height(32)),
                    PrimaryButton(
                      text: Appstring.signUpScreenButton,
                      onPressed: () {},
                    ),
                    SizedBox(height: Dimensions.height(19)),
                    AppText(
                      text: Appstring.haveAnAccont,
                      color: primaryColor,
                      fontSize: Dimensions.font(14),
                      fontWeight: FontWeight.bold,
                      onClick: authcontrollerSignup.navigateBackToLogin,
                    ),
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
