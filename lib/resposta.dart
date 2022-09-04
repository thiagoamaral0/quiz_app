// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoPressionado;

  Resposta(this.texto, this.quandoPressionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.purple,
        child: Text(texto),
        onPressed: quandoPressionado,
      ),
    );
  }
}
