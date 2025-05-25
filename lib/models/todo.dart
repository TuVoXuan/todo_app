enum Priority { low, medium, high }

class Todo {
  String title;
  Priority priority;
  String? description;
  bool done;

  Todo({
    required this.title,
    required this.priority,
    this.description,
    required this.done,
  });
}
