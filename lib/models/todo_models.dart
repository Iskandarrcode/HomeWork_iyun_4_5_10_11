class ToDo {
  String id;
  String title;
  String description;
  DateTime dates;
  final bool isDone;

  ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.dates,
    this.isDone = false,
  });
}