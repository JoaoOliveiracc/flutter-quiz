import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int punctuation;

  Result(this.punctuation);

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
    return Center(
        child: Text(
          resultMessage,
          style: TextStyle(fontSize: 28),
        )
    );
  }
}