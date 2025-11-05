import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Presentation/HomeScreen/controller/HomeController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class Homebottomnavigation extends StatelessWidget {
  const Homebottomnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final homeController = Get.find<Homecontroller>();

    return Container(
      height: Dimensions.height(85),
      color: Colors.transparent, // The painter draws the background
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Custom painted bar with a primary color shadow
          CustomPaint(
            size: Size(Dimensions.baseWidth, 85),
            painter: _NavPainter(color: primaryColor),
          ),
          // Center button - position adjusted to be closer to the bar
          Positioned(
            top: -22, // Reduced from -25 to lessen the gap
            child: GestureDetector(
              onTap: () => homeController.changeTabIndex(1),
              child: Column(
                children: [
                  Container(
                    width: Dimensions.width(60),
                    height: Dimensions.height(60),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.25),
                          blurRadius: Dimensions.radius(10),
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Image.asset('assets/images/Splash_Logo.png'),
                  ),
                  SizedBox(height: Dimensions.height(10)),
                  Obx(
                    () {
                      return AppText(text: "Aura Mind",
                        fontWeight: FontWeight.bold,color: homeController.selectedTabIndex.value == 1 ? primaryColor : Colors.black,);
                    }
                  ),
                ],
              ),
            ),
          ),

          // Navigation items
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(homeController, Icons.home_rounded, "Exercise", 0),
                const SizedBox(width: 40), // Space for the center button
                _buildNavItem(
                    homeController, Icons.chat_bubble, "Chat", 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    Homecontroller controller,
    IconData icon,
    String label,
    int index,
  ) {
    final isSelected = controller.selectedTabIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changeTabIndex(index),
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryColor : Colors.grey[600],
            size: Dimensions.height(30),
          ),
        ],
      ),
    );
  }
}

class _NavPainter extends CustomPainter {
  final Color color;
  _NavPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final notchRadius = Dimensions.radius(30);
    final center = size.width / 2;

    path.moveTo(0, Dimensions.width(20));
    path.quadraticBezierTo(size.width * 0.05, 5, size.width * 0.1, 5);
    path.lineTo(center - notchRadius - 10, 5);
    path.arcToPoint(
      Offset(center + notchRadius + 10, 5),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(size.width * 0.9, 5);
    path.quadraticBezierTo(size.width * 0.95, 5, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Use primary color for the shadow to create a glow effect
    canvas.drawShadow(path, color.withOpacity(0.3), 10.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
