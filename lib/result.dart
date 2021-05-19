import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int punctuation;
  final void Function() whenRestartingQuiz;

  Result(this.punctuation, this.whenRestartingQuiz);

  String get resultMessage {
    if(punctuation < 8) {
      return 'Parabéns!';
    }else if(punctuation < 12) {
      return 'Muito bom!';
    }else if(punctuation < 16) {
      return 'Impressionate!';
    }else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            resultMessage,
            style: TextStyle(fontSize: 28),
          )
        ),
        FlatButton(
          onPressed: whenRestartingQuiz,
          child: Text(
            'Reinciar',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
        )
      ],
    );
  }
}