import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/dio_helper.dart';
import '../../data/services/auth_service.dart';
import 'dart:io';

class AuthCubit extends Cubit<AuthState> {
  final AuthService service;
  String? token;
  AuthCubit(this.service) : super(AuthInitial());

  /// 🔐 LOGIN
  void login(String email, String password) async {
    emit(AuthLoading());

    try {
      final response = await service.login(email, password);

      token = response.token;

      DioHelper.setToken(token!);

      print("TOKEN: $token");

      emit(AuthSuccess(token!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// 📧 FORGET PASSWORD
  void forgetPassword(String email) async {
    emit(AuthLoading());

    try {
      await service.forgetPassword(email);
      emit(ForgetPasswordSuccess()); // ✅
    } catch (e) {
      emit(AuthError("Something went wrong"));
    }
  }

  /// 📝 REGISTER
  void register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(AuthLoading());

    try {
      await service.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      emit(RegisterSuccess()); // ✅
    } catch (e) {
      emit(AuthError("Registration failed"));
    }
  }

  void setLevel(String level) async {
    emit(AuthLoading());

    try {
      await service.setUserLevel(level);
      print("SUCCESS 🔥");
      emit(LevelSuccess());
    } catch (e) {
      print("ERROR ❌: $e");
      emit(AuthError("Failed to set level"));
    }
  }



  void uploadImage(String path) async {
    emit(AuthLoading());

    try {
      final file = File(path); // 🔥 أهم سطر

      await service.uploadProfileImage(file);

      emit(ImageUploadSuccess());
    } catch (e) {
      emit(AuthError("Upload failed"));
    }
  }
}

/// ================= STATES =================
class LevelSuccess extends AuthState {}

class ImageUploadSuccess extends AuthState {}

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthSuccess extends AuthState {
  final String token;
  AuthSuccess(this.token);
}
class AuthLoading extends AuthState {}

/// 🔐 Login
class LoginSuccess extends AuthState {
  final String token;

  LoginSuccess(this.token);
}

/// 📝 Register
class RegisterSuccess extends AuthState {}

/// 📧 Forget Password
class ForgetPasswordSuccess extends AuthState {}

/// ❌ Error
class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}
