import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/routers/app_routes.dart';

import 'package:project_counselling/app/views/Presentation/AuthScreens/controller/AuthContoller.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Termsandcondition extends StatelessWidget {
  final Authcontroller _authcontroller = Get.find<Authcontroller>();
  Termsandcondition({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    var circleSize = Dimensions.width(20);
    const circleColor = Color(0xFFBDC5D2); // light muted blue/gray

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _authcontroller.toggleAgreement,
          child: Obx(
            () => Container(
              width: circleSize,
              height: circleSize,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: circleColor, width: 2),
                color: _authcontroller.isAgreed.value
                    ? circleColor
                    : Colors.transparent,
              ),
              child: _authcontroller.isAgreed.value
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'I agree with the ',
              style: const TextStyle(
                color: Color(0xFF5C6A82), // muted gray
                fontSize: 14,
                fontFamily: 'Rubic',
              ),
              children: [
                TextSpan(
                  text: 'Terms of Service',
                  style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubic',
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle terms tap
                      Get.snackbar('Link', 'Terms of Service tapped');
                    },
                ),
                const TextSpan(
                  text: ' & ',
                  style: TextStyle(fontFamily: 'Rubic'),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubic',
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle privacy tap
                      Get.toNamed(Routes.POLICY_SCREEN);
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
