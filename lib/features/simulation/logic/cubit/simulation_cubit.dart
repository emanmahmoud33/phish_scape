import 'package:dio/dio.dart';
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

class SimulationAnalysisSuccess extends SimulationState {

  final Map<String, dynamic> analysis;

  SimulationAnalysisSuccess(this.analysis);
}

class SimulationCubit extends Cubit<SimulationState> {

  final AuthService service;

  SimulationCubit(this.service)
      : super(SimulationInitial());

  Future<void> loadQuestions(
      int lessonId,
      ) async {

    emit(SimulationLoading());

    try {

      final questions =
      await service.getQuestions(
        lessonId,
      );

      print("QUESTIONS:");
      print(questions);

      emit(
        SimulationSuccess(
          questions,
        ),
      );

    } catch (e) {

      if (
      e.toString()
          .contains("AlreadyAnswered")
      ) {

        emit(
          SimulationError(
            "Question already answered, loading next...",
          ),
        );

        await loadNextQuestion(
          lessonId,
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

  Future<void> submitAnswer({

    required int lessonId,

    required int questionId,

    required int answerId,

  }) async {

    try {

      final result =
      await service.submitAnswer(

        lessonId: lessonId,

        questionId: questionId,

        answerId: answerId,
      );

      if (isClosed) return;

      emit(
        SimulationAnalysisSuccess(
          result,
        ),
      );

    } catch (e) {

      if (isClosed) return;

      if (e is DioException) {

        final data =
            e.response?.data
                .toString() ??
                "";

        print("REAL ERROR:");
        print(data);

        if (
        data.contains(
          "AlreadyAnswered",
        )
        ) {

          emit(
            SimulationError(
              "Question already answered, loading next...",
            ),
          );

          Future.delayed(
            const Duration(
              milliseconds: 800,
            ),
                () {

              loadNextQuestion(
                lessonId,
              );
            },
          );

          return;
        }
      }

      emit(
        SimulationError(
          "Something went wrong",
        ),
      );
    }
  }

  Future<void> loadNextQuestion(
      int lessonId,
      ) async {

    try {

      final question =
      await service.getNextQuestion(
        lessonId,
      );

      emit(
        SimulationSuccess(
          [question],
        ),
      );

    } catch (e) {

      emit(
        SimulationError(
          "No more questions",
        ),
      );
    }
  }

  void emitInitial() {

    emit(
      SimulationInitial(),
    );
  }
}