import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../lessons/data/models/lesson_model.dart';
import '../../../profile/data/madels/profile_stats_model.dart';
import '../../../simulation/data/models/question_model.dart';
import '../models/login_model.dart';
import '../models/user_model.dart';
import '../../../../core/network/dio_helper.dart';

class AuthService {

  /// ================ LOGIN ================
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

  /// ================= GET USER =================
  Future<UserModel> getMe() async {
    final dio = await getDio(); // ✅ لازم token

    final response = await dio.get("/me");

    return UserModel.fromJson(response.data);
  }

  /// ================= REGISTER =================
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

  Future<void> forgetPassword(String email) async {
    await DioHelper.dio.post(
      "/Auth/forget-password",
      data: {
        "email": email,
      },
    );
  }

  Future<void> setUserLevel(String level) async {
    final dio = await getDio();

    await dio.post(
      "/me/set-user-level",
      data: {
        "level": level,
      },
    );
  }

  Future<void> uploadProfileImage(File file) async {
    final dio = await getDio();

    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path),
    });

    await dio.put(
      "/me/upload-profile-image",
      data: formData,
    );
  }

  Future<String> getProfileImage() async {
    final dio = await getDio();

    final response = await dio.get("/me/get-profile-image");

    print("IMAGE RESPONSE: ${response.data}");

    final imagePath = response.data["profileImage"];

    if (imagePath == null || imagePath.isEmpty) return "";


    return "https://phish-escape.runasp.net/$imagePath";
  }

  Future<Dio> getDio() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");

    print("TOKEN: $token");

    final dio = Dio(
      BaseOptions(
        baseUrl: "https://phish-escape.runasp.net",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );

    return dio;
  }
  Future<List<LessonModel>> getLessons() async {
    final dio = await getDio();

    final response = await dio.get("/api/lessons");

    print("RAW RESPONSE: ${response.data}"); // 👈 مهم

    final data = response.data;

    /// ✅ لو API بيرجع Map
    final List lessonsList = data is List
        ? data
        : data["data"] ?? data["lessons"] ?? [];

    return lessonsList
        .map((e) => LessonModel.fromJson(e))
        .toList();
  }

  Future<List<QuestionModel>> getQuestions(int lessonId) async {
    final dio = await getDio();

    final response = await dio.get("/api/lessons/$lessonId/questions");

    print("QUESTIONS: ${response.data}");

    return (response.data as List)
        .map((e) => QuestionModel.fromJson(e))
        .toList();
  }
  Future<Map<String, dynamic>> submitAnswer({
    required int lessonId,
    required int questionId,
    required int answerId,
  }) async {
    final dio = await getDio();

    final response = await dio.post(
      "/api/lessons/$lessonId/answer",
      data: {
        "questionId": questionId,
        "answerId": answerId,
      },
    );

    print("SEND DATA:");
    print("lessonId: $lessonId");
    print("questionId: $questionId");
    print("answerId: $answerId");


    return response.data;
  }
  Future<ProfileStatsModel> getProfileStats() async {
    final dio = await getDio();

    print("BASE URL: ${dio.options.baseUrl}");

    final endpoint = "/api/UserDashboard/user-dashboard";

    print("ENDPOINT: $endpoint");

    final fullUrl = "${dio.options.baseUrl}$endpoint";

    print("FULL URL: $fullUrl");

    final response = await dio.get(endpoint);

    print("RESPONSE: ${response.data}");

    return ProfileStatsModel.fromJson(response.data);
  }


}
