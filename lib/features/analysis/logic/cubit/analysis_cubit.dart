import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/services/auth_service.dart';
import '../../../profile/data/models/profile_stats_model.dart';

// abstract class AnalysisState {}
//
// class AnalysisLoading extends AnalysisState {}
//
// class AnalysisSuccess extends AnalysisState {
//
//   final ProfileStatsModel stats;
//
//   AnalysisSuccess(this.stats);
// }
//
// class AnalysisError extends AnalysisState {
//
//   final String error;
//
//   AnalysisError(this.error);
// }
// class AnalysisCubit extends Cubit<AnalysisState> {
//
//   final AuthService service;
//
//   AnalysisCubit(this.service)
//       : super(AnalysisLoading());
//
//   Future<void> getStats() async {
//
//     emit(AnalysisLoading());
//
//     try {
//
//       final stats =
//       await service.getProfileStats();
//
//       emit(
//         AnalysisSuccess(stats),
//       );
//
//     } catch (e) {
//
//       emit(
//         AnalysisError(
//           e.toString(),
//         ),
//       );
//     }
//   }
// }