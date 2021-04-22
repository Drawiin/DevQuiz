import 'dart:convert';

class AnswerModel {
  final String title;
  final bool isRight;

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return new AnswerModel(
      title: map['title'] as String,
      isRight: map['isRight'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'isRight': this.isRight,
    } as Map<String, dynamic>;
  }

  AnswerModel({
    required this.title,
    this.isRight = false,
  });

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));
}
