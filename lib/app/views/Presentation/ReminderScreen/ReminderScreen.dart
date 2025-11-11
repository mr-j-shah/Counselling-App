import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/ReminderScreen/controller/ReminderController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ReminderController controller = Get.put(ReminderController());

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "Notifications"),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(Dimensions.padding(16)),
                  children: [
                    Obx(() => _buildReminderCard(
                          title: "Daily Journal Reminder",
                          subtitle: "Reflect on your day, every day.",
                          icon: Icons.edit_calendar_rounded,
                          value: controller.journalReminder.value,
                          onChanged: (val) => controller.toggleJournalReminder(val),
                          onTimeTap: () => controller.pickJournalReminderTime(context),
                          time: controller.journalReminderTime.value,
                        )),
                    SizedBox(height: Dimensions.height(16)),
                    Obx(() => _buildReminderCard(
                          title: "Mindfulness Reminder",
                          subtitle: "A moment of calm for your mind.",
                          icon: Icons.self_improvement_rounded,
                          value: controller.mindfulnessReminder.value,
                          onChanged: (val) => controller.toggleMindfulnessReminder(val),
                          onTimeTap: () => controller.pickMindfulnessReminderTime(context),
                          time: controller.mindfulnessReminderTime.value,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReminderCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required Function(bool) onChanged,
    required VoidCallback onTimeTap,
    required TimeOfDay time,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius(15))),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.padding(16)),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: primaryColor, size: 30),
                SizedBox(width: Dimensions.width(16)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: title, fontSize: 18, fontWeight: FontWeight.bold),
                      SizedBox(height: Dimensions.height(4)),
                      AppText(text: subtitle, color: Colors.grey.shade600),
                    ],
                  ),
                ),
                Switch(
                  value: value,
                  onChanged: onChanged,
                  activeColor: primaryColor,
                ),
              ],
            ),
            if (value)
              Column(
                children: [
                  const Divider(height: 24),
                  InkWell(
                    onTap: onTimeTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(text: "Reminder Time"),
                          AppText(
                            text: time.format(Get.context!),
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
