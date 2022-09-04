import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() _reiniciarQuestionario;
  Resultado(this.pontuacao, this._reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é fera!';
    } else if (pontuacao < 16) {
      return 'Muito daora!';
    } else {
      return 'GigaChad!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 30))),
        TextButton(
          onPressed: _reiniciarQuestionario,
          child: const Text(
            "Reiniciar?",
            style: TextStyle(fontSize: 24, color: Colors.purple),
          ),
        ),
      ],
    );
  }
}
