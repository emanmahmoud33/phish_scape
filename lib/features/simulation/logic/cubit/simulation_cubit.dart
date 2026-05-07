import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/data/services/auth_service.dart';
import '../../data/models/question_model.dart';


abstract class SimulationState {}

class SimulationInitial extends SimulationState {}

class SimulationLoading extends SimulationState {}

class SimulationSuccess extends SimulationState {
  final List<QuestionModel> questions;
  SimulationSuccess(this.questions);
}

class SimulationError extends SimulationState {
  final String error;
  SimulationError(this.error);
}

class SimulationCubit extends Cubit<SimulationState> {
  final AuthService service;

  SimulationCubit(this.service) : super(SimulationInitial());

  Future<void> loadQuestions(int lessonId) async {
    emit(SimulationLoading());

    try {
      final questions = await service.getQuestions(lessonId);
      print("QUESTIONS: $questions"); // 👈 مهم

      emit(SimulationSuccess(questions));
    } catch (e) {

      if (e.toString().contains("AlreadyAnswered")) {

        emit(
          SimulationError(
            "You already answered this question",
          ),
        );

        return;
      }

      emit(SimulationError(e.toString()));
    }
  }

  Future<void> submitAnswer({
    required int lessonId,
    required int questionId,
    required int answerId,
  }) async {

    try {

      emit(SimulationLoading());

      final result = await service.submitAnswer(
        lessonId: lessonId,
        questionId: questionId,
        answerId: answerId,
      );

      if (isClosed) return;

      print("SUBMIT SUCCESS:");
      print(result);

      emit(
        SimulationAnalysisSuccess(result),
      );

    } catch (e) {

      print("SUBMIT ERROR:");
      print(e);

      if (isClosed) return;

      if (e.toString().contains("AlreadyAnswered")) {

        emit(
          SimulationError(
            "You already answered this question",
          ),
        );

        return;
      }

      emit(
        SimulationError(
          e.toString(),
        ),
      );
    }
  }
}

class SimulationAnalysisSuccess extends SimulationState {
  final Map<String, dynamic> analysis;

  SimulationAnalysisSuccess(this.analysis);
}