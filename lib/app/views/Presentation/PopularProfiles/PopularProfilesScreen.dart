import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/AvatarCard.dart';
import 'package:project_counselling/app/views/Presentation/PopularProfiles/controller/PopularProfilesController.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class PopularProfilesScreen extends GetView<PopularProfilesController> {
  const PopularProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "Popular Profiles"),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(Dimensions.padding(16)),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Dimensions.width(16),
                    mainAxisSpacing: Dimensions.height(16),
                    childAspectRatio: 0.7,
                  ),
                  itemCount: controller.avatarList.length,
                  itemBuilder: (context, index) {
                    return AvatarCard(avatar: controller.avatarList[index]);
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
