import 'package:flutter/material.dart';
import 'package:iyun4/controllers/savat_controller.dart';
import 'package:iyun4/models/course_model.dart';
import 'package:iyun4/views/screens/like_screen.dart';

class LikeCostumBuilder extends StatefulWidget {
  final bool isViewStylePressed;
  final CourseModel course;
  final bool isDelete;
  final Function()? onDeletePressed;

  const LikeCostumBuilder({
    super.key,
    required this.course,
    required this.isViewStylePressed,
    required this.isDelete,
    this.onDeletePressed,
  });

  @override
  State<LikeCostumBuilder> createState() => _LikeCostumBuilderState();
}

class _LikeCostumBuilderState extends State<LikeCostumBuilder> {
  bool isSet = false;

  SavatController savatController = SavatController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 255, 59),
          borderRadius: BorderRadius.circular(10)),
      child: widget.isViewStylePressed
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Course name: ${widget.course.title}'),
                Text(
                    'Description:  ${widget.course.description.split(' ')[0]}'),
                Text('Price: ${widget.course.price}'),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        savatController.deleteCourseSavat(id: widget.course.id);
                        return const LikeScreen();
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Course name: ${widget.course.title}'),
                        Text(
                            'Description:  ${widget.course.description.split(' ')[0]}'),
                      ],
                    ),
                    const Spacer(),
                    Text('Price: ${widget.course.price}'),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            savatController.deleteCourseSavat(
                                id: widget.course.id);
                            return const LikeScreen();
                          },
                        ));
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
