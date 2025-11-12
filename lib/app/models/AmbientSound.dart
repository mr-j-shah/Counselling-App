class AmbientSound {
  final String id;
  final String name;
  final String assetPath;
  final double gain; // Volume, from 0.0 to 1.0

  AmbientSound({
    required this.id,
    required this.name,
    required this.assetPath,
    this.gain = 0.5, // Default volume
  });

  factory AmbientSound.fromJson(Map<String, dynamic> json) => AmbientSound(
        id: json['id'],
        name: json['name'], // Assuming name is also in your config
        assetPath: json['assetPath'], // Assuming path is in your config
        gain: (json['gain'] ?? 0.5).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'assetPath': assetPath,
        'gain': gain,
      };

  // Helper to create a copy with a new gain
  AmbientSound copyWith({double? gain}) {
    return AmbientSound(
      id: id,
      name: name,
      assetPath: assetPath,
      gain: gain ?? this.gain,
    );
  }
}
