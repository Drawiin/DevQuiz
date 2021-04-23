import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int size;
  final int correctAnswers;

  const ResultPage({
    Key? key,
    required this.title,
    required this.size,
    required this.correctAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(AppImages.trophy),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Parabés!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(text: "\n$title", style: AppTextStyles.bodyBold),
                      TextSpan(
                        text: "\ncom $correctAnswers de $size acertos",
                        style: AppTextStyles.body,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () => {
                            Share.share(
                                'DevQuiz\nResultado do quiz $title\nAcertei: ${correctAnswers ~/ size * 100}% das questões')
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: NextButtonWidget.transparent(
                          label: "Voltar ao inicio",
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
