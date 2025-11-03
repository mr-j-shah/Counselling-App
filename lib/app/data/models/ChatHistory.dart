import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_counselling/app/data/models/apimodel/ChatMessage.dart';

class ChatHistory {
  final String id;
  final String title;
  final Timestamp timestamp;
  final List<ChatMessage> messages;

  ChatHistory({
    required this.id,
    required this.title,
    required this.timestamp,
    required this.messages,
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
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'timestamp': timestamp,
      'messages': messages.map((msg) => msg.toJson()).toList(),
    };
  }
}
