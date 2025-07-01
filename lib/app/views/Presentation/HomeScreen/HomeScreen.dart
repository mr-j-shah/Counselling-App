import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/Widgets/SideMenu.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/widgets/MainWidget.dart';
import 'package:project_counselling/app/views/Utils/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure dimensions are initialized once at app start.
    Dimensions.init(context);

    return Scaffold(
      body: Stack(
        children: [
          Sidemenu(),
          const _AnimatedHomeLayers(),
        ],
      ),
    );
  }
}

class _AnimatedHomeLayers extends StatelessWidget {
  const _AnimatedHomeLayers();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Homecontroller>();
    return Obx(() {
      final bool menuOpen = controller.isMenuOpen.value;

      // Shared animation settings
      const Duration animationDuration = Duration(milliseconds: 300);
      const Curve animationCurve = Curves.easeInOut;
      final borderRadius = BorderRadius.circular(menuOpen ? 50 : 0);
      final double scale = menuOpen ? 0.8 : 1.0;

      return Stack(
        children: [
          // Background layer: faded peek of content
          AnimatedPositioned(
            duration: animationDuration,
            curve: animationCurve,
            top: menuOpen ? Dimensions.baseHeight * 0.2 : 0,
            bottom: menuOpen ? Dimensions.baseHeight * 0.2 : 0,
            left: menuOpen ? Dimensions.baseWidth * 0.7 : 0,
            right: menuOpen ? -Dimensions.baseWidth * 0.7 : 0,
            child: AnimatedScale(
              scale: scale,
              duration: animationDuration,
              curve: animationCurve,
              child: AnimatedOpacity(
                opacity: menuOpen ? 0.1 : 1.0,
                duration: animationDuration,
                curve: animationCurve,
                child: AnimatedContainer(
                  duration: animationDuration,
                  curve: animationCurve,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: const Scaffold(
                    backgroundColor: Colors.white,
                    body: Center(child: Text('Background Layer')),
                  ),
                ),
              ),
            ),
          ),

          // Foreground layer: main content
          AnimatedPositioned(
            duration: animationDuration,
            curve: animationCurve,
            top: menuOpen ? Dimensions.baseHeight * 0.1 : 0,
            bottom: menuOpen ? Dimensions.baseHeight * 0.1 : 0,
            left: menuOpen ? Dimensions.baseWidth * 0.75 : 0,
            right: menuOpen ? -Dimensions.baseWidth * 0.75 : 0,
            child: AnimatedScale(
              scale: scale,
              duration: animationDuration,
              curve: animationCurve,
              child: AnimatedContainer(
                duration: animationDuration,
                curve: animationCurve,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                ),
                clipBehavior: Clip.antiAlias,
                child: Mainwidget(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
