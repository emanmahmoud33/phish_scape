import '../data/models/lesson_model.dart';

abstract class LessonState {}

class LessonInitial extends LessonState {}

class LessonLoading extends LessonState {}

class LessonSuccess extends LessonState {
  final List<LessonModel> lessons;

  LessonSuccess(this.lessons);
}

class LessonError extends LessonState {
  final String error;

  LessonError(this.error);
}