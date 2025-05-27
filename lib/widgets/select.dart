import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  final String label;
  final List<Map<String, dynamic>> options;
  final dynamic selectedValue;
  final Function(String) onSelect;

  const Select({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onSelect,
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
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children:
              options.map((option) {
                return SelectItem(
                  label: option['label'],
                  value: option['value'],
                  isSelected: option['value'] == selectedValue,
                  onSelect: onSelect,
                );
              }).toList(),
        ),
      ],
    );
  }
}

class SelectItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isSelected;
  final Function(String) onSelect;

  const SelectItem({
    super.key,
    required this.label,
    required this.value,
    this.isSelected = false,
    required this.onSelect,
  });

  void _onTap() {
    onSelect(value);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected ? Color(0xFF3DCAB1) : Color(0xFFE9EBED),
              width: 1,
            ),
            color: isSelected ? Color(0xFF3DCAB1) : Colors.white,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              height: 1.67,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Color(0xFF111111),
            ),
          ),
        ),
      ),
    );
  }
}
