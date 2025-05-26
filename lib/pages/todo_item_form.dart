import 'package:flutter/material.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/widgets/time_picker.dart';

class TodoItemForm extends StatefulWidget {
  static const String routeName = '/todo_form';

  const TodoItemForm({super.key});

  @override
  State<TodoItemForm> createState() => _TodoItemFormState();
}

class _TodoItemFormState extends State<TodoItemForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _reminderTimesController =
      TextEditingController();
  final TextEditingController _timeReminderController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _reminderTimesController.dispose();
    _timeReminderController.dispose();
    super.dispose();
  }

  void _handleSubmitForm() {
    if (_formKey.currentState!.validate()) {
      print('title: ${_titleController.text}');
      print('desc: ${_descriptionController.text}');
      print('reminderTimes: ${_reminderTimesController.text}');
      print('timeReminder: ${_timeReminderController.text}');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Item Form'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.white),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter todo title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter todo title',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter todo description',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _reminderTimesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Remider Times',
                  hintText: 'Enter reminder times (e.g., 1)',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: 16),
              TimePicker(controller: _timeReminderController),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _handleSubmitForm,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
