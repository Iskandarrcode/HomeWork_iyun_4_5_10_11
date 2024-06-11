import 'package:flutter/material.dart';
import 'package:iyun4/models/course_model.dart';

class CustomListViewBuilderContainer extends StatelessWidget {
  final bool isViewStylePressed;
  final CourseModel course;
  final bool isDelete;
  final Function()? onDeletePressed;

  const CustomListViewBuilderContainer({
    super.key,
    required this.course,
    required this.isViewStylePressed,
    required this.isDelete,
    this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
      child: isViewStylePressed
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Course name: ${course.title}'),
                Text('Description:  ${course.description.split(' ')[0]}'),
                Text('Price: ${course.price}'),
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
                        Text('Course name: ${course.title}'),
                        Text(
                            'Description:  ${course.description.split(' ')[0]}'),
                      ],
                    ),
                    Text('Price: ${course.price}'),
                  ],
                ),
                if (isDelete)
                  TextButton(
                      onPressed: onDeletePressed,
                      child: const Text('Delete course')),
              ],
            ),
    );
  }
}
