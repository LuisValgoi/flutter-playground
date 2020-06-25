import 'package:flutter/material.dart';
import 'package:flutter_playground/answer.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _totalScore = 0;
  var _questionIndex = 0;
  final _questions = const [
    {
      'text': 'What\'s your favorite color?',
      'answers': [
        {'text': 'White', 'score': 1},
        {'text': 'Blue', 'score': 4},
        {'text': 'Red', 'score': 5},
        {'text': 'Black', 'score': 10}
      ]
    },
    {
      'text': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Cat', 'score': 4},
        {'text': 'Dog', 'score': 5},
        {'text': 'Horse', 'score': 10}
      ]
    },
    {
      'text': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'John', 'score': 1},
        {'text': 'Anthony', 'score': 4},
        {'text': 'Louis', 'score': 5},
        {'text': 'Smith', 'score': 10}
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _answersReset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ToDoing'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                handler: _answerQuestion,
                idx: _questionIndex,
                questions: _questions,
              )
            : Result(_answersReset, 'Go Back', _totalScore),
      ),
    );
  }
}
