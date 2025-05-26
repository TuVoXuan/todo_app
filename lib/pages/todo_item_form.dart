import 'package:flutter/material.dart';

class TodoItemForm extends StatelessWidget {
  static const String routeName = '/todo_form';

  const TodoItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Item Form'),
        backgroundColor: Color(0xFF3DCAB1),
      ),
      body: Center(child: Text('Todo Item Form Content Goes Here')),
    );
  }
}
