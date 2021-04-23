import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final HomeRepository repository;

  HomeController({
    required this.repository,
  });

  final statenNotifier = ValueNotifier(HomeState.empty);
  set state(HomeState state) => statenNotifier.value = state;
  HomeState get state => statenNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 1));

    user = await repository.getUser();

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 1));

    quizzes = await repository.getQuizzes();

    state = HomeState.success;
  }
}
