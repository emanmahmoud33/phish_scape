import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../lessons/data/models/lesson_model.dart';
import '../../../meta/data/models/difficulty_model.dart';

import '../../../simulation/data/models/question_model.dart';
import '../models/login_model.dart';
import '../models/user_model.dart';
import '../../../../core/network/dio_helper.dart';

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
    final dio = await getDio();

    final response = await dio.get("https://phish-escape.runasp.net/me");

    return UserModel.fromJson(response.data);
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


          "https://phish-escape.runasp.net/me/set-user-level",
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
      "https://phish-escape.runasp.net/me/upload-profile-image",
      data: formData,
    );
  }

  Future<String> getProfileImage() async {
    final dio = await getDio();

    final response = await dio.get("https://phish-escape.runasp.net/me/get-profile-image");

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
        baseUrl: "https://phish-escape.runasp.net/api",
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

    final response = await dio.get("/lessons/cards");

    print("RAW RESPONSE: ${response.data}");

    final data = response.data;


    final List lessonsList = data is List
        ? data
        : data["data"] ?? data["lessons"] ?? [];

    return lessonsList
        .map((e) => LessonModel.fromJson(e))
        .toList();
  }

  Future<List<QuestionModel>> getQuestions(int lessonId) async {
    final dio = await getDio();

    final response = await dio.get("/lessons/$lessonId/questions");

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

    final dio = DioHelper.dio;

    try {

      print("SEND DATA:");
      print("lessonId: $lessonId");
      print("questionId: $questionId");
      print("answerId: $answerId");


      final response = await dio.post(
        "/api/lessons/$lessonId/answer",
        data: {
          "questionId": questionId,
          "answerId": answerId,
        },
      );

      print("SUCCESS RESPONSE:");
      print(response.data);
      print(response.data.runtimeType);
      return response.data;

    } on DioException catch (e) {

      print("STATUS CODE: ${e.response?.statusCode}");

      print("ERROR DATA:");
      print(e.response?.data);

      print("REQUEST BODY:");
      print(e.requestOptions.data);

      rethrow;
    }
  }

  Future<Map<String, dynamic>>
  getLessonResult(int lessonId) async {

    try {

      final dio = await getDio();

      final response = await dio.get(
        "/lessons/$lessonId/result",
      );

      print("RESULT DATA:");
      print(response.data);

      return response.data;

    } catch (e) {

      print("RESULT ERROR:");
      print(e);

      rethrow;
    }
  }
  Future<QuestionModel>
  getNextQuestion(int lessonId) async {

    final dio = await getDio();

    final response = await dio.get(
      "/lessons/$lessonId/next-question",
    );

    print("NEXT QUESTION:");
    print(response.data);

    return QuestionModel.fromJson(
      response.data,
    );
  }
  Future<void> resetLesson(
      int lessonId,
      ) async {

    final dio = DioHelper.dio;

    await dio.delete(
      "/api/lessons/$lessonId/reset",
    );
  }

  Future<List<DifficultyModel>>
  getDifficultyLevels() async {
    final dio = DioHelper.dio;
    final response =
    await dio.get(
      "/api/meta/difficulty-levels",
    );

    return (response.data as List)

        .map(
          (e) =>
          DifficultyModel.fromJson(e),
    )

        .toList();
  }


}
