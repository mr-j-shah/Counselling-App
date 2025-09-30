import 'package:flutter/material.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/HelpCenter/model/HelpTopic.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

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
              CustomAppbar(title: topic.title), // Assuming CustomAppBar can hide logout
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(Dimensions.padding(16)),
                  child: Text(
                    topic.content,
                    style: textTheme.bodyMedium,
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
