import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_counselling/app/data/models/Avatar.dart';
import 'package:project_counselling/app/data/models/apimodel/ChatMessage.dart';

class ChatHistory {
  final String id;
  final String title;
  final Timestamp timestamp;
  final List<ChatMessage> messages;
  final Avatar? avatar; // Added avatar

  ChatHistory({
    required this.id,
    required this.title,
    required this.timestamp,
    required this.messages,
    this.avatar, // Added avatar
  });

  factory ChatHistory.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    var messagesData = data['messages'] as List<dynamic>? ?? [];
    List<ChatMessage> messages =
        messagesData.map((msg) => ChatMessage.fromJson(msg)).toList();

    return ChatHistory(
      id: doc.id,
      title: data['title'] ?? 'Chat Session',
      timestamp: data['timestamp'] ?? Timestamp.now(),
      messages: messages,
      avatar: data['avatar'] != null ? Avatar.fromJson(data['avatar']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'timestamp': timestamp,
      'messages': messages.map((msg) => msg.toJson()).toList(),
      'avatar': avatar?.toJson(), // Added avatar
    };
  }
}
