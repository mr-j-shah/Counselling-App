import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/models/JournalEntry.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/Presentation/JournalScreen/controller/JournalController.dart';
import 'package:project_counselling/app/views/Presentation/JournalScreen/widgets/JournalEntryCard.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class MindJournalScreen extends StatelessWidget {
  const MindJournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final JournalController controller = Get.put(JournalController());

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.padding(16)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.height(10)),
            _buildReflectionCard(),
            SizedBox(height: Dimensions.height(24)),
            _buildQuickActions(),
            SizedBox(height: Dimensions.height(24)),
            const AppText(
              text: "Recent Entries",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Dimensions.height(10)),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.journalEntries.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Dimensions.padding(40)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book_rounded, size: 60, color: Colors.grey.shade400),
                        SizedBox(height: Dimensions.height(16)),
                        const AppText(
                          text: "Your journal is empty.",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: Dimensions.height(8)),
                        const AppText(
                          text: "Tap 'Express Now' to write down your thoughts and feelings.",
                          color: Colors.grey,
                          align: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }
              // Use ListView.separated for better spacing and to prevent scroll issues
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.journalEntries.length,
                separatorBuilder: (context, index) => SizedBox(height: Dimensions.height(12)),
                itemBuilder: (context, index) {
                  final entry = controller.journalEntries[index];
                  return GestureDetector(
                    onTap: () => Get.toNamed(Routes.JOURNAL_ENTRY_SCREEN, arguments: entry),
                    child: JournalEntryCard(entry: entry),
                  );
                },
              );
            }),
            SizedBox(height: Dimensions.height(120)), // Padding at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildReflectionCard() {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding(16)),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(Dimensions.radius(15)),
        border: Border.all(color: primaryColor.withOpacity(0.2)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "Reflection of the Day",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          SizedBox(height: 8),
          AppText(
            text: "\"The greatest glory in living lies not in never falling, but in rising every time we fall.\" - Nelson Mandela",
            color: Colors.black87,
            fontSize: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      children: [
        Expanded(
          child: _buildActionCard(
            icon: Icons.edit_note_rounded,
            label: "Express Now",
            onTap: () => Get.toNamed(Routes.JOURNAL_ENTRY_SCREEN),
          ),
        ),
        SizedBox(width: Dimensions.width(12)),
        Expanded(
          child: _buildActionCard(
            icon: Icons.bar_chart_rounded,
            label: "Mood Trends",
            onTap: () {
            },
          ),
        ),
        SizedBox(width: Dimensions.width(12)),
        Expanded(
          child: _buildActionCard(
            icon: Icons.psychology_alt_rounded,
            label: "AI Insights",
            onTap: () {
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.padding(16)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: primaryColor, size: 32),
            SizedBox(height: Dimensions.height(8)),
            AppText(
              text: label,
              fontSize: 14,
              align: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
