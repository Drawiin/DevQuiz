import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/home/widgets/scorecard/ScoreCardWidget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 160,
                    width: double.maxFinite,
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Olá, ",
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                text: "Vinicius",
                                style: AppTextStyles.titleBold,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/37352066?v=4"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                      child: ScoreCardWidget()
                  )
                ],
              ),
            ));
}
