import 'package:project_counselling/app/models/AmbientSound.dart';

class AmbientScene {
  final String id;
  final String title;
  final String moodLabel;
  final String affirmation;
  final List<AmbientSound> sounds;

  AmbientScene({
    required this.id,
    required this.title,
    required this.moodLabel,
    required this.affirmation,
    required this.sounds,
  });

  factory AmbientScene.fromJson(Map<String, dynamic> json) => AmbientScene(
        id: json['id'] ?? 'scene_${DateTime.now().millisecondsSinceEpoch}', // Generate an ID if missing
        title: json['title'] ?? 'Untitled Scene',
        moodLabel: json['mood_label'] ?? 'Calm',
        affirmation: json['affirmation'] ?? 'Enjoy this moment of peace.',
        sounds: (json['sounds'] as List? ?? [])
            .map((e) => AmbientSound.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'moodLabel': moodLabel,
        'affirmation': affirmation,
        'sounds': sounds.map((s) => s.toJson()).toList(),
      };
}
