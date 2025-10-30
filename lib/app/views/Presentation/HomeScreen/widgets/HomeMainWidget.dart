import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/Doctor.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/AvatarCard.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/DoctorCard.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/HomeAppbar.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/HomeBottomnavigation.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/SlideToBegin.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

import '../../../../Constants/AppAssets.dart';
import 'HomeScreenSectionTitle.dart';
import 'StartFreeSessionCard.dart';

class HomeMainwidget extends StatelessWidget {
  final Homecontroller _homecontroller = Get.find<Homecontroller>();

  HomeMainwidget({super.key});

  Widget _buildHomeTabContent(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dimensions.height(250)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: Startfreesessioncard(
                  onPressed: _homecontroller.navigateToFreeCounselling,
                ),
              ),
              SizedBox(height: Dimensions.height(10)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 0,
                ),
                child: HomeScreenSectionTitle(
                  title: "Popular Profiles",
                  onPressed: () {
                    Get.toNamed(Routes.POPULAR_PROFILES_SCREEN, arguments: _homecontroller.avatarList);
                  },
                ),
              ),
              SizedBox(height: Dimensions.height(10)),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: AvatarList(),
              ),
              SizedBox(height: Dimensions.height(10)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 0,
                ),
                child: HomeScreenSectionTitle(
                  title: "Top Doctors",
                  onPressed: () {
                    Get.toNamed(Routes.TOP_DOCTORS_SCREEN);
                  },
                ),
              ),
              SizedBox(height: Dimensions.height(10)),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: DoctorList(),
              ),
              SizedBox(height: Dimensions.height(80)),
            ],
          ),
        ),
        Homeappbar(),
      ],
    );
  }

  Widget _buildFavoritesTabContent(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: Dimensions.height(12)),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ),
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(Dimensions.radius(16)),
              child: SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.padding(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.height(12)),
                      Image.asset(Appassets.BreathingExerciseImage,width: Dimensions.width(200)),
                      SizedBox(height: Dimensions.height(14)),
                      SlideToBegin(onSlideCompleted: () =>
                          Get.toNamed(Routes.BREATHING_EXERCISE_SCREEN), text: "Box Breathing",)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
        child: Stack(
          children: [
            Obx(() {
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
            Positioned(bottom: -Dimensions.height(1),
                left: 0,
                right: 0, child: Homebottomnavigation()),
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
  final Homecontroller _homecontroller = Get.find<Homecontroller>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height(260),
      child: Obx(()=>ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _homecontroller.homeScreenAvatars.length,
        itemBuilder: (context, index) {
          return AvatarCard(avatar: _homecontroller.homeScreenAvatars[index]);
        },
      ),)
    );
  }
}
