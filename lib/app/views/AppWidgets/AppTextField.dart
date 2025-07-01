import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class Apptextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final Color iconColor;
  final Color borderColor;
  final bool obscureText;

  const Apptextfield({
    super.key,
    required this.controller,
    this.hintText = 'example@gmail.com',
    this.suffixIcon,
    this.iconColor = textFieldSuffixIconColor,
    this.borderColor = textFieldBorder,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context); 
    var borderRadius = BorderRadius.all(Radius.circular(Dimensions.radius(12)));

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          vertical: Dimensions.padding(16),
          horizontal: Dimensions.padding(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: borderColor),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
