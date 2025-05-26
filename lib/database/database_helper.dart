import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final DATABASE_INIT_QUERY = '''
  CREATE TABLE todos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    priority TEXT NOT NULL,
    reminder_times INTEGER,
    time_reminder TEXT,
    done INTEGER,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
  )
''';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'todo_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(DATABASE_INIT_QUERY);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database upgrades here
    if (oldVersion < 2) {}
  }

  Future<void> closeDatabase() async {
    final db = await database;
    await db.close();
  }
}
