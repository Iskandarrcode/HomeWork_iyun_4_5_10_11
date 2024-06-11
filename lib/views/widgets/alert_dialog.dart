import 'package:flutter/material.dart';
import 'package:iyun4/controllers/course_controller.dart';

// ignore: must_be_immutable
class CourseAlertDialog extends StatefulWidget {
  const CourseAlertDialog({super.key});

  @override
  State<CourseAlertDialog> createState() => _CourseAlertDialogState();
}

class _CourseAlertDialogState extends State<CourseAlertDialog> {
  final coursesController = CourseController();

  final TextEditingController courseTitle = TextEditingController();
  final TextEditingController courseDescription = TextEditingController();
  final TextEditingController courseImageUrl = TextEditingController();
  final TextEditingController courseLessons = TextEditingController();
  final TextEditingController coursePrice = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: const Color.fromARGB(174, 93, 114, 210),
        title: const Text("Add Courses"),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: courseTitle,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text(
                    "Course Title",
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
                controller: courseDescription,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text(
                    "Course Description",
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
                controller: courseImageUrl,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text(
                    "Course Image Url",
                    style: TextStyle(color: Color.fromARGB(151, 0, 0, 0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Input Image Url";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: coursePrice,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text(
                    "Course Price",
                    style: TextStyle(color: Color.fromARGB(151, 0, 0, 0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Input Price";
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
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: () async {
                    if (courseTitle.text.isNotEmpty &&
                        courseDescription.text.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });
                      await coursesController.addCourse(
                        courseTitle: courseTitle.text,
                        courseDescription: courseDescription.text,
                        courseImageUrl: courseImageUrl.text,
                        coursePrice: int.parse(coursePrice.text),
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
