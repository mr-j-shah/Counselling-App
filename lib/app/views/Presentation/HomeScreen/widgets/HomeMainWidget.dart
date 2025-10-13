import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/HomeAppbar.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/HomeBottomnavigation.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class HomeMainwidget extends StatelessWidget {
  final Homecontroller _homecontroller = Get.find<Homecontroller>();
  HomeMainwidget({super.key});

  Widget _buildHomeTabContent(BuildContext context) {
    return Column(
      children: [
        Homeappbar(),
        SizedBox(
          height: Dimensions.height(20),
        ),
        Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Agent image
                // Lottie.asset('assets/lottie/agent.json'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _homecontroller.navigateToCounsellingHindi,
                      icon: const Icon(Icons.language),
                      label: const Text("हिन्दी"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: _homecontroller.navigateToCounsellingEnglish,
                      icon: const Icon(Icons.language),
                      label: const Text("English"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
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
                    return _buildHomeTabContent(context); // Default to home content
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
