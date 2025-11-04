import 'package:project_counselling/app/models/BreathingSession.dart';
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
    final path = join(dbPath, 'breathing_sessions.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
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
}
