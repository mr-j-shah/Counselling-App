import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_counselling/app/data/models/User.dart';

class Userrepo {
  Future<void> addUser(User user) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .doc(user.email)
        .set(user.toJson())
        .then((value) => print("User added successfully!"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<User?> getUserByEmail(String email) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .get();

    if (doc.exists) {
      return User.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      print("No user found with email: $email");
      return null;
    }
  }
}
