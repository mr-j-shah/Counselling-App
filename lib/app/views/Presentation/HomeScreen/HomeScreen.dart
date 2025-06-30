import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/SideMenu.dart';

class Homescreen extends StatelessWidget {
  final Homecontroller homecontroller = Get.put(Homecontroller());

  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Sidemenu(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: homecontroller.isMenuOpen.value
                ? Dimensions.baseHeight * 0.2
                : 0,
            bottom: homecontroller.isMenuOpen.value
                ? Dimensions.baseHeight * 0.2
                : 0,
            left: homecontroller.isMenuOpen.value
                ? Dimensions.baseWidth * 0.65
                : 0,
            right: homecontroller.isMenuOpen.value
                ? -Dimensions.baseWidth * 0.65
                : 0, // <-- hide part
            child: Opacity(opacity: 0.3, child: MainWidget()),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: homecontroller.isMenuOpen.value
            
                ? Dimensions.baseHeight * 0.1
                : 0,
            bottom: homecontroller.isMenuOpen.value
                ? Dimensions.baseHeight * 0.1
                : 0,
            left: homecontroller.isMenuOpen.value
                ? Dimensions.baseWidth * 0.75
                : 0,
            right: homecontroller.isMenuOpen.value
                ? -Dimensions.baseWidth * 0.75
                : 0, // <-- hide part
            child: MainWidget(),
          ),
        ],
      );
    });
  }

  Transform MainWidget() {
    return Transform.scale(
      scale: homecontroller.isMenuOpen.value ? 0.8 : 1.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          homecontroller.isMenuOpen.value ? 50 : 0,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Counselling Application"),
            leading: IconButton(
              onPressed: homecontroller.toggleMenu,
              icon: Icon(Icons.menu),
            ),
          ),
          body: Center(
            child: Card(
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
                    Lottie.asset('assets/lottie/agent.json'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: homecontroller.navigateToCounsellingHindi,
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
                              homecontroller.navigateToCounsellingEnglish,
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
          ),
        ),
      ),
    );
  }
}
