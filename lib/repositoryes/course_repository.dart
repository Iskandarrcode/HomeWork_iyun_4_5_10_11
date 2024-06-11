
import 'package:iyun4/models/course_model.dart';
import 'package:iyun4/services/course_http_services.dart';

class CourseRepository {
  final CourseHttpService _courseHttpService = CourseHttpService();

  Future<List<CourseModel>> getCoursesRepo() async {
    return await _courseHttpService.getData();
  }

  Future<void> addCourse({
    required String courseTitle,
    required String courseDescription,
    required String courseImageUrl,
    required num coursePrice,
  }) async {
    await _courseHttpService.addCourse(
      courseTitle: courseTitle,
      courseDescription: courseDescription,
      courseImageUrl: courseImageUrl,
      coursePrice: coursePrice,
    );
    
  }

  Future<void> deleteCourse({required String id}) async {
    await _courseHttpService.deleteCourse(id: id);
  }
}
