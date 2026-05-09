class LessonModel {

  final int id;

  final String title;

  final String description;

  final String level;

  final int progress;

  final bool isActive;

  LessonModel({

    required this.id,

    required this.title,

    required this.description,

    required this.level,

    required this.progress,

    required this.isActive,
  });

  factory LessonModel.fromJson(
      Map<String, dynamic> json,
      ) {

    return LessonModel(

      id:
      json['id']
          ??
          json['lessonId']
          ??
          0,

      title:
      json['title']
          ??
          "",

      description:
      json['description']
          ??
          "",

      level:
      json['difficultyLevel']
          ??
          "Beginner",

      progress:
      json['progress']
          ??
          0,

      isActive:
      json['isActive']
          ??
          false,
    );
  }
}