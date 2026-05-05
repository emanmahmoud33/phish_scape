import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/data/services/auth_service.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthService service;

  ProfileCubit(this.service) : super(ProfileInitial());

  Future<void> getProfileStats() async {
    emit(ProfileLoading());

    try {
      final stats = await service.getProfileStats();

      emit(ProfileSuccess(stats));
    } catch (e) {
      print("PROFILE ERROR: $e");
      emit(ProfileError(e.toString()));
    }
  }
}