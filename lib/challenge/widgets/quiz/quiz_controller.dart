import 'package:flutter/cupertino.dart';

class QuizController {
  final selectedAnswerNotifier = ValueNotifier<int>(-1);

  int get selectedAnswer => selectedAnswerNotifier.value;

  set selectedAnswer(int answer) => selectedAnswerNotifier.value = answer;
}
