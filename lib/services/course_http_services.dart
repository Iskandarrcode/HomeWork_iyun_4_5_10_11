import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iyun4/models/course_model.dart';

class CourseHttpService {
  Future<List<CourseModel>> getData() async {
    final Uri url = Uri.parse(
      'https://intern-project-abbca-default-rtdb.firebaseio.com/courses.json',
    );

    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List<CourseModel> loadedCourses = [];
      if (data != null) {
        data.forEach(
          (String key, dynamic value) {
            value['id'] = key;
            loadedCourses.add(CourseModel.fromJson(value));
          },
        );
      }
      return loadedCourses;
    }
    throw Exception('Error: CourseHttpService().getData()');
  }

  Future<CourseModel> addCourse({
    required String courseTitle,
    required String courseDescription,
    required String courseImageUrl,
    required num coursePrice,
  }) async {
    Map<String, dynamic> courseData = {
      'course-title': courseTitle,
      'course-description': courseDescription,
      'course-image': courseImageUrl,
      'course-price': coursePrice,
    };
    final Uri url = Uri.parse(
      'https://intern-project-abbca-default-rtdb.firebaseio.com/courses.json',
    );
    final http.Response response = await http.post(
      url,
      body: jsonEncode(courseData),
    );
    final data = jsonDecode(response.body);
    courseData['id'] = data['name'];
    return CourseModel.fromJson(courseData);
  }

  Future<void> deleteCourse({required String id}) async {
    final Uri url = Uri.parse(
      'https://intern-project-abbca-default-rtdb.firebaseio.com/courses/$id.json',
    );
    await http.delete(url);
  }
}
