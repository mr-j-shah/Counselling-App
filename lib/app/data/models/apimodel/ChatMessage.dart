import 'package:project_counselling/app/data/enums/chat_users.dart';

class ChatMessage {
  final ChatUser user;
  final String text;

  ChatMessage({required this.user, required this.text});

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      user: (json['user'] as String) == 'user'
          ? ChatUser.user
          : ChatUser.assistant,
      text: json['text'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toString().split('.').last,
      'text': text,
    };
  }
}
