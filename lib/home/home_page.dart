import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/appbar/AppBarWidget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    repository: HomeRepository(),
  );

  @override
  void initState() {
    super.initState();
    controller.getQuizzes();
    controller.getUser();
    controller.statenNotifier.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return controller.state == HomeState.success
        ? Scaffold(
            appBar: AppBarWidget(
              user: controller.user!,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LevelButtonWidget(label: "Fácil"),
                      LevelButtonWidget(label: "Médio"),
                      LevelButtonWidget(label: "Difícil"),
                      LevelButtonWidget(label: "Perito"),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: controller.quizzes!
                          .map(
                            (quiz) => QuizCardWidget(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChallengePage(
                                      questions: quiz.questions,
                                      title: quiz.title,
                                    ),
                                  ),
                                );
                              },
                              quiz: quiz,
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.chartPrimary,
                ),
              ),
            ),
          );
  }
}
