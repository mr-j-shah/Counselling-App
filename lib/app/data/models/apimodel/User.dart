class User {
  String userID;
  String name;
  String email;
  String? dob;
  String? contactNum;
  String? location;

  User({
    required this.userID,
    required this.name,
    required this.email,
    this.contactNum,
    this.dob,
    this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      dob: json['dob'],
      contactNum: json['contactNum'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'name': name,
      'email': email,
      'dob': dob,
      'contactNum': contactNum,
      'location': location,
    };
  }
}
