import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/SideMenuController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class SideMenuTile extends StatelessWidget {
  final Widget? leadingIcon;
  final String title;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Color? titleColor;
  final int index;

  SideMenuTile({
    super.key,
    required this.index,
    required this.title,
    this.leadingIcon,
    this.suffixIcon,
    this.onTap,
    this.titleColor = Colors.white,
  });

  final Sidemenucontroller _sidemenucontroller = Get.find<Sidemenucontroller>();
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.padding(10),
        vertical: Dimensions.padding(10),
      ),
      child: GestureDetector(
        onTap: () {
          _sidemenucontroller.selectedTile.value = index;
          Timer(Duration(milliseconds: 400), () {
            _sidemenucontroller.selectedTile.value = -1;
            if (onTap != null) {
              onTap!();
            }
          });
        },
        child: Obx(() {
          return Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: _sidemenucontroller.selectedTile.value == index
                    ? 500
                    : 0,
                height: Dimensions.height(50),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  Dimensions.padding(20),
                  0,
                  Dimensions.width(10),
                  0,
                ),
                child: Container(
                  height: Dimensions.height(50),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (leadingIcon != null) ...[
                        SizedBox(
                          width: Dimensions.height(24),
                          height: Dimensions.height(24),
                          child: leadingIcon,
                        ),
                        SizedBox(width: Dimensions.width(16)),
                      ],
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: Dimensions.font(16),
                            fontWeight: FontWeight.w500,
                            color: titleColor,
                          ),
                        ),
                      ),
                      if (suffixIcon != null) ...[
                        suffixIcon!,
                      ] else ...[
                        Icon(Icons.chevron_right, color: titleColor),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
