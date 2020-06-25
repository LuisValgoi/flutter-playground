import 'package:flutter/material.dart';
import 'package:flutter_playground/answer.dart';

import './question.dart';
import './answer.dart';

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
    if (_questionIndex < _questions.length) {}
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
            ? Column(
                children: [
                  Question(_questions[_questionIndex]['text']),
                  // extract list values into the same level as question
                  ...(_questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) => Answer(
                            selectHandler: _answerQuestion,
                            text: answer,
                          ))
                      .toList()
                ],
              )
            : Column(
                children: [
                  Question('You have finished!'),
                  Answer.custom(
                    _resetQuestions,
                    'Start Again',
                    Colors.grey[300],
                    Colors.black,
                  )
                ],
              ),
      ),
    );
  }
}
