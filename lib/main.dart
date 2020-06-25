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
  var _questionIndex = 0;
  final _questions = const [
    {
      'text': 'What\'s your favorite color?',
      'answers': ['White', 'Red']
    },
    {
      'text': 'What\'s your favorite animal?',
      'answers': ['Dog', 'Cat']
    },
    {
      'text': 'Who\'s your favorite instructor?',
      'answers': ['Luis', 'Valgoi']
    }
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuestions() {
    setState(() {
      _questionIndex = 0;
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
            : Result(_resetQuestions, 'You have finished!', 'Go Back'),
      ),
    );
  }
}
