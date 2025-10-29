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
import 'HomeScreenSectionTitle.dart';
import 'StartFreeSessionCard.dart';

class HomeMainwidget extends StatelessWidget {
  final Homecontroller _homecontroller = Get.find<Homecontroller>();

  HomeMainwidget({super.key});

  Widget _buildHomeTabContent(BuildContext context) {
    return Column(
      children: [
        Homeappbar(),
        SizedBox(height: Dimensions.height(20)),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height(10)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Startfreesessioncard(
                    onPressed: _homecontroller.navigateToFreeCounselling,
                  ),
                ),
                SizedBox(height: Dimensions.height(10)),
                Padding(
                  padding: const  EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: HomeScreenSectionTitle(
                    title: "Popular Profiles",
                    onPressed: () {
                      Get.toNamed(Routes.POPULAR_PROFILES_SCREEN);
                    },
                  ),
                ),
                SizedBox(height: Dimensions.height(10)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,0,0),
                  child: AvatarList(),
                ),
                SizedBox(height: Dimensions.height(10)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: HomeScreenSectionTitle(
                    title: "Top Doctors",
                    onPressed: () {
                      Get.toNamed(Routes.TOP_DOCTORS_SCREEN);
                    },
                  ),
                ),
                SizedBox(height: Dimensions.height(10)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,0,0),
                  child: DoctorList(),
                ),
                SizedBox(height: Dimensions.height(10)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFavoritesTabContent(BuildContext context) {
    return const Center(
      child: Text("Meditation Steps Content", style: TextStyle(fontSize: 18)),
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
            Homebottomnavigation()
          ],
        ),
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height(220),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return DoctorCard(doctor: doctors[index]);
        },
      ),
    );
  }
}

class AvatarList extends StatelessWidget {
  const AvatarList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height(260),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return AvatarCard(avatar: avatars[index]);
        },
      ),
    );
  }
}
