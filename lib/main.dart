import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quest.dart';
import './answer.dart';

main() => runApp(new PerguntaApp());

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

  bool get selectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    
    List<String> answers = selectedQuestion
    ?_questions[_selectedQuestion]['answer']
    :null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: selectedQuestion ? Column(
          children: <Widget>[
            Question(_questions[_selectedQuestion]['text']),
            ...answers.map((text) => Answer(text, _answer)).toList(),
          ],
        ) : null,
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