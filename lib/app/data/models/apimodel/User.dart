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

  User copyWith({
    String? userID,
    String? name,
    String? email,
    String? dob,
    String? contactNum,
    String? location,
  }) {
    return User(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      contactNum: contactNum ?? this.contactNum,
      location: location ?? this.location,
    );
  }
}
