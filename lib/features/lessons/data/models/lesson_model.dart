class LessonModel {
  final int id;
  final String title;
  final String description;
  final String level;

  LessonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] ?? json['lessonId'] ?? 0,
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      level: json['difficultyLevel'] ?? "Beginner",
    );
  }
}
