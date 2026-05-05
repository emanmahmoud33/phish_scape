class AnswerModel {
  final String text;
  final bool isCorrect;
  final int id;

  AnswerModel({
    required this.text,
    required this.isCorrect, required this.id,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      text: json['answerText'] ?? "",
      isCorrect: json['isCorrect'] ?? false, id: json['id'] ?? json['questionId'] ?? 0,
    );
  }
}

class QuestionModel {
  final String question;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.question,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
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

  /// 🔥 نعرف الإجابة الصح
  int get correctIndex {
    return answers.indexWhere((e) => e.isCorrect);
  }
}