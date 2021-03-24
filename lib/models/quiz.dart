import 'package:flutter/material.dart';
import 'pergunta.dart';
import 'resposta.dart';

class Quiz extends StatelessWidget {
  final Function responderPergunta;
  final int perguntaIndex;
  final List<Map<String, Object>> perguntas;

  Quiz(
      {required this.perguntas,
      required this.responderPergunta,
      required this.perguntaIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Pergunta(perguntas[perguntaIndex]['textoPergunta'].toString()),
        ...(perguntas[perguntaIndex]['respostas'] as List<Map<String, Object>>)
            .map((resposta) {
          return Resposta(
              () => responderPergunta(resposta['score']), resposta['text'].toString());
        }).toList()
      ],
    );
  }
}
