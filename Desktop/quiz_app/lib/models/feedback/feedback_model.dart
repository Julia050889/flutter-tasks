class FeedBackModel {
  FeedBackModel({
    required this.questions,
  });

  List<Question> questions;

  factory FeedBackModel.fromJson(Map<String, dynamic> json) => FeedBackModel(
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    required this.questionId,
    required this.questionText,
    required this.answers,
  });

  String questionId;
  String questionText;
  List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionId: json["question_id"],
        questionText: json["question_text"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "question_text": questionText,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    required this.answerText,
    required this.answerId,
    required this.sortOrder,
  });

  String answerText;
  int answerId;
  int sortOrder;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answerText: json["answer_text"],
        answerId: json["answer_id"],
        sortOrder: json["sort_order"],
      );

  Map<String, dynamic> toJson() => {
        "answer_text": answerText,
        "answer_id": answerId,
        "sort_order": sortOrder,
      };
}
