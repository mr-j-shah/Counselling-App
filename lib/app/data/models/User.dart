class User {
  String name;
  String email;
  String? dob;
  String? contactNum;
  String? location;

  User({
    required this.name,
    required this.email,
    this.contactNum,
    this.dob,
    this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      dob: json['dob'],
      contactNum: json['contactNum'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'dob': dob,
      'contactNum': contactNum,
      'location': location,
    };
  }
}
