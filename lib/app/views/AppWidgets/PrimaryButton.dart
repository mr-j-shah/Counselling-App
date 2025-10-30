import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = primaryColor,
    this.textColor = Colors.white,
    this.width,
    this.height,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Dimensions.width(295),
      height: height ?? Dimensions.height(45),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.width(10)),
          ),
        ),
        child: AppText(
          text: text,
          color: textColor,
            fontSize: Dimensions.font(fontSize!),
            fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
