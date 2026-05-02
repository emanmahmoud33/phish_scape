import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/lesson_model.dart';
import '../../data/services/auth_service.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<LessonModel> lessons;
  final StatsModel stats;

  HomeSuccess(this.lessons, this.stats);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
class HomeCubit extends Cubit<HomeState> {
  final AuthService service;

  HomeCubit(this.service) : super(HomeInitial());

  Future<void> loadHome() async {
    emit(HomeLoading());

    try {
      final lessons = await service.getLessons();
      final stats = await service.getStats();

      emit(HomeSuccess(lessons, stats));
    } catch (e) {
      print("HOME ERROR: $e"); // 🔥 مهم
      emit(HomeError("Failed to load home"));
    }
  }
}