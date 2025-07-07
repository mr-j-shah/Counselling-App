import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/constants/AppAssets.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class CustomAppbar extends StatelessWidget  {
  final Widget? suffixAction;
  final String title;
  final VoidCallback? onLeadingClick;
  final Color titleColor;

  const CustomAppbar({
    super.key,
    this.suffixAction,
    required this.title,
    this.onLeadingClick,
    this.titleColor = Colors.black87,
  });

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
            InkWell(
              onTap: ()=> onLeadingClick != null ? onLeadingClick!() : Get.back(),
              child: Container(
                padding: EdgeInsets.all(Dimensions.padding(9)),
                height: Dimensions.height(30),
                width: Dimensions.height(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius(10)),
                ),
                child: SvgPicture.asset(
                  Appassets.backIcon,
                  height: Dimensions.height(12),
                  width: Dimensions.width(18),
                  placeholderBuilder: (ctx) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            SizedBox(width: Dimensions.width(16)),
            AppText(
              text: title,
              fontSize: Dimensions.font(18),
              fontWeight: FontWeight.w600,
              color: titleColor,
            ),
            const Spacer(),
            if (suffixAction != null) suffixAction!,
          ],
        ),
      ),
    );
  }
}
