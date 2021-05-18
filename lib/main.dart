import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  var _pontuacaoTotal = 0;
  final _questions = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'answer': [
        {'text': 'Preto',    'punctuation': 10},
        {'text': 'Vermelho', 'punctuation': 6},
        {'text': 'Verde',    'punctuation': 4},
        {'text': 'Branco',   'punctuation': 8},
      ],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answer': [
        {'text': 'Leão',     'punctuation': 7},
        {'text': 'Elefante', 'punctuation': 5},
        {'text': 'Jacaré',   'punctuation': 10},
        {'text': 'Panda',    'punctuation': 8},
      ],
    },
    {
      'text': 'Qual time você torce?',
      'answer': [
        {'text': 'Flamengo',   'punctuation': 10},
        {'text': 'São Paulo',  'punctuation': 8},
        {'text': 'Santos',     'punctuation': 3},
        {'text': 'Palmeiras',  'punctuation': 6},
      ],
    }
  ];

  void _answer(int pontuacao) {
    if(haveQuestionSelected) {
      setState(() {
        _selectedQuestion++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_pontuacaoTotal);
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

class QuestionApp extends StatefulWidget{
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }

}