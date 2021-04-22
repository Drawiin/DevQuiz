import 'package:dev_quiz/shared/models/answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.title,
    required this.answers,
  }): assert(answers.length == 4);

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return new QuestionModel(
      title: map['title'] as String,
      answers: map['answers'] as List<AnswerModel>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'answers': this.answers.map((e) => e.toMap()).toList(),
    } as Map<String, dynamic>;
  }
}
