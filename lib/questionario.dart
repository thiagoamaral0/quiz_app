import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'questao.dart';
import 'resposta.dart';
import 'main.dart';

import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas_quiz;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas_quiz,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas_quiz.length;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas_quiz[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(perguntas_quiz[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(resp['texto'].toString(), () => responder(int.parse(resp['pontuacao'].toString())));
        } 
    )],
    );
  }
}
