enum Priority { low, medium, high }

class Todo {
  final int? id;
  final String title;
  final String priority;
  final String? description;
  final int? reminderTimes;
  final String? timeReminder;
  final bool? done;
  final String? createdAt;

  Todo({
    this.id,
    required this.title,
    required this.priority,
    this.description,
    this.done,
    this.reminderTimes,
    this.timeReminder,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority,
      'done': done != null && done! ? 1 : 0,
      'reminderTimes': reminderTimes,
      'timeReminder': timeReminder,
      'created_at': createdAt,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      priority: map['priority'],
      done: map['done'] == 1,
      reminderTimes: map['reminder_times'],
      timeReminder: map['time_reminder'],
      createdAt: map['created_at'],
    );
  }

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    String? priority,
    bool? done,
    int? reminderTimes,
    String? timeReminder,
    String? createdAt,
  }) {
    return Todo(
      done: done ?? this.done,
      priority: priority ?? this.priority,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      id: id ?? this.id,
      reminderTimes: reminderTimes ?? this.reminderTimes,
      timeReminder: timeReminder ?? this.timeReminder,
    );
  }

  @override
  String toString() {
    return 'Todo{'
        'id: $id, '
        'title: "$title", '
        'priority: "$priority", '
        'description: ${description != null ? '"$description"' : 'null'}, '
        'reminderTimes: $reminderTimes, '
        'timeReminder: ${timeReminder != null ? '"$timeReminder"' : 'null'}, '
        'done: $done, '
        'createdAt: ${createdAt != null ? '"$createdAt"' : 'null'}}';
  }
}
