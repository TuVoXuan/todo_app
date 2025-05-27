import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  const TimePicker({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
  });

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

    if (picked != null) {
      setState(() {
        selectedTime = picked;
        widget.controller.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            height: 1.57,
            color: Color(0xFF78828A),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          readOnly: true,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.access_time),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Color(0xFF9CA4AB),
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            filled: true,
            fillColor: Color(0xFFF6F8FE),
          ),
          onTap: _selectTime,
        ),
      ],
    );
  }
}
