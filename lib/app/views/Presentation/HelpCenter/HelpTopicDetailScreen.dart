import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/HelpCenter/model/HelpTopic.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

import '../../../Constants/AppString.dart';

class HelpTopicDetailScreen extends StatelessWidget {
  final HelpTopic topic;

  const HelpTopicDetailScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: Appstring.helpCenter), // Assuming CustomAppBar can hide logout
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(Dimensions.padding(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text:topic.title,
                        fontSize: Dimensions.font(16),
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                      SizedBox(height: Dimensions.height(10),),
                      AppText(
                        text:topic.content,
                        fontSize: Dimensions.font(16),
                      ),
                    ],
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
