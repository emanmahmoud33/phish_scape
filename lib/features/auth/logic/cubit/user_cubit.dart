import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/auth_service.dart';
import '../../data/models/user_model.dart';

/// الحالات
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserModel user;
  UserSuccess(this.user);
}

class UserError extends UserState {
  final String error;
  UserError(this.error);
}

class UserCubit extends Cubit<UserState> {
  final AuthService service;

  UserCubit(this.service) : super(UserInitial());

  void getUser() async {
    emit(UserLoading());

    try {
      final user = await service.getMe();
      print("USER EMAIL: ${user.email}");
      emit(UserSuccess(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}