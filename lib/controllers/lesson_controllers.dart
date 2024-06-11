
import 'package:iyun4/models/lesson_model.dart';
import 'package:iyun4/repositoryes/lesson_repositoryes.dart';

class LessonController {
  final LessonRepository _lessonRepository = LessonRepository();

  Future<List<LessonModel>> lessonList(String courseId) async {
    return await _lessonRepository.getLessonRepo(courseId);
  }

  Future<void> addLesson({
    required String courseId,
    required String lessonTitle,
    required String lessonDescription,
    required String lessonVidioUrl,
  }) async {
    await _lessonRepository.addLesson(
      courseId: courseId,
      lessonTitle: lessonTitle,
      lessonDescription: lessonDescription,
      lessonVidioUrl: lessonVidioUrl,
    );
  }

  // Future<void> deleteCourse({required String id}) async {
  //   await _lessonRepository.deleteCourse(id: id);
  // }
}
