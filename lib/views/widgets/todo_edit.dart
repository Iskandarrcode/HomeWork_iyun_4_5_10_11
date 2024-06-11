import 'package:flutter/material.dart';
import 'package:iyun4/controllers/todo_controllers.dart';

class ToDoEdit extends StatefulWidget {
  final int index;
  final ToDoController toDoControllerr;

  const ToDoEdit({
    super.key,
    required this.toDoControllerr,
    required this.index,
  });

  @override
  State<ToDoEdit> createState() => _ToDoEditDialogState();
}

class _ToDoEditDialogState extends State<ToDoEdit> {
  late final TextEditingController idController;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController dateController;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final todoItem = widget.toDoControllerr.list[widget.index];
    idController = TextEditingController(text: todoItem.id);
    titleController = TextEditingController(text: todoItem.title);
    descriptionController = TextEditingController(text: todoItem.description);
    dateController =
        TextEditingController(text: todoItem.dates.toIso8601String());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 27, 42, 107),
      title: const Text("Edit todo"),
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: idController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("ID"),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Input ID";
                }
                return null;
              },
            ),
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Input Title";
                }
                return null;
              },
            ),
            TextFormField(
              controller: descriptionController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("Description"),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Input Description";
                }
                return null;
              },
            ),
            TextFormField(
              controller: dateController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("Date"),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Input Date";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                if (selectedDate != null) {
                  dateController.text = selectedDate.toIso8601String();
                }
              },
              child: const Text(
                'Choose new date for your task',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formkey.currentState!.validate()) {
              widget.toDoControllerr.todoEdit(
                widget.index,
                titleController.text,
                descriptionController.text,
                DateTime.parse(dateController.text),
              );
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Save"),
        ),
      ],
    );
  }
}
