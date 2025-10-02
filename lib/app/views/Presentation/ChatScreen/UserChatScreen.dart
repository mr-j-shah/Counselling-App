import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/apimodel/ChatMessage.dart';
import 'package:project_counselling/app/data/enums/chat_users.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart'; // Added
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart'; // Added
import 'package:project_counselling/app/views/Utils/Dimensions.dart'; // Added

class UserChatScreen extends StatelessWidget {
  final List<ChatMessage> messages;

  UserChatScreen({super.key})
      : messages = Get.arguments ?? [];
 
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context); // Initialize Dimensions
    return Scaffold(
      body: Defaultbackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(title: "Chat"), // Added CustomAppBar
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final isUser = msg.user == ChatUser.user;

                    return Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.blueAccent : Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(16),
                            topRight: const Radius.circular(16),
                            bottomLeft: Radius.circular(isUser ? 16 : 0),
                            bottomRight: Radius.circular(isUser ? 0 : 16),
                          ),
                        ),
                        child: Text(
                          msg.text,
                          style: TextStyle(
                            color: isUser ? Colors.white : Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
