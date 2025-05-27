import 'package:flutter/material.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/widgets/select.dart';
import 'package:todo_app/widgets/text_field_custom.dart';
import 'package:todo_app/widgets/time_picker.dart';

final List<Map<String, dynamic>> priorityOptions = [
  {'label': 'Low', 'value': 'low'},
  {'label': 'Medium', 'value': 'medium'},
  {'label': 'High', 'value': 'high'},
];

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
  String _selectedPriority = 'low';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _reminderTimesController.dispose();
    _timeReminderController.dispose();
    super.dispose();
  }

  void _handleSelectPriority(String value) {
    setState(() {
      _selectedPriority = value;
    });
  }

  void _handleSubmitForm() {
    if (_formKey.currentState!.validate()) {
      print('title: ${_titleController.text}');
      print('desc: ${_descriptionController.text}');
      print('reminderTimes: ${_reminderTimesController.text}');
      print('timeReminder: ${_timeReminderController.text}');
      print('priority: $_selectedPriority');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.white),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Color(0xff11111114),
                        ),
                        icon: const Icon(Icons.arrow_back, size: 24),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Create Todo',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                TextFieldCustom(
                  controller: _titleController,
                  label: 'Title',
                  hintText: 'Enter todo title',
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return 'Please enter todo title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Select(
                  label: 'Priority',
                  options: priorityOptions,
                  selectedValue: _selectedPriority,
                  onSelect: _handleSelectPriority,
                ),
                SizedBox(height: 16),
                TextFieldCustom(
                  controller: _descriptionController,
                  label: 'Description',
                  hintText: 'Enter todo description',
                  maxLines: 5,
                ),
                SizedBox(height: 16),
                TextFieldCustom(
                  controller: _reminderTimesController,
                  label: 'Reminder Times',
                  hintText: 'Enter reminder times (e.g., 1)',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                TimePicker(
                  controller: _timeReminderController,
                  label: 'Time Reminder',
                  hintText: 'Tap to select time',
                ),
                SizedBox(height: 64),
                ElevatedButton(
                  onPressed: _handleSubmitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF3DCAB1),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
