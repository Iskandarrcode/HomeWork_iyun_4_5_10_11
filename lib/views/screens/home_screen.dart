import 'package:flutter/material.dart';
import 'package:iyun4/controllers/course_controller.dart';
import 'package:iyun4/models/course_model.dart';
import 'package:iyun4/utils/app_constants.dart';
import 'package:iyun4/views/screens/course_screen.dart';
import 'package:iyun4/views/widgets/custom_drawer.dart';
import 'package:iyun4/views/widgets/search_course.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;

  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CourseController courseController = CourseController();
  List<CourseModel> _courses = [];

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  Future<void> getCourses() async {
    _courses = await courseController.courseList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: AppConstants.images.isEmpty
            ? null
            : DecorationImage(
                image: NetworkImage(AppConstants.images),
                fit: BoxFit.fill,
              ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.appBarColor,
          title: Text(
            "Menu",
            style: TextStyle(
              fontSize: AppConstants.fontSize,
              color: AppConstants.textColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                // ignore: unused_local_variable
                String? result = await showSearch(
                  context: context,
                  delegate: SearchViewDelegate(_courses),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        drawer: CustomDrawer(
          onThemeChanged: widget.onThemeChanged,
          onBackgroundImageChanged: widget.onBackgroundImageChanged,
          onAppBarColorChanged: widget.onAppBarColorChanged,
          onTextFontSize: widget.onTextFontSize,
          onTextColor: widget.onTextColor,
        ),
        body: MainScreen(
          onThemeChanged: widget.onThemeChanged,
          onBackgroundImageChanged: widget.onBackgroundImageChanged,
          onAppBarColorChanged: widget.onAppBarColorChanged,
          onTextFontSize: widget.onTextFontSize,
          onTextColor: widget.onTextColor,
        ),
      ),
    );
  }
}
