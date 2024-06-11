
import 'package:iyun4/models/course_model.dart';
import 'package:iyun4/services/savat_http_services.dart';

class SavatRepository {
  final SavatHttpServices _savatHttpService = SavatHttpServices();

  Future<List<CourseModel>> getSavatRepo() async {
    return await _savatHttpService.getDataSavat();
  }

  Future<void> addCourseSavat({
    required String courseTitle,
    required String courseDescription,
    required String courseImageUrl,
    required num coursePrice,
  }) async {
    await _savatHttpService.addCourseSavat(
      courseTitle: courseTitle,
      courseDescription: courseDescription,
      courseImageUrl: courseImageUrl,
      coursePrice: coursePrice,
    );
    
  }

  Future<void> deleteSavat({required String id}) async {
    await _savatHttpService.deleteSavat(id: id);
  }
}
