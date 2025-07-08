import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class Apptextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? suffixIconMessage;
  final Widget? suffixIcon;
  final Color borderColor = textFieldBorder;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const Apptextfield({
    super.key,
    required this.controller,
    this.hintText = 'example@gmail.com',
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.suffixIconMessage,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    var borderRadius = BorderRadius.all(Radius.circular(Dimensions.radius(12)));

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIconMessage != null
            ? Tooltip(message: suffixIconMessage, child: suffixIcon)
            : suffixIcon,
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
