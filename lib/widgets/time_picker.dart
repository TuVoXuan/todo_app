import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final TextEditingController controller;
  const TimePicker({super.key, required this.controller});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        widget.controller.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Reminder Time',
        hintText: 'Tap to select time',
        suffixIcon: Icon(Icons.access_time),
      ),
      onTap: _selectTime,
    );
  }
}
