class QuizModel {
  int id;
  String question;
  List option;
  int correctOptionIndex;

  QuizModel({
    required this.id,
    required this.question,
    required this.option,
    required this.correctOptionIndex,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json["id"],
      question: json["question"],
      option: json["option"],
      correctOptionIndex: json["correctOptionindex"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "question": question,
      "option": option,
      "correctOptionIndex": correctOptionIndex,
    };
  }
}
