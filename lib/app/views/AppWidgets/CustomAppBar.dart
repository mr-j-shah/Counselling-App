import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class CustomAppbar extends StatelessWidget {
  final Widget? suffixAction;
  final String title;
  final VoidCallback? onLeadingClick;

  const CustomAppbar({super.key, this.suffixAction, required this.title, this.onLeadingClick});

  @override
  Widget build(BuildContext context) {
    // Initialize once at startup if you haven’t already
    Dimensions.init(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width(20),
        vertical: Dimensions.height(10),
      ),
      child: SizedBox(
        width: Dimensions.baseWidth,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius(10)),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black87),
                onPressed: ()=> onLeadingClick != null ? onLeadingClick!() : Get.back(),
              ),
            ),
            SizedBox(width: Dimensions.width(16)),
            AppText(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            const Spacer(),
            if (suffixAction != null) suffixAction!,
          ],
        ),
      ),
    );
  }
}
