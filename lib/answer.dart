import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String text;
  final Color color;
  final Color textColor;

  Answer(
      {this.selectHandler,
      this.text,
      this.color: Colors.blue,
      this.textColor: Colors.white});

  Answer.custom(this.selectHandler, this.text, this.color, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: this.color,
        textColor: this.textColor,
        child: Text(this.text),
        onPressed: selectHandler,
      ),
    );
  }
}
