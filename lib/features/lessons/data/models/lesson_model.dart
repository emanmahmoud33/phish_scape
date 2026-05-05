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
      id: json['lessonId'] ?? 0,
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      level: json['difficultyLevel'] ?? "Beginner",
    );
  }
}
class StatsModel {
  final int completed;
  final int total;
  final String rank;

  StatsModel({
    required this.completed,
    required this.total,
    required this.rank,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      completed: json['simulationsCompleted'] ?? 0,
      total: json['totalSimulations'] ?? 0,
      rank: json['rank'] ?? "N/A",
    );
  }
  
}