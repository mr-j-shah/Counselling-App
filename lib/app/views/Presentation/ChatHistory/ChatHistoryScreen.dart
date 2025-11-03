import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_counselling/app/views/AppWidgets/AppText.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/ChatHistory/controller/ChatHistoryController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class ChatHistoryScreen extends GetView<ChatHistoryController> {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "My Sessions"),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.errorMessage.isNotEmpty) {
                    return Center(
                      child: AppText(text: controller.errorMessage.value, align: TextAlign.center,),
                    );
                  }
                  if (controller.chatHistories.isEmpty) {
                    return Center(
                      child: AppText(text: "You have no saved chats yet."),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.chatHistories.length,
                    itemBuilder: (context, index) {
                      final history = controller.chatHistories[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: Dimensions.width(16), vertical: Dimensions.height(8)),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimensions.radius(12)),
                        ),
                        child: ListTile(
                          title: AppText(text: history.title, fontWeight: FontWeight.bold,),
                          subtitle: AppText(text: DateFormat('MMM d, yyyy - hh:mm a').format(history.timestamp.toDate()),),
                          trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400,),
                          onTap: () => controller.navigateToChatDetail(history),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
