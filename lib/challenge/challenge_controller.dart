import 'package:flutter/material.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier(1);

  int get currentPage => currentPageNotifier.value;

  set currentPage(int newPage) => currentPageNotifier.value = newPage;
}
