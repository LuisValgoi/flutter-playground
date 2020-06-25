import 'package:flutter/material.dart';
import './answer.dart';

class Result extends StatelessWidget {
  final Function handler;
  final String btnText;
  final int score;

  Result(this.handler, this.btnText, this.score);

  String get resultPhrase {
    String text = 'You did it!';

    if (score <= 8) {
      text = 'Awesome';
    } else if (score <= 12) {
      text = 'Nice';
    } else if (score <= 16) {
      text = 'Okay';
    } else {
      text = 'Bad';
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            this.resultPhrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Answer.custom(
            this.handler,
            this.btnText,
            Colors.grey[300],
            Colors.black,
          ),
        ],
      ),
    );
  }
}
