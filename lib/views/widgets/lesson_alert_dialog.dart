import 'package:flutter/material.dart';
import 'package:iyun4/controllers/lesson_controllers.dart';

// ignore: must_be_immutable
class LessonAlertDialog extends StatefulWidget {
  final String courseId;
  LessonAlertDialog({super.key, required this.courseId});

  @override
  State<LessonAlertDialog> createState() => _LessonAlertDialogState();
}

class _LessonAlertDialogState extends State<LessonAlertDialog> {
  final lessonController = LessonController();

  final TextEditingController lessonTitle = TextEditingController();
  final TextEditingController lessonDescription = TextEditingController();
  final TextEditingController lessonImageUrl = TextEditingController();
  final TextEditingController lessonLessons = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text("Add Lesson"),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: lessonTitle,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text(
                    "Lesson Title",
                    style: TextStyle(color: Color.fromARGB(151, 0, 0, 0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Input Title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lessonDescription,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text(
                    "Lesson Description",
                    style: TextStyle(color: Color.fromARGB(151, 0, 0, 0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Input Description";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lessonImageUrl,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text(
                    "Lesson Vidio Url",
                    style: TextStyle(color: Color.fromARGB(151, 0, 0, 0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Input Vidio Url";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              "Bekor qilish",
              style: TextStyle(color: Color.fromARGB(163, 0, 0, 0)),
            ),
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: () async {
                    if (lessonTitle.text.isNotEmpty &&
                        lessonDescription.text.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });
                      await lessonController.addLesson(
                        courseId: widget.courseId,
                        lessonTitle: lessonTitle.text,
                        lessonDescription: lessonDescription.text,
                        lessonVidioUrl: lessonImageUrl.text,
                      );

                      Navigator.pop(context, true);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Qo'shish"),
                )
        ],
      ),
    );
  }
}
