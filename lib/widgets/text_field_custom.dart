import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String label;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Function(String)? onValidate;

  const TextFieldCustom({
    super.key,
    required this.controller,
    this.onValidate,
    this.hintText,
    required this.label,
    this.maxLines,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            height: 1.57,
            color: Color(0xFF78828A),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator:
              onValidate != null ? (value) => onValidate!(value ?? '') : null,
          decoration: InputDecoration(
            hintText: hintText,
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
        ),
      ],
    );
  }
}
