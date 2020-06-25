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
        // extract list values into the same level as question
        ...(this.questions[this.idx]['answers'] as List<String>)
            .map((answer) => Answer(
                  selectHandler: this.handler,
                  text: answer,
                ))
            .toList()
      ],
    );
  }
}
