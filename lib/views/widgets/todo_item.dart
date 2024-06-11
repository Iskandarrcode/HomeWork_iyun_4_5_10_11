import 'package:flutter/material.dart';
import 'package:iyun4/main.dart';

bool isChecked = false;

class TodoItem extends StatefulWidget {
  final String title;
  final DateTime dateTime;
  final Function() onDelete;
  final Function() onEdit;

  const TodoItem({
    super.key,
    required this.title,
    required this.onDelete,
    required this.onEdit,
    required this.dateTime,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          setState(() {
            isChecked = !isChecked;
            if (isChecked == true) {
              countTrue++;
              if (countFalse > 0) {
                countFalse--;
              }
            } else {
              countFalse++;
              if (countTrue > 0) {
                countTrue--;
              }
            }
          });
        },
        icon: Icon(
          isChecked ? Icons.check_circle : Icons.circle,
          color: Colors.blue,
        ),
      ),
      title: Text(widget.title),
      subtitle: Text(widget.dateTime.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: widget.onEdit,
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: widget.onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
