import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quest.dart';
import './answer.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _answer() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual o seu animal favorito?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Question(perguntas[_perguntaSelecionada]),
            Answer('Resposta 1',_answer),
            Answer('Resposta 2',_answer),
            Answer('Resposta 3',_answer),
          ],
        ),
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