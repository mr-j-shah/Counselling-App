import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_counselling/app/data/models/Avatar.dart';

class AvatarRepo {
  final CollectionReference _avatarCollection = FirebaseFirestore.instance.collection('avatars');

  Future<List<Avatar>> getAvatars() async {
    try {
      QuerySnapshot snapshot = await _avatarCollection.get();
      return snapshot.docs.map((doc) => Avatar.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print("Error fetching avatars: $e");
      return [];
    }
  }
}
