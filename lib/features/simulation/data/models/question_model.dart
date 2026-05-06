class AnswerModel {

  final int id;
  final String text;
  final bool isCorrect;

  AnswerModel({
    required this.id,
    required this.text,
    required this.isCorrect,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {

    return AnswerModel(
      id: json['answerId'] ?? 0,
      text: json['answerText'] ?? "",
      isCorrect: json['isCorrect'] ?? false,
    );
  }
}

class QuestionModel {

  final int id;

  final String question;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {

    return QuestionModel(
      id: json['questionId'] ?? 0,



      question: json['questionText'] ?? "",

      answers: (json['answers'] as List)
          .map((e) => AnswerModel.fromJson(e))
          .toList(),
    );
  }

  List<String> get options {
    return answers.map((e) => e.text).toList();
  }

  int get correctIndex {
    return answers.indexWhere((e) => e.isCorrect);
  }
}