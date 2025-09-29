import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

import '../../../Utils/Colors.dart';

class Homebottomnavigation extends StatelessWidget {
  const Homebottomnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final Homecontroller homeController = Get.find<Homecontroller>();

    // Define your icons and selected icons/styles
    final List<IconData> icons = [
      Icons.home,
      Icons.favorite,
      Icons.book_outlined,
      Icons.chat_bubble_outline,
    ];

    final List<IconData> selectedIcons = [
      Icons.home, // Can be the same if only background changes
      Icons.favorite, // Can be the same
      Icons.book, // Filled version
      Icons.chat_bubble, // Filled version
    ];

    return Card(
      color: Colors.white,
      elevation: 20,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      margin: EdgeInsets.zero, // Changed from EdgeInsets.all(0)
      child: SizedBox(
        height: Dimensions.height(74),
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(icons.length, (index) {
                bool isSelected = homeController.selectedTabIndex.value == index;
                return GestureDetector(
                  onTap: () => homeController.changeTabIndex(index),
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.padding(12)), // Add padding for tap area and background
                    decoration: BoxDecoration(
                      color: isSelected ? primaryColor : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isSelected ? selectedIcons[index] : icons[index],
                      color: isSelected ? Colors.white : Colors.grey[600], // Adjust colors as needed
                      size: Dimensions.font(28), // Adjust size as needed
                    ),
                  ),
                );
              }),
            )),
      ),
    );
  }
}
