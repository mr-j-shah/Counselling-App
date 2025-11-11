import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/Doctor.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/AvatarCard.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/DoctorCard.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/HomeAppbar.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/HomeBottomnavigation.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/StopStreakBreakCard.dart';
import 'package:project_counselling/app/views/Presentation/MindJournalScreen/MindJournalScreen.dart';
import 'package:project_counselling/app/views/Presentation/ReminderScreen/ReminderBottomSheet.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';
import '../../../../data/services/local/NotificationService.dart';
import '../../../AppWidgets/ComingSoonWidget.dart';
import 'HomeScreenSectionTitle.dart';
import 'StartFreeSessionCard.dart';

class HomeMainwidget extends StatelessWidget {
  final Homecontroller _homecontroller = Get.find<Homecontroller>();
  final NotificationService _notificationService = Get.find<NotificationService>();

  HomeMainwidget({super.key});

  Widget _buildHomeTabContent(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dimensions.height(230)),
              Obx(() {
                return _homecontroller.showStreakCard.value
                    ? StopStreakBreakCard(
                        onStartBreathing: _homecontroller.navigateToBoxBreathing,
                      )
                    : const SizedBox.shrink();
              }),
              SizedBox(
                height: Dimensions.height(250),
                child: CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Startfreesessioncard(
                      title: "Begin Your Healing Journey",
                      subString: "Take your Quick session with default and discover how mindful conversations can transform your mental wellbeing.",
                      buttonText: "Start Session",
                      onPressed: _homecontroller.navigateToFreeCounselling,
                    ),

                    Startfreesessioncard(
                      title: "Feeling Stressed?",
                      subString: "Do Breathing Exercises with guided audio to find immediate calm and recenter your mind.",
                      buttonText: "Box Breathing",
                      onPressed: _homecontroller.navigateToBoxBreathing,
                    ),

                    Startfreesessioncard(
                      title: "Want to add Reminder?",
                      subString: "Busy right now? Schedule a future session reminder so you don't miss out on your path to wellness.",
                      buttonText: "Set Reminder", // Changed button text for clarity
                      onPressed: (){
                        showReminderBottomSheet(context, (TimeOfDay p1){
                          _notificationService.scheduleDailyReminder(
                            id: 2,
                            title: '🧘 Time for a mindful moment',
                            body: 'Take a deep breath and find your calm.',
                            time: p1,
                          );
                        });
                      }, // Assumed navigation change
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.linear,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    autoPlayInterval: const Duration(seconds: 5),
                    viewportFraction: 1,
                  ),
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
                    Get.toNamed(Routes.POPULAR_PROFILES_SCREEN,
                        arguments: _homecontroller.avatarList);
                  },
                ),
              ),
              SizedBox(height: Dimensions.height(10)),
              AvatarList(),
              SizedBox(height: Dimensions.height(120)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMindJournalTabContent(BuildContext context) {
    return const MindJournalScreen();
  }

  Widget _buildBookingsTabContent(BuildContext context) {
    return const ComingSoonWidget();
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
                  return _buildMindJournalTabContent(context);
                case 2:
                  return _buildBookingsTabContent(context);
                default:
                  return _buildHomeTabContent(
                    context,
                  ); // Default to home content
              }
            }),
            Homeappbar(),
            Positioned(
                bottom: -Dimensions.height(1),
                left: 0,
                right: 0,
                child: Homebottomnavigation()),
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
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _homecontroller.homeScreenAvatars.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: index==0?10:0,right: index==(_homecontroller.homeScreenAvatars.length-1)?10:0),
                child: AvatarCard(
                    avatar: _homecontroller.homeScreenAvatars[index]),
              );
            },
          ),
        ));
  }
}
