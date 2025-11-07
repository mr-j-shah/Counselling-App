import 'package:project_counselling/app/models/BreathingSession.dart';
import 'package:project_counselling/app/models/JournalEntry.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'aura_mind.db'); // Renamed db
    return await openDatabase(
      path,
      version: 2, // Incremented version
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await _createBreathingSessionsTable(db);
    await _createJournalEntriesTable(db);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await _createJournalEntriesTable(db);
    }
  }

  Future<void> _createBreathingSessionsTable(Database db) async {
    await db.execute('''
      CREATE TABLE breathing_sessions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        duration INTEGER NOT NULL,
        timestamp TEXT NOT NULL,
        pre_mood INTEGER,
        post_mood INTEGER
      )
    ''');
  }

  Future<void> _createJournalEntriesTable(Database db) async {
    await db.execute('''
      CREATE TABLE journal_entries(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        mood INTEGER NOT NULL,
        timestamp TEXT NOT NULL
      )
    ''');
  }

  // Breathing Session Methods
  Future<void> addSession({
    required int duration,
    required String timestamp,
    required int preMood,
    required int postMood,
  }) async {
    final db = await database;
    await db.insert(
      'breathing_sessions',
      {
        'duration': duration,
        'timestamp': timestamp,
        'pre_mood': preMood,
        'post_mood': postMood,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<BreathingSession>> getSessions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('breathing_sessions');
    return List.generate(maps.length, (i) {
      return BreathingSession.fromMap(maps[i]);
    });
  }

  Future<void> clearAllSessions() async {
    final db = await database;
    await db.delete('breathing_sessions');
  }

  Future<List<BreathingSession>> getSessionsBetweenDates(
      DateTime startDate, DateTime endDate) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'breathing_sessions',
      where: 'timestamp BETWEEN ? AND ?',
      whereArgs: [
        startDate.toIso8601String(),
        endDate.toIso8601String(),
      ],
      orderBy: 'timestamp DESC',
    );
    return List.generate(maps.length, (i) {
      return BreathingSession.fromMap(maps[i]);
    });
  }

  // Journal Entry Methods
  Future<int> addJournalEntry(JournalEntry entry) async {
    final db = await database;
    return await db.insert('journal_entries', entry.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<JournalEntry>> getJournalEntries() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('journal_entries', orderBy: 'timestamp DESC');
    return List.generate(maps.length, (i) {
      return JournalEntry.fromMap(maps[i]);
    });
  }

  Future<int> updateJournalEntry(JournalEntry entry) async {
    final db = await database;
    return await db.update('journal_entries', entry.toMap(), where: 'id = ?', whereArgs: [entry.id]);
  }

  Future<int> deleteJournalEntry(int id) async {
    final db = await database;
    return await db.delete('journal_entries', where: 'id = ?', whereArgs: [id]);
  }
}
