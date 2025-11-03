import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/AppTextField.dart';
import 'package:project_counselling/app/views/AppWidgets/BottomSheetHandle.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/controller/SpeechController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/CustomSnackbar.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

void showSaveChatBottomSheet(BuildContext context) {
  final SpeechController controller = Get.find<SpeechController>();
  final TextEditingController titleController = TextEditingController();

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
              child: Icon(
                Icons.save_alt_rounded,
                color: primaryColor,
                size: Dimensions.font(50),
              ),
            ),
            SizedBox(height: Dimensions.height(24)),
            const AppText(
              text: "Save Conversation",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(8)),
            const AppText(
              text:
                  "Give your chat a title to save it for later. You can save a total of 5 chats with the Free Tier.",
              fontSize: 14,
              color: bottomSheetSubtitle,
              align: TextAlign.center,
            ),
            SizedBox(height: Dimensions.height(20)),
            Apptextfield(
              controller: titleController,
              hintText: "e.g., Evening Thoughts",
            ),
            SizedBox(height: Dimensions.height(20)),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "Don't Save",
                    onPressed: () {
                      Get.back(); // Close bottom sheet
                      Get.back(); // Navigate back from the screen
                    },
                    backgroundColor: Colors.grey.shade300,
                    textColor: Colors.black87,
                  ),
                ),
                SizedBox(width: Dimensions.width(16)),
                Expanded(
                  child: PrimaryButton(
                    text: "Save",
                    onPressed: () {
                      final title = titleController.text.trim();
                      if (title.isNotEmpty) {
                        controller.saveChatSession(title);
                      } else {
                        Customsnackbar.show(
                          title: Appstring.error,
                          subtitle: "Please enter a title for your session.",
                          type: SnackbarType.error,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height(30)),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
