import 'package:dio/dio.dart';
import '../models/login_model.dart';
import '../../../../core/network/dio_helper.dart';
import '../models/user_model.dart';

class AuthService {
  Future<LoginModel> login(String email, String password) async {
    final response = await DioHelper.dio.post(
      "/Auth",
      data: {
        "email": email,
        "password": password,
      },
    );

    return LoginModel.fromJson(response.data);
  }
  Future<UserModel> getMe() async {
    final response = await DioHelper.dio.get("/me");

    return UserModel.fromJson(response.data);

  }
  Future<void> forgetPassword(String email) async {
    await DioHelper.dio.post(
      "/Auth/forget-password",
      data: {
        "email": email,
      },
    );
  }
  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    await DioHelper.dio.post(
      "/Auth/register",
      data: {
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
      },
    );
  }
}