import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

Widget socialButton(String text, Widget leadingIcon, GestureTapCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Container(
            height: Dimensions.height(54),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(Dimensions.radius(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leadingIcon,
                SizedBox(width: Dimensions.width(12)),
                AppText(
                  text: text,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.font(16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } 