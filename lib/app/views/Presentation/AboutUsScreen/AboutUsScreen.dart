import 'package:flutter/material.dart';
import 'package:project_counselling/app/constants/AppString.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: Appstring.aboutUsTitle),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width(24),
                    vertical: Dimensions.height(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: Appstring.aboutUsOurMission,
                          fontSize: Dimensions.font(22),
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: Dimensions.height(12)),
                        AppText(
                          text: Appstring.aboutUsOurMissionDescription,
                          fontSize: Dimensions.font(16),
                          color: Colors.grey.shade700,
                          align: TextAlign.justify,
                        ),
                        SizedBox(height: Dimensions.height(30)),
                        AppText(
                          text: Appstring.aboutUsOurTeam,
                          fontSize: Dimensions.font(22),
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: Dimensions.height(12)),
                        AppText(
                          text: Appstring.aboutUsOurTeamDescription,
                          fontSize: Dimensions.font(16),
                          color: Colors.grey.shade700,
                          align: TextAlign.justify,
                        ),
                        SizedBox(height: Dimensions.height(40)),
                        Center(
                          child: Column(
                            children: [
                              AppText(
                                text: 'Developed by',
                                fontSize: Dimensions.font(14),
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(height: Dimensions.height(8)),
                              AppText(
                                text: 'Jinay Shah',
                                fontSize: Dimensions.font(18),
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: Dimensions.height(4)),
                              AppText(
                                text: 'shahjinay02@gmail.com',
                                fontSize: Dimensions.font(14),
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
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
