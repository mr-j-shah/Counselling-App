class JournalEntry {
  final int? id;
  final String title;
  final String content;
  final int mood;
  final DateTime timestamp;

  JournalEntry({
    this.id,
    required this.title,
    required this.content,
    required this.mood,
    required this.timestamp,
  });

  // Convert a JournalEntry into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'mood': mood,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Implement a constructor that creates a JournalEntry from a Map
  factory JournalEntry.fromMap(Map<String, dynamic> map) {
    return JournalEntry(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      mood: map['mood'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
