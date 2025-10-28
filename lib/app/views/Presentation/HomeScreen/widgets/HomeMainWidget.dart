import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/Avatar.dart';
import 'package:project_counselling/app/data/models/Doctor.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/AvatarCard.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/DoctorCard.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/HomeAppbar.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/HomeBottomnavigation.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

import '../../../Utils/Colors.dart';

class HomeMainwidget extends StatelessWidget {
  final Homecontroller _homecontroller = Get.find<Homecontroller>();

  HomeMainwidget({super.key});

  Widget _buildHomeTabContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Homeappbar(),
          SizedBox(height: Dimensions.height(20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "Top Doctors",
                    align: TextAlign.start,
                    fontSize: Dimensions.font(18),
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.TOP_DOCTORS_SCREEN),
                    child: AppText(
                      text: "See all >",
                      color: bottomSheetSubtitle,
                      align: TextAlign.start,
                      fontSize: Dimensions.font(14),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height(220),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return DoctorCard(doctor: doctors[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "Popular Profiles",
                    align: TextAlign.start,
                    fontSize: Dimensions.font(18),
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.POPULAR_PROFILES_SCREEN),
                    child: AppText(
                      text: "See all >",
                      color: bottomSheetSubtitle,
                      align: TextAlign.start,
                      fontSize: Dimensions.font(14),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height(260),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return AvatarCard(avatar: avatars[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesTabContent(BuildContext context) {
    return const Center(
      child: Text("Favorites Content", style: TextStyle(fontSize: 18)),
    );
  }

  Widget _buildBookingsTabContent(BuildContext context) {
    return const Center(
      child: Text("Bookings/Journal Content", style: TextStyle(fontSize: 18)),
    );
  }

  Widget _buildChatTabContent(BuildContext context) {
    return const Center(
      child: Text("Chat History Content", style: TextStyle(fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Defaultbackground(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                switch (_homecontroller.selectedTabIndex.value) {
                  case 0:
                    return _buildHomeTabContent(context);
                  case 1:
                    return _buildFavoritesTabContent(context);
                  case 2:
                    return _buildBookingsTabContent(context);
                  case 3:
                    return _buildChatTabContent(context);
                  default:
                    return _buildHomeTabContent(
                      context,
                    ); // Default to home content
                }
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Homebottomnavigation(),
    );
  }
}
