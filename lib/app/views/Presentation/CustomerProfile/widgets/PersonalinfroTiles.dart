import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Personalinfrotiles extends StatelessWidget {
  final String label;
  final String value;
  final bool showEdit;
  const Personalinfrotiles({
    super.key,
    required this.label,
    required this.value,
    this.showEdit = true,
  });

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radius(12)),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width(16),
            vertical: Dimensions.height(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: label,
                      style: TextStyle(
                        fontSize: Dimensions.font(12),
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: Dimensions.height(5)),
                    AppText(
                      text: value,
                      style: TextStyle(fontSize: Dimensions.font(16)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (showEdit) Icon(Icons.edit, color: bottomSheetSubtitle),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height(12)),
      ],
    );
  }
}
