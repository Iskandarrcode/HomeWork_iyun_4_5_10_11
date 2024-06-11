
import 'package:iyun4/models/course_model.dart';
import 'package:iyun4/repositoryes/course_repository.dart';

class CourseController {
  final CourseRepository _courseRepository = CourseRepository();

  Future<List<CourseModel>> get courseList async {
    return [...await _courseRepository.getCoursesRepo()];
  }

  Future<void> addCourse({
    required String courseTitle,
    required String courseDescription,
    required String courseImageUrl,
    required num coursePrice,
  }) async {
    await _courseRepository.addCourse(
      courseTitle: courseTitle,
      courseDescription: courseDescription,
      courseImageUrl: courseImageUrl,
      coursePrice: coursePrice,
    );
  }

  Future<void> deleteCourse({required String id}) async {
    await _courseRepository.deleteCourse(id: id);
  }
}
