import 'package:flutter/material.dart';
import 'package:iyun4/models/lesson_model.dart';

class LessonCoustomListView extends StatelessWidget {
  final bool isViewStylePressed;
  final LessonModel lesson;
  final bool isDelete;

  const LessonCoustomListView({
    super.key,
    required this.lesson,
    required this.isViewStylePressed,
    required this.isDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(135, 59, 108, 255),
          borderRadius: BorderRadius.circular(10)),
      child: isViewStylePressed
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lesson name: ${lesson.title}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lesson Description:  ${lesson.description.split(' ')[0]}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Course name: ${lesson.title}'),
                        Text(
                            'Description:  ${lesson.description.split(' ')[0]}'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
