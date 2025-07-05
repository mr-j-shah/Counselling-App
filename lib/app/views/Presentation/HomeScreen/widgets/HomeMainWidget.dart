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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Defaultbackground(
        child: Column(
          children: [
            Homeappbar(),
            SizedBox(
              height: Dimensions.height(20),
            ),
            Expanded(
              child: Column(
                children: [
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
                                onPressed:
                                    _homecontroller.navigateToCounsellingEnglish,
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
              ),
            ),
            Homebottomnavigation()
          ],
        ),
      ),
    );
    
  }
}
