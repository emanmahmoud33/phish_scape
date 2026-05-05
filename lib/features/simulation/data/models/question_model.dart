class AnswerModel {
  final int id; // 👈 ضيفي ده
  final String text;
  final bool isCorrect;

  AnswerModel({
    required this.id,
    required this.text,
    required this.isCorrect,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['id'] ?? json['answerId'] ?? 0, // 👈 مهم
      text: json['answerText'] ?? "",
      isCorrect: json['isCorrect'] ?? false,
    );
  }
}

class QuestionModel {
  final int id; // 👈 ضيفي ده
  final String question;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] ?? json['questionId'] ?? 0, // 👈 مهم
      question: json['questionText'] ?? "",
      answers: (json['answers'] as List)
          .map((e) => AnswerModel.fromJson(e))
          .toList(),
    );
  }


  /// 🔥 helper عشان نستخدمه في UI

  List<String> get options {
    return answers.map((e) => e.text).toList();
  }

  int get correctIndex {
    return answers.indexWhere((e) => e.isCorrect);
  }
}
