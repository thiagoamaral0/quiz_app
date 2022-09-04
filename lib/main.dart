// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:project_quiz/resultado.dart';
import 'questionario.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  final List<Map<String, Object>> _perguntas_quiz = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual é o seu dia favorito?',
      'respostas': [
        {'texto': 'Segunda', 'pontuacao': 3},
        {'texto': 'Quarta', 'pontuacao': 5},
        {'texto': 'Sexta', 'pontuacao': 10},
        {'texto': 'Domingo', 'pontuacao': 1},
      ],
    },
  ];

  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas_quiz.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Perguntas',
          ),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas_quiz: _perguntas_quiz,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
