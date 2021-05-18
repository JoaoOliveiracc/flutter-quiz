import 'package:flutter/material.dart';
import './answer.dart';
import './quest.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function() answer;

  Quiz({
    @required this.questions,
    @required this.selectedQuestion,
    @required this.answer,
  });

  bool get haveQuestionSelected {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = haveQuestionSelected
      ? questions[selectedQuestion]['answer']
      :null;

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['text']),
        ...answers.map((text) => Answer(text, answer)).toList(),
      ],
    );
  }
}