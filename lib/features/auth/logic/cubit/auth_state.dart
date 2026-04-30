part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

/// ✅ Login فقط
class LoginSuccess extends AuthState {
  final String token;
  LoginSuccess(this.token);
}

/// ✅ Register
class RegisterSuccess extends AuthState {}

/// ✅ Forget password
class ForgetPasswordSuccess extends AuthState {}

/// ❌ Error
class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}