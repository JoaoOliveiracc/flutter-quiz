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
      'text': 'Qual a linguagem de programação mais popular do mundo?',
      'answer': [
        {'text': 'Java',    'punctuation': 3},
        {'text': 'C#', 'punctuation': 3},
        {'text': 'PHP',    'punctuation': 3},
        {'text': 'JavaScript',   'punctuation': 9},
      ],
    },
    {
      'text': 'O que é o SaaS em computação na nuvem?',
      'answer': [
        {'text': 'Software como um serviço',     'punctuation': 15},
        {'text': 'infraestrutura como serviço', 'punctuation': 4},
        {'text': 'O serviço é a plataforma',   'punctuation': 5},
        {'text': 'Todas as opções',    'punctuation': 1},
      ],
    },
    {
      'text': 'O que é o GIT?',
      'answer': [
        {'text': 'Editor de texto',   'punctuation': 2},
        {'text': 'IDE',  'punctuation': 3},
        {'text': 'Sistema de controle de versões',     'punctuation': 10},
        {'text': 'Editor de imagens',  'punctuation': 2},
      ],
    }
  ];

  void _answer(int punctuation) {
    if(haveQuestionSelected) {
      setState(() {
        _selectedQuestion++;
        _pontuacaoTotal += punctuation;
      });
    }
  }

  void _restartQuiz() {
    setState(()  {
      _selectedQuestion = 0;
      _pontuacaoTotal = 0;
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
          : Result(_pontuacaoTotal, _restartQuiz),
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