import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iyun4/models/lesson_model.dart';

class LessonHttpService {
  Future<List<LessonModel>> getData(String courseId) async {
    final Uri url = Uri.parse(
      "https://intern-project-abbca-default-rtdb.firebaseio.com/courses/$courseId/lessons.json",
    );

    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<LessonModel> loadedLesson = [];
      if (data != null) {
        data.forEach((String key, dynamic value) {
          value["id"] = key;
          loadedLesson.add(LessonModel.fromJson(value));
        });
      }

      return loadedLesson;
    }
    throw Exception("Error: LessonHttpService().getData()");
  }

  Future<LessonModel> addLesson({
    required String courseId,
    required String lessonTitle,
    required String lessonDescription,
    required String lessonVidioUrl,
  }) async {
    Map<String, dynamic> lessonData = {
      "course-id": courseId,
      "lesson-title": lessonTitle,
      "lesson-description": lessonDescription,
      "lesson-vidio-url": lessonVidioUrl,
    };
    final Uri url = Uri.parse(
      "https://intern-project-abbca-default-rtdb.firebaseio.com/courses/$courseId/lessons.json",
    );
    final http.Response response = await http.post(
      url,
      body: jsonEncode(lessonData),
    );
    final data = jsonDecode(response.body);
    lessonData["id"] = data["name"];
    return LessonModel.fromJson(lessonData);
  }
}
