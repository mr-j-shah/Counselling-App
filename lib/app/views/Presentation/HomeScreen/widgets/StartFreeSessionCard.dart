import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Startfreesessioncard extends StatelessWidget {
  final VoidCallback onPressed;
  const Startfreesessioncard({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(Dimensions.radius(16)),
      child: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.all(Dimensions.padding(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                text: "Begin Your Healing Journey",
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.font(18),
                align: TextAlign.start,
              ),
              SizedBox(height: Dimensions.height(12)),
              AppText(
                text: "Take your first session today and discover how mindful conversations can transform your mental wellbeing.",
                fontWeight: FontWeight.normal,
                fontSize: Dimensions.font(16),
              ),
              SizedBox(height: Dimensions.height(14)),
              PrimaryButton(text: "Start Free Session", onPressed: onPressed),
            ],
          ),
        ),
      ),
    );
  }
}
