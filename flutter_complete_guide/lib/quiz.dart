import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final VoidCallback answerCallBack;

  Quiz(
      {required this.questions,
      required this.answerCallBack,
      required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(
          questionText: questions[questionIndex]['questionText'] as String),
      ...(questions[questionIndex]['answerText'] as List<String>).map(
          (answerContent) =>
              Answer(callbackAnswer: answerCallBack, answerText: answerContent))
    ]);
  }
}
