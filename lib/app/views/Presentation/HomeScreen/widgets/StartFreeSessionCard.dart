import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Startfreesessioncard extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String subString;
  final String buttonText;
  const Startfreesessioncard({super.key, required this.onPressed, required this.title, required this.subString, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(Dimensions.radius(16)),
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.all(Dimensions.padding(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  text: title,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.font(18),
                  align: TextAlign.start,
                ),
                SizedBox(height: Dimensions.height(12)),
                AppText(
                  text: subString,
                  fontWeight: FontWeight.normal,
                  fontSize: Dimensions.font(16),
                ),
                SizedBox(height: Dimensions.height(14)),
                PrimaryButton(text: buttonText, onPressed: onPressed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
