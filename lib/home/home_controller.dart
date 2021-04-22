import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final ValueNotifier<HomeState> statenNotifier =
      ValueNotifier(HomeState.empty);

  set state(HomeState state) => statenNotifier.value = state;

  HomeState get state => statenNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    state = HomeState.success;

    user = UserModel(
      name: "Vinicius",
      photoUrl: "https://avatars.githubusercontent.com/u/37352066?v=4",
    );
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    state = HomeState.success;

    quizzes = [
      QuizModel(
        title: "Flutter",
        questions: [
          QuestionModel(title: "Q que tem o flutter", answers: [
            AnswerModel(title: "Show"),
            AnswerModel(title: "Okay"),
            AnswerModel(title: "Tilmaix"),
            AnswerModel(title: "Meia Bomba", isRight: true),
          ])
        ],
        image: AppImages.blocks,
        level: Level.facil,
      ),
    ];
  }
}
