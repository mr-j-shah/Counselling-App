import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppAssets.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Presentation/IntroScreen/controller/IntroController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({super.key});

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  final animationController = Get.put(Introcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        context,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: Dimensions.baseHeight / 3 * 2,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Obx(
                    () => AnimatedPositioned(
                      duration: animationController.animationDuration,
                      top: animationController.getTop(),
                      left: animationController.getLeft(),
                      right: animationController.getRight(),
                      child: CircleAvatar(
                        radius: Dimensions.width(150),
                        backgroundColor: primaryColor,
                      ),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      foregroundImage: AssetImage(
                        Appassets.IntroScreenMainImage,
                      ),
                      radius: Dimensions.radius(336) / 2,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => AnimatedOpacity(
                opacity:
                    (animationController.positionIndex.value == 1 ||
                        animationController.positionIndex.value == 3)
                    ? 0.0
                    : 1.0,
                duration: animationController.animationDuration,
                child: AppText(
                  text: animationController.getTitleText(),
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.font(28),
                  align: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: Dimensions.height(10)),
            Obx(() {
              return AnimatedOpacity(
                opacity:
                    (animationController.positionIndex.value == 1 ||
                        animationController.positionIndex.value == 3)
                    ? 0.0
                    : 1.0,
                duration: animationController.animationDuration,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: AppText(
                    text: animationController.getDescriptionText(),
                    fontSize: Dimensions.font(14),
                    align: TextAlign.center,
                  ),
                ),
              );
            }),
            SizedBox(height: Dimensions.height(20)),
            PrimaryButton(
              text: Appstring.introButtonText,
              onPressed: () {
                animationController.navigateToLogin();
              },
              backgroundColor: primaryColor,
              textColor: white,
            ),
            SizedBox(height: Dimensions.height(25)),
            AppText(
              onClick: animationController.navigateToHome,
              text: Appstring.skip,
            ),
          ],
        ),
      ),
    );
  }
}
