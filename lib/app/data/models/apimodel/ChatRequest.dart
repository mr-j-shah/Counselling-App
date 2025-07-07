import 'package:project_counselling/app/data/models/apimodel/ChatMessage.dart';

class ChatRequest {
  final List<ChatMessage> messages;

  ChatRequest({required this.messages});

  factory ChatRequest.fromJson(Map<String, dynamic> json) {
    return ChatRequest(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messages': messages.map((e) => e.toJson()).toList(),
    };
  }
}