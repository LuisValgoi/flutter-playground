import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Result extends StatelessWidget {
  final Function handler;
  final String title;
  final String btnText;

  Result(this.handler, this.title, this.btnText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(this.title),
        Answer.custom(
          this.handler,
          this.btnText,
          Colors.grey[300],
          Colors.black,
        )
      ],
    );
  }
}
