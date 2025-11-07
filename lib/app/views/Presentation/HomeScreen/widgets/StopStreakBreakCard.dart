import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class StopStreakBreakCard extends StatelessWidget {
  final VoidCallback onStartBreathing;

  const StopStreakBreakCard({super.key, required this.onStartBreathing});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.padding(16), vertical: Dimensions.padding(8)),
      padding: EdgeInsets.all(Dimensions.padding(20)),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Dimensions.radius(15)),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppText(
            text: "Don't Break Your Streak!",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: Dimensions.height(8)),
          const AppText(
            text: "You're doing great! A quick breathing session can keep your momentum going.",
            color: Colors.black87,
          ),
          SizedBox(height: Dimensions.height(16)),
          PrimaryButton(
            text: "Start Breathing Session",
            onPressed: onStartBreathing,
            backgroundColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
