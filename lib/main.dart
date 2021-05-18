import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  final _questions = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'answer': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answer': ['Elefante', 'Leão', 'Coelho', 'Cobra'],
    },
    {
      'text': 'Qual time você torce?',
      'answer': ['São Paulo', 'Flamengo', 'Palmeiras', 'Internacioanl'],
    }
  ];

  void _answer() {
    setState(() {
      _selectedQuestion++;
    });
  }

  bool get haveQuestionSelected {
    return _selectedQuestion < _questions.length;
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: haveQuestionSelected
          ? Quiz(
            questions: _questions,
            selectedQuestion: _selectedQuestion,
            answer: _answer,
          )
          : Result(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }

}