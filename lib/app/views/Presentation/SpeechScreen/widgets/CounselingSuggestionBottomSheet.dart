import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/constants/AppAssets.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/BottomSheetHandle.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

void showCounselingSuggestionBottomSheet(BuildContext context) {
  Get.bottomSheet(
    SafeArea(
      child: Container(
        padding: EdgeInsets.all(Dimensions.padding(24)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius(20)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Bottomsheethandle(),
            Container(
              padding: EdgeInsets.all(Dimensions.padding(20)),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                Appassets.breathingIcon,
                width: Dimensions.width(50),
                height: Dimensions.height(50),
                color: primaryColor, // Assuming ic_avatar is a colored SVG
              ),
            ),
            SizedBox(height: Dimensions.height(24)),
            const AppText(
              text: "Feeling stuck?",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            const AppText(
              text:
                  """Your post-session mood score is still below 7, it means you need a little extra support.

              Our expert AI models are here for you. They provide compassionate, personalized counseling designed to help lift your spirits and sustain your progress. Explore different AI personalities to find the perfect therapeutic fit.""",
              fontSize: 16,
              color: bottomSheetSubtitle,
              align: TextAlign.center,
            ),
            SizedBox(height: Dimensions.height(20)),
            PrimaryButton(
              text: "Start Session",
              onPressed: () {
                Get.back(); // Close this bottom sheet
                Get.toNamed(Routes.SPEECH_TEXT); // Navigate to avatars
              },
            ),
            SizedBox(height: Dimensions.height(10)),
            TextButton(
              onPressed: () {
                Get.back(); // Just close the bottom sheet
              },
              child: const AppText(
                text: "Maybe Later",
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize:16,
              ),
            ),
            SizedBox(height: Dimensions.height(10)),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
