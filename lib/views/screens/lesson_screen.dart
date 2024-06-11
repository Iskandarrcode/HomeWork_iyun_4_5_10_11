import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iyun4/controllers/lesson_controllers.dart';
import 'package:iyun4/controllers/savat_controller.dart';
import 'package:iyun4/models/course_model.dart';
import 'package:iyun4/views/widgets/coustum_lesson_listView.dart';
import 'package:iyun4/views/widgets/lesson_alert_dialog.dart';
import 'package:iyun4/views/widgets/youtube.dart';

class LessonScreen extends StatefulWidget {
  final CourseModel course;
  const LessonScreen({
    super.key,
    required this.course,
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final LessonController _lessonController = LessonController();
  final SavatController _savatController = SavatController();
  final bool _isViewStylePressed = false;
  bool isFavorit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Lessons Screen",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () async {
                setState(() {});
                await _savatController.addCourseSavat(
                  courseTitle: widget.course.title,
                  courseDescription: widget.course.description,
                  courseImageUrl: widget.course.imageUrl,
                  coursePrice: widget.course.price,
                );
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorit = !isFavorit;
                });
              },
              icon: Icon(
                isFavorit ? Icons.favorite : Icons.favorite_border_outlined,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: Image.network(widget.course.imageUrl),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  widget.course.description,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(20),
              ],
            ),
          ),
          const Text(
            "Lessons Section",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(20),
          FutureBuilder(
            future: _lessonController.lessonList(widget.course.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError || !snapshot.hasData) {
                return Center(child: Text('error: ${snapshot.error}'));
              } else {
                final lessonList = snapshot.data;

                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lessonList!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LessonItem(lesson: lessonList[index]);
                              },
                            ));
                          },
                          child: LessonCoustomListView(
                            lesson: lessonList[index],
                            isViewStylePressed: _isViewStylePressed,
                            isDelete: false,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
            context: context,
            builder: (context) {
              return LessonAlertDialog(
                courseId: widget.course.id,
              );
            },
          );

          if (response) {
            setState(() {});
          }
        },
        backgroundColor: const Color.fromARGB(255, 243, 240, 33),
        child: const Icon(Icons.add),
      ),
    );
  }
}
