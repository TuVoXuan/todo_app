import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/widgets/svg_assets.dart';
import 'package:todo_app/widgets/svg_icon.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          SizedBox(width: 8),
          CustomSlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFE53935),
            borderRadius: BorderRadius.circular(8),
            child: Center(
              child: SvgIcon(name: SvgIconName.trash, color: Colors.white),
            ),
            // child: Icon(Icons.delete, size: 24, color: Colors.white),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 17),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleCheckbox(value: todo.done, onChanged: (value) {}),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todo.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                          ),
                        ),
                        if (todo.description != null)
                          Text(
                            todo.description!,
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.6,
                              fontWeight: FontWeight.w300,
                              color: Color.fromRGBO(120, 130, 138, 1),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                PriorityBadge(priority: todo.priority),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                height: 1,
                color: Color.fromRGBO(227, 231, 236, 1),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Reminder: 4 times',
                  style: TextStyle(
                    color: Color.fromRGBO(120, 130, 138, 1),
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    SvgIcon(
                      name: SvgIconName.clock,
                      size: 15,
                      color: Color(0xFF78828A),
                    ),
                    SizedBox(width: 8),
                    const Text(
                      '10.00 AM',
                      style: TextStyle(
                        color: Color.fromRGBO(120, 130, 138, 1),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PriorityBadge extends StatelessWidget {
  final String priority;

  const PriorityBadge({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    String displayText;
    Color textColor = Colors.white;

    switch (priority) {
      case 'low':
        bgColor = hexToColor('#E6F9F0');
        displayText = 'Low';
        textColor = hexToColor('#00C566');
        break;
      case 'medium':
        bgColor = hexToColor('#F4F0FF');
        displayText = 'Medium';
        textColor = hexToColor('#936DFF');
      case 'high':
        bgColor = hexToColor('#FFEDED');
        displayText = 'High';
        textColor = hexToColor('#FF4747');
      default:
        bgColor = hexToColor("#95A5A6");
        displayText = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: bgColor,
      ),
      child: Text(
        displayText,
        style: TextStyle(color: textColor, fontSize: 12, height: 1.6),
      ),
    );
  }
}

class CircleCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CircleCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CircleCheckbox> createState() => _CircleCheckboxState();
}

class _CircleCheckboxState extends State<CircleCheckbox> {
  void _toggleCheckbox() {
    widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                widget.value
                    ? Color.fromRGBO(61, 202, 177, 1)
                    : Color.fromRGBO(227, 233, 237, 1),
            width: 1,
          ),
          color:
              widget.value
                  ? Color.fromRGBO(61, 202, 177, 1)
                  : Colors.transparent,
        ),
        child:
            widget.value
                ? Center(
                  child: SvgIcon(
                    name: SvgIconName.check,
                    size: 10,
                    color: Colors.white,
                  ),
                )
                : null,
      ),
    );
  }
}
