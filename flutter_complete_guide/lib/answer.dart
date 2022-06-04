import 'package:flutter/material.dart';

// ignore_for_file: deprecated_member_use
class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback callbackAnswer;
  Answer({required this.callbackAnswer,required this.answerText});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: callbackAnswer,
        child: Text(answerText),
      ),
    );
  }
}
