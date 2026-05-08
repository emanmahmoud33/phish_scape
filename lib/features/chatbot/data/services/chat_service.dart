import 'package:dio/dio.dart';

class ChatService {
  final Dio dio = Dio();

  final String baseUrl =
      "https://phish-escape.runasp.net/api/chat/send";

  Future<Map<String, dynamic>> sendMessage({
    required String message,
    required String conversationId,
  }) async {

    try {

      final response = await dio.post(
        baseUrl,

        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),

        data: {
          "conversationId":
          conversationId.isEmpty
              ? null
              : conversationId,

          "userId": "user123",

          "message":
          "Reply using the same language as the user: $message",
        },
      );

      print(response.data);

      return response.data;

    } on DioException catch (e) {

      print("=================");
      print(e.response?.data);
      print("=================");

      throw Exception("API ERROR");
    }
  }
}