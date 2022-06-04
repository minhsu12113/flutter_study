// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './quiz.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  var ran = Random();
  final questions = const [
    {
      'questionText': 'What\'s your favorite colors?',
      'answerText': ['Black', 'White', 'Red', 'Blue']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answerText': ['Lion', 'Dog', 'Duck', 'Cat']
    },
    {
      'questionText': 'What\'s your favorite Food?',
      'answerText': ['Rice', 'Hamburger', 'Pizza', 'Cake']
    }
  ];
  void answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Su Dep Trai')),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerCallBack: answerQuestion,
                questionIndex: _questionIndex)
            : Center(
                child: RaisedButton(
                  child: const Text('Reset Questions'),
                  onPressed: () {
                    setState(() {
                      _questionIndex = 0;
                    });
                  },
                ),
              ),
      ),
    );
  }
}
