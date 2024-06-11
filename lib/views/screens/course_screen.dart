import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iyun4/controllers/course_controller.dart';
import 'package:iyun4/views/screens/lesson_screen.dart';
import 'package:iyun4/views/screens/todo_screen.dart';
import 'package:iyun4/views/widgets/alert_dialog.dart';
import 'package:iyun4/views/widgets/costum_listview_builder.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;

  const MainScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CourseController _courseViewModel = CourseController();
  final bool _isViewStylePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Courses Screen"),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final response = await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CourseAlertDialog();
                },
              ));

              if (response) {
                setState(() {});
              }
            },
            icon: const Icon(
              Icons.add,
              size: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ZoomTapAnimation(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return TodoScreen(
                            onThemeChanged: widget.onThemeChanged,
                            onBackgroundImageChanged:
                                widget.onBackgroundImageChanged,
                            onAppBarColorChanged: widget.onAppBarColorChanged,
                            onTextFontSize: widget.onTextFontSize,
                            onTextColor: widget.onTextColor,
                          );
                        },
                      ));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Todo",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Note",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(40),
            const Text(
              "Courses Section",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(20),
            Expanded(
              child: FutureBuilder(
                future: _courseViewModel.courseList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(child: Text('error: ${snapshot.error}'));
                  } else {
                    final courseList = snapshot.data;
                    return ListView.builder(
                      itemCount: courseList!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return LessonScreen(
                                    course: courseList[index],
                                  );
                                },
                              ));
                            },
                            child: CustomListViewBuilderContainer(
                              isViewStylePressed: _isViewStylePressed,
                              course: courseList[index],
                              isDelete: false,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
