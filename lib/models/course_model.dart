
import 'package:iyun4/models/lesson_model.dart';

class CourseModel {
  String id;
  String title;
  String description;
  String imageUrl;
  List<LessonModel> lessons;
  num price;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.lessons,
    required this.price,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    List<LessonModel> lessons = [];
    if (json['lessons'] != null) {
      json['lessons'].forEach((key, value) {
        value['id'] = key;
        lessons.add(LessonModel.fromJson(value));
      });
    }
    return CourseModel(
      id: json["id"] as String,
      title: json["course-title"] as String,
      description: json["course-description"] as String,
      imageUrl: json["course-image"],
      lessons: lessons,
      price: json["course-price"] as num,
    );
  }
}
