class BreathingSession {
  final int id;
  final int duration;
  final DateTime timestamp;
  final int preMood;
  final int postMood;

  BreathingSession({
    required this.id,
    required this.duration,
    required this.timestamp,
    required this.preMood,
    required this.postMood,
  });

  factory BreathingSession.fromMap(Map<String, dynamic> map) {
    return BreathingSession(
      id: map['id'],
      duration: map['duration'],
      timestamp: DateTime.parse(map['timestamp']),
      preMood: map['pre_mood'],
      postMood: map['post_mood'],
    );
  }
}
