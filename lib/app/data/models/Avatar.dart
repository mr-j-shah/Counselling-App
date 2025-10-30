class Avatar {
  final String name;
  final String occupation;
  final String description;
  final String imageUrl;
  final int rating;

  Avatar({
    required this.name,
    required this.occupation,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      name: json['name'] ?? '',
      occupation: json['occupation'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      rating: (json['rating'] ?? 0).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'occupation': occupation,
      'description': description,
      'imageUrl': imageUrl,
      'rating': rating,
    };
  }
}

