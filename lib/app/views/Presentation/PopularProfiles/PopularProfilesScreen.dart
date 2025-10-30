import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/Avatar.dart';
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
    final List<Avatar> avatarList = Get.arguments as List<Avatar>;
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "Popular Profiles"),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(Dimensions.padding(15)),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Dimensions.width(16),
                    mainAxisSpacing: Dimensions.height(16),
                    childAspectRatio: 0.7,
                  ),
                  itemCount: avatarList.length,
                  itemBuilder: (context, index) {
                    return AvatarCard(avatar: avatarList[index]);
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
