import 'package:project_counselling/app/data/enums/chat_users.dart';

class ChatMessage {
  final ChatUser user;
  final String text;

  ChatMessage({
    required this.user,
    required this.text,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      user: _userTypeFromString(json['role'] as String),
      text: json['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': user.toString().split('.').last, // store as string "AI" or "Talker"
      'content': text,
    };
  }

  static ChatUser _userTypeFromString(String userString) {
    switch (userString.toLowerCase()) {
      case 'user':
        return ChatUser.user;
      case 'assistant':
        return ChatUser.assistant;
      default:
        throw Exception('Unknown user type: $userString');
    }
  }
}