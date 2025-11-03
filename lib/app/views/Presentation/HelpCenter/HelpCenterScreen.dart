import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/Constants/AppString.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart'; 
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/HelpCenter/data/HelpData.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Dimensions.init(context);

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: Appstring.helpCenter),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width(16), vertical: Dimensions.height(10)),
                  itemCount: helpCategories.length,
                  itemBuilder: (context, index) {
                    final category = helpCategories[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: Dimensions.height(8)),
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius(10))),
                      child: ExpansionTile(
                        shape: const Border(), // Removes border when expanded
                        collapsedShape: const Border(), // Removes border when collapsed
                        title: Text(category.title, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 16)),
                        childrenPadding: EdgeInsets.only(left: Dimensions.width(16), right: Dimensions.width(16), bottom: Dimensions.height(10)),
                        children: category.topics.map((topic) {
                          return ListTile(
                            title: Text(topic.title, style: textTheme.bodyMedium),
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              Get.toNamed(Routes.HELP_TOPIC_DETAIL_SCREEN, arguments: topic);
                            },
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
