
import 'package:iyun4/models/lesson_model.dart';
import 'package:iyun4/services/lesson_http_services.dart';

class LessonRepository {
  final LessonHttpService _lessonHttpService = LessonHttpService();

  Future<List<LessonModel>> getLessonRepo(String courseId) async {
    return await _lessonHttpService.getData(courseId);
  }

  Future<void> addLesson({
    required String courseId,
    required String lessonTitle,
    required String lessonDescription,
    required String lessonVidioUrl,
  }) async {
    await _lessonHttpService.addLesson(
      courseId: courseId,
      lessonTitle: lessonTitle,
      lessonDescription: lessonDescription,
      lessonVidioUrl: lessonVidioUrl,
    );
  }

  // Future<void> deleteCourse({required String id}) async {
  //   await _lessonHttpService.deleteCourse(id: id);
  // }
}
