import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_counselling/app/data/models/apimodel/User.dart';

class Userrepo {
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) {
    return _usersCollection
        .doc(user.userID)
        .set(user.toJson())
        .then((value) => print("User added successfully!"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<User?> getUserByUserID(String userID) async {
    try {
      DocumentSnapshot doc = await _usersCollection.doc(userID).get();

      if (doc.exists) {
        return User.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print("No user found with userID: $userID");
        return null;
      }
    } catch (e) {
      print("Error fetching user: $e");
      return null;
    }
  }

  Future<void> updateUser(User user) {
    return _usersCollection
        .doc(user.userID)
        .update(user.toJson())
        .then((value) => print("User updated successfully!"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
