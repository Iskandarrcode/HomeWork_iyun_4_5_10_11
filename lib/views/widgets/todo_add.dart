import 'package:flutter/material.dart';
import 'package:iyun4/controllers/todo_controllers.dart';

class ToDoAdd extends StatefulWidget {
  final ToDoController toDoController;
  const ToDoAdd({
    super.key,
    required this.toDoController,
  });

  @override
  State<ToDoAdd> createState() => _ToDoAddState();
}

class _ToDoAddState extends State<ToDoAdd> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  String title = "";
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 27, 42, 107),
      title: const Text("Add todo"),
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
              onSaved: (newTodo) {
                if (newTodo != null) {
                  title = newTodo;
                }
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
              onSaved: (newTodo) {
                if (newTodo != null) {
                  title = newTodo;
                }
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
              onSaved: (newTodo) {
                if (newTodo != null) {
                  title = newTodo;
                }
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
              onSaved: (newTodo) {
                if (newTodo != null) {
                  title = newTodo;
                }
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
              },
              child: const Text(
                'Choose new data for your task',
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
          child: const Text("Bekor qilish"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formkey.currentState!.validate()) {
              _formkey.currentState!.save();
              widget.toDoController.todoAdd(
                idController.text,
                titleController.text,
                descriptionController.text,
                DateTime.parse(dateController.text),
              );
              Navigator.pop(context);
            }
            setState(() {});
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Qo'shish"),
        )
      ],
    );
  }
}
