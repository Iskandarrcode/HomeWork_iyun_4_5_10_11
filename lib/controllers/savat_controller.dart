
import 'package:iyun4/models/course_model.dart';
import 'package:iyun4/repositoryes/savat_repository.dart';

class SavatController {
  final SavatRepository _savatRepository = SavatRepository();

  Future<List<CourseModel>> get savatList async {
    return [...await _savatRepository.getSavatRepo()];
  }

  Future<void> addCourseSavat({
    required String courseTitle,
    required String courseDescription,
    required String courseImageUrl,
    required num coursePrice,
  }) async {
    await _savatRepository.addCourseSavat(
      courseTitle: courseTitle,
      courseDescription: courseDescription,
      courseImageUrl: courseImageUrl,
      coursePrice: coursePrice,
    );
  }

  Future<void> deleteCourseSavat({required String id}) async {
    await _savatRepository.deleteSavat(id: id);
  }
}
