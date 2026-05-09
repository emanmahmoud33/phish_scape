import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/data/services/auth_service.dart';
import '../data/models/lesson_model.dart';
import 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  final AuthService service;

  LessonCubit(this.service) : super(LessonInitial());

  List<LessonModel> allLessons = [];

  void getLessons() async {
    emit(LessonLoading());

    try {
      final lessons = await service.getLessons();

      print("LESSONS: $lessons");

      allLessons = lessons;

      emit(LessonSuccess(lessons));
    } catch (e) {
      print("ERROR: $e");
      emit(LessonError(e.toString()));
    }
  }

  void search(String value) {
    final filtered = allLessons
        .where((l) =>
        l.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    emit(LessonSuccess(filtered));
  }
}