import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/data/services/auth_service.dart';
import '../data/models/lesson_model.dart';

/// ================= STATES =================

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

/// ================= CUBIT =================

class LessonCubit extends Cubit<LessonState> {
  final AuthService service;

  LessonCubit(this.service) : super(LessonInitial());

  /// 🔥 GET LESSONS
  Future<void> getLessons() async {
    emit(LessonLoading());

    try {
      final lessons = await service.getLessons();
      allLessons = lessons;
      print("LESSONS: $lessons"); // 👈 مهم جدًا

      emit(LessonSuccess(lessons));
    } catch (e) {
      print("ERROR: $e"); // 👈 مهم جدًا
      emit(LessonError(e.toString()));
    }
  }
  List<LessonModel> allLessons = [];

  void setLessons(List<LessonModel> lessons) {
    allLessons = lessons;
  }

  void search(String query) {
    final filtered = allLessons.where((lesson) {
      return lesson.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(LessonSuccess(filtered));
  }
}