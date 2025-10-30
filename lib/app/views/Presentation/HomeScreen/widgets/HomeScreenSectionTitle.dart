import 'package:flutter/material.dart';

import '../../../AppWidgets/AppText.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/Dimensions.dart';

class HomeScreenSectionTitle extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const HomeScreenSectionTitle({
    super.key,
    this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: title,
            align: TextAlign.start,
            fontSize: Dimensions.font(18),
            fontWeight: FontWeight.bold,
          ),
          if (onPressed != null)
            AppText(
              onClick: onPressed,
              text: "See all >",
              color: bottomSheetSubtitle,
              align: TextAlign.start,
              fontSize: Dimensions.font(14),
              fontWeight: FontWeight.normal,
            )
        ],
      ),
    );
  }
}
