import 'package:flutter/material.dart';
import 'package:iyun4/controllers/todo_controllers.dart';
import 'package:iyun4/views/widgets/todo_add.dart';
import 'package:iyun4/views/widgets/todo_edit.dart';
import 'package:iyun4/views/widgets/todo_item.dart';

class TodoScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;

  const TodoScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    ToDoController toDoControllerr = ToDoController();
    return ListenableBuilder(
      listenable: toDoControllerr,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return ToDoAdd(
                        toDoController: toDoControllerr,
                      );
                    });
              },
              icon: const Icon(Icons.add, color: Colors.black),
            ),
          ],
        ),
        // drawer: CustomDrawer(
        //   onThemeChanged: widget.onThemeChanged,
        //   onBackgroundImageChanged: widget.onBackgroundImageChanged,
        //   onAppBarColorChanged: widget.onAppBarColorChanged,
        //   onTextFontSize: widget.onTextFontSize,
        //   onTextColor: widget.onTextColor,
        // ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: toDoControllerr.list.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                    title: toDoControllerr.list[index].title,
                    onDelete: () {
                      toDoControllerr.todoRemove(index);
                    },
                    onEdit: () async {
                      Map<String, dynamic>? data = await showDialog(
                          context: context,
                          builder: (ctx) {
                            return ToDoEdit(
                              toDoControllerr: toDoControllerr,
                              index: index,
                            );
                          });

                      if (data != null) {
                        toDoControllerr.todoEdit(
                          index,
                          data["id"],
                          data["title"],
                          data["description"],
                        );
                        setState(() {}); // Ensure the screen updates
                      }
                    },
                    dateTime: toDoControllerr.list[index].dates,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
