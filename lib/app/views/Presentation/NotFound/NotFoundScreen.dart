import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/AppWidgets/PrimaryButton.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "Page Not Found"),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.padding(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          size: Dimensions.font(100),
                          color: Colors.redAccent.withOpacity(0.8),
                        ),
                        SizedBox(height: Dimensions.height(20)),
                        const AppText(
                          text: "Oops! Page Not Found",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: Dimensions.height(10)),
                        AppText(
                          text: "The page you are looking for does not exist or has been moved.",
                          align: TextAlign.center,
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                        SizedBox(height: Dimensions.height(30)),
                        PrimaryButton(
                          text: "Go Back",
                          onPressed: () {
                            if (Get.previousRoute.isNotEmpty) {
                              Get.back();
                            } else {
                              Get.offAllNamed(Routes.HOME);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
