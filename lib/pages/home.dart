import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/svg_icon.dart';
import 'package:todo_app/widgets/todo_item.dart';

final List<Todo> todos = [
  Todo(title: 'do home work', priority: Priority.high, done: true),
  Todo(
    title: 'playing game',
    description: 'play honor of king',
    priority: Priority.low,
    done: false,
  ),
  Todo(
    title: 'go gym',
    description: 'go to the nearest gym',
    priority: Priority.medium,
    done: true,
  ),
];

class Home extends StatelessWidget {
  static const String routeName = '/';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM').format(today);

    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mẫn Nhi',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Frontend Developer',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(120, 130, 138, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 40,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Today Todo List',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      color: Color.fromRGBO(156, 164, 171, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemBuilder: (context, index) {
                  final currTodo = todos[index];
                  return TodoItem(todo: currTodo);
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: todos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
