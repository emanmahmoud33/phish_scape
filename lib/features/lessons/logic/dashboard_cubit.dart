import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/data/services/auth_service.dart';
import 'dashboard_state.dart';
class DashboardCubit extends Cubit<DashboardState> {
  final AuthService service;

  DashboardCubit(this.service) : super(DashboardInitial());

  void getStats() async {
    emit(DashboardLoading());

    try {
      final data = await service.getDashboard();
      emit(DashboardSuccess(data));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
}