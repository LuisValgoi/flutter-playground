import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int idx;
  final Function handler;

  Quiz({@required this.questions, @required this.handler, @required this.idx});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(this.questions[this.idx]['text']),
        ...(this.questions[this.idx]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            selectHandler: () => this.handler(answer['score']),
            text: answer['text'],
          );
        }).toList()
      ],
    );
  }
}
