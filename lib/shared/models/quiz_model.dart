import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dev_quiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get toLevel => {
        "facil": Level.facil,
        "médio": Level.medio,
        "difícil": Level.dificil,
        "perito": Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get asString => {
        Level.facil: "facil",
        Level.medio: "médio",
        Level.dificil: "difícil",
        Level.perito: "perito",
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAnswered = 0,
    required this.image,
    required this.level,
  });

  QuizModel copyWith({
    String? title,
    List<QuestionModel>? questions,
    int? questionsAnswered,
    String? image,
    Level? level,
  }) {
    return QuizModel(
      title: title ?? this.title,
      questions: questions ?? this.questions,
      questionsAnswered: questionsAnswered ?? this.questionsAnswered,
      image: image ?? this.image,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': level.asString,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'],
      image: map['image'],
      level: map['level'].toString().toLevel,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizModel(title: $title, questions: $questions, questionsAnswered: $questionsAnswered, image: $image, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizModel &&
        other.title == title &&
        listEquals(other.questions, questions) &&
        other.questionsAnswered == questionsAnswered &&
        other.image == image &&
        other.level == level;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        questions.hashCode ^
        questionsAnswered.hashCode ^
        image.hashCode ^
        level.hashCode;
  }
}
