import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService service;

  AuthCubit(this.service) : super(AuthInitial());

  void login(String email, String password) async {
    emit(AuthLoading());

    try {
      final result = await service.login(email, password);
      emit(AuthSuccess(result.token));
    } catch (e) {
      if (e is DioException) {
        final message = e.response?.data['message'] ?? "Email or password is incorrect";
        emit(AuthError(message));
      } else {
        emit(AuthError("Something went wrong"));
      }
    }
  }
  void forgetPassword(String email) async {
    emit(AuthLoading());

    try {
      await service.forgetPassword(email);
      emit(AuthSuccess("Check your email")); // رسالة نجاح
    } catch (e) {
      emit(AuthError("Something went wrong"));
    }
  }
}
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String token;
  AuthSuccess(this.token);
}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}