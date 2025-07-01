import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/AppTextField.dart';
import 'package:project_counselling/app/views/AppWidgets/BottomSheetHandle.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

void showForgotPasswordBottomSheet(BuildContext context) {
  Dimensions.init(context);
  Get.bottomSheet(
    SafeArea(
      child: Container(
        padding: EdgeInsets.all(Dimensions.padding(20)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.width(30)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bottomsheethandle(),
            AppText(text: 
              Appstring.forgotPasTitle,
              fontSize: 20, fontWeight: FontWeight.bold
            ),
            SizedBox(height: Dimensions.height(8)),
            AppText(
              text:
                  Appstring.forgotPasSubTitle,
              fontSize: 14,
              color: bottomSheetSubtitle,
            ),
            SizedBox(height: Dimensions.height(20)),
            Apptextfield(
              controller: TextEditingController(),
              hintText: Appstring.email,
            ),
            SizedBox(height: Dimensions.height(20)),
            Center(child: PrimaryButton(text: Appstring.continueTxt, onPressed: () {})),
            SizedBox(height: Dimensions.height(30)),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
