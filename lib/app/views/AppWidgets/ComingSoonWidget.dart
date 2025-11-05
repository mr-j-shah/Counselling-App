import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class ComingSoonWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const ComingSoonWidget({
    super.key,
    this.title = "Coming Soon!",
    this.subtitle = "We're working hard to bring you this feature.",
    this.icon = Icons.construction_rounded,
  });

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: Dimensions.font(80),
            color: primaryColor,
          ),
          SizedBox(height: Dimensions.height(20)),
          AppText(
            text: title,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          SizedBox(height: Dimensions.height(10)),
          AppText(
            text: subtitle,
            fontSize: 16,
            color: Colors.grey.shade600,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
