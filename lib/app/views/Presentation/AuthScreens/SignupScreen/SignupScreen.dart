import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/constants/AppString.dart';
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
                    keyboardType: TextInputType.name,
                    controller: authcontrollerSignup.nameSignUpController,
                    hintText: Appstring.name,
                  ),
                ),
                SizedBox(height: Dimensions.height(18)),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: Dimensions.width(20),
                  ),
                  child: Apptextfield(
                    keyboardType: TextInputType.emailAddress,
                    controller: authcontrollerSignup.emailSignUpController,
                    hintText: Appstring.email,
                  ),
                ),
                SizedBox(height: Dimensions.height(18)),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: Dimensions.width(20),
                  ),
                  child: Obx(() {
                    return Apptextfield(
                      suffixIcon: authcontrollerSignup.isPasswordVisible.value
                          ? InkWell(child: Icon(Icons.visibility),onTap: authcontrollerSignup.togglePasswordVisiblity,)
                          : InkWell(child: Icon(Icons.visibility_off),onTap: authcontrollerSignup.togglePasswordVisiblity,),
                      controller: authcontrollerSignup.passwordSignUpController,
                      hintText: Appstring.password,
                      obscureText:
                          !authcontrollerSignup.isPasswordVisible.value,
                    );
                  }),
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
                  onPressed: () {
                    authcontrollerSignup.signUpUser();
                  },
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
    );
  }
}
