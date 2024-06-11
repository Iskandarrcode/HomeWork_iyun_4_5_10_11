class LessonModel {
  String id;
  String courseid;
  String title;
  String description;
  String vidioUrl;
  // List<QuizModel> quizes;

  LessonModel({
    required this.id,
    required this.courseid,
    required this.title,
    required this.description,
    required this.vidioUrl,
    // required this.quizes,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    // List<QuizModel> quizes = [];

    // if (json['quizes'] != null) {
    //   quizes = (json['quizes'] as List)
    //       .map((quizes) => QuizModel.fromJson(quizes as Map<String, dynamic>))
    //       .toList();
    // }

    return LessonModel(
      id: json["id"],
      courseid: json["course-id"],
      title: json["lesson-title"],
      description: json["lesson-description"],
      vidioUrl: json["lesson-vidio-url"],
      // quizes: quizes,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "coursid": courseid,
  //     "lesson-title": title,
  //     "lesson-description": description,
  //     "lesson-vidio-url": vidioUrl,
  //     // "quizes": quizes,
  //   };
  // }
}
