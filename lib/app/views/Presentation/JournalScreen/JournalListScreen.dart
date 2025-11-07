import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/JournalScreen/controller/JournalController.dart';
import 'package:project_counselling/app/views/Presentation/JournalScreen/widgets/JournalEntryCard.dart';
import 'package:project_counselling/app/routers/AppRoutes.dart';

class JournalListScreen extends StatelessWidget {
  const JournalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final JournalController controller = Get.put(JournalController());

    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "My Journal"),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.journalEntries.isEmpty) {
                    return const Center(
                      child: Text("No journal entries yet."),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.journalEntries.length,
                    itemBuilder: (context, index) {
                      final entry = controller.journalEntries[index];
                      return JournalEntryCard(entry: entry);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.JOURNAL_ENTRY_SCREEN),
        child: const Icon(Icons.add),
      ),
    );
  }
}
