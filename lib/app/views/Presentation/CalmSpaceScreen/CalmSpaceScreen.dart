import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class CalmSpaceScreen extends StatelessWidget {
  const CalmSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.padding(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.height(10)), // Space for the main app bar
            // const AppText(
            //   text: "Calm Space",
            //   fontSize: 28,
            //   fontWeight: FontWeight.bold,
            // ),
            // SizedBox(height: Dimensions.height(4)),
            // AppText(
            //   text: "Your guided mental reset zone.",
            //   color: Colors.grey.shade700,
            //   fontSize: 16,
            // ),
            SizedBox(height: Dimensions.height(10)),
            Expanded(
              child: ListView(
                children: [
                  _buildFeatureCard(
                    icon: Icons.self_improvement_rounded,
                    title: "Box Breathing",
                    subtitle: "Sync your breath, find your center.",
                    onTap: () => Get.toNamed(Routes.BREATHING_EXERCISE_SCREEN),
                    color: Colors.teal,
                  ),
                  SizedBox(height: Dimensions.height(16)),
                  _buildFeatureCard(
                    icon: Icons.headset_rounded,
                    title: "Guided Meditations",
                    subtitle: "Short sessions for clarity and calm.",
                    onTap: () {
                      Get.snackbar("Coming Soon!", "Guided meditations are on the way.");
                    },
                    color: Colors.purple,
                  ),
                  SizedBox(height: Dimensions.height(16)),
                  _buildFeatureCard(
                    icon: Icons.waves_rounded,
                    title: "Ambient Sounds",
                    subtitle: "Mix sounds to create your calm scene.",
                    onTap: () {
                      Get.snackbar("Coming Soon!", "The sound mixer is being built.");
                    },
                    color: Colors.blue,
                  ),
                  SizedBox(height: Dimensions.height(100)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shadowColor: color.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius(20)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Dimensions.radius(20)),
        child: Container(
          padding: EdgeInsets.all(Dimensions.padding(20)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius(20)),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.padding(12)),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(Dimensions.radius(15)),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: 30),
              ),
              SizedBox(width: Dimensions.width(16)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: title, fontSize: 18, fontWeight: FontWeight.bold),
                    SizedBox(height: Dimensions.height(4)),
                    AppText(text: subtitle, color: Colors.grey.shade700),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
