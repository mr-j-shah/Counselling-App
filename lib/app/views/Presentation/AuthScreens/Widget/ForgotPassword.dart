import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/data/enums/AuthFailedState.dart';
import 'package:project_counselling/app/repos/AuthRepo.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/AppTextField.dart';
import 'package:project_counselling/app/views/AppWidgets/BottomSheetHandle.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/CustomSnackbar.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import 'package:project_counselling/app/views/Utils/Loading.dart';

void showForgotPasswordBottomSheet(BuildContext context) {
  Dimensions.init(context);
  final emailController = TextEditingController();
  final Authrepo authRepo = Authrepo();

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
            AppText(
              text: Appstring.forgotPasTitle,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            AppText(
              text: Appstring.forgotPasSubTitle,
              fontSize: 14,
              color: bottomSheetSubtitle,
            ),
            SizedBox(height: Dimensions.height(20)),
            Apptextfield(
              controller: emailController,
              hintText: Appstring.email,
            ),
            SizedBox(height: Dimensions.height(20)),
            Center(
              child: PrimaryButton(
                text: Appstring.continueTxt,
                onPressed: () async {
                  final email = emailController.text.trim();
                  if (email.isEmpty || !GetUtils.isEmail(email)) {
                    Customsnackbar.show(
                      title: "Error",
                      subtitle: "Please enter a valid email.",
                      type: SnackbarType.error,
                    );
                    return;
                  }

                  Loading.show();
                  final response = await authRepo.sendPasswordResetEmail(email);
                  Loading.hide();

                  if (response.failedState == Authfailedstate.NONE) {
                    Get.back(); // Close the bottom sheet
                    Customsnackbar.show(
                      title: "Success",
                      subtitle: response.message,
                      type: SnackbarType.success,
                    );
                  } else {
                    Customsnackbar.show(
                      title: "Error",
                      subtitle: response.message,
                      type: SnackbarType.error,
                    );
                  }
                },
              ),
            ),
            SizedBox(height: Dimensions.height(30)),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
