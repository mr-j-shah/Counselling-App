import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_counselling/app/data/models/ChatHistory.dart';
import 'package:project_counselling/app/data/models/apimodel/ChatMessage.dart';

class ChatRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const int _basicAccountChatLimit = 5;

  CollectionReference _getChatHistoryCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('chat_history');
  }

  Future<bool> saveChatHistory({
    required String userId,
    required List<ChatMessage> messages,
    required String title,
  }) async {
    try {
      final collection = _getChatHistoryCollection(userId);
      final snapshot = await collection.get();

      if (snapshot.docs.length >= _basicAccountChatLimit) {
        print("Chat limit reached for user: $userId");
        return false;
      }

      final newChat = ChatHistory(
        id: '', // Firestore will generate this
        title: title,
        timestamp: Timestamp.now(),
        messages: messages,
      );

      await collection.add(newChat.toFirestore());
      print("Chat history saved successfully for user: $userId");
      return true;
    } catch (e) {
      print("Error saving chat history: $e");
      throw Exception("Failed to save chat session.");
    }
  }

  Future<List<ChatHistory>> getChatHistories(String userId) async {
    try {
      final snapshot = await _getChatHistoryCollection(userId)
          .orderBy('timestamp', descending: true)
          .get();
      return snapshot.docs.map((doc) => ChatHistory.fromFirestore(doc)).toList();
    } catch (e) {
      print("Error fetching chat histories: $e");
      return [];
    }
  }

  Future<void> deleteChatHistory({
    required String userId,
    required String historyId,
  }) async {
    try {
      await _getChatHistoryCollection(userId).doc(historyId).delete();
      print("Chat history deleted successfully: $historyId");
    } catch (e) {
      print("Error deleting chat history: $e");
      throw Exception("Failed to delete chat session.");
    }
  }
}
