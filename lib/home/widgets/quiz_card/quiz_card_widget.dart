import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget  {
  final QuizModel quiz;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.quiz,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.get(quiz.image)),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              quiz.title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "${quiz.questionsAnswered} de ${quiz.questions.length}",
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ProgressIndicatorWidget(
                    value: quiz.questionsAnswered / quiz.questions.length,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
