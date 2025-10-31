import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_counselling/app/data/models/apimodel/ChatMessage.dart';
import 'package:project_counselling/app/data/enums/chat_users.dart';
import 'package:project_counselling/app/views/AppWidgets/CustomAppBar.dart';
import 'package:project_counselling/app/views/AppWidgets/DefaultBackground.dart';
import 'package:project_counselling/app/views/Presentation/SpeechScreen/controller/SpeechController.dart';
import 'package:project_counselling/app/views/Utils/Colors.dart';
import 'package:project_counselling/app/views/Utils/Dimensions.dart';

class UserChatScreen extends GetView<SpeechController> {
  UserChatScreen({super.key});

  final TextEditingController _textController = TextEditingController();

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      controller.sendTextMessage(text);
      _textController.clear();
    }
  }

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
                child: Obx(
                  () => ListView.builder(
                    padding: const EdgeInsets.all(12),
                    reverse: true, // Show latest messages at the bottom
                    itemCount: controller.messageList.length,
                    itemBuilder: (context, index) {
                      final reversedIndex =
                          controller.messageList.length - 1 - index;
                      final msg = controller.messageList[reversedIndex];
                      final isUser = msg.user == ChatUser.user;

                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isUser ? primaryColor : Colors.grey.shade300,
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
              ),
              _buildMessageInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: "Type a message...",
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: primaryColor),
              onPressed: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
