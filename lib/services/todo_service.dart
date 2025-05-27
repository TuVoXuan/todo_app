import 'package:sqflite/sqflite.dart';
import 'package:todo_app/database/database_helper.dart';
import 'package:todo_app/models/todo.dart';

class TodoService {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<int?> insertTodo(Todo todo) async {
    try {
      final db = await _databaseHelper.database;
      return await db.insert(
        'todos',
        todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error inserting todo: $e');
      return null; // Indicate failure
    }
  }

  Future<List<Todo>> getAllTodoForDate(DateTime date) async {
    final db = await _databaseHelper.database;

    final dateStart = DateTime(date.year, date.month, date.day);
    final nextDateStart = dateStart.add(Duration(days: 1));

    final dateStartStr = dateStart.toIso8601String();
    final nextDateStartStr = nextDateStart.toIso8601String();

    final List<Map<String, dynamic>> map = await db.query(
      'todos',
      where: 'created_at >= ? AND created_at < ?',
      whereArgs: [dateStartStr, nextDateStartStr],
    );

    return List.generate(map.length, (index) => Todo.fromMap(map[index]));
  }
}
