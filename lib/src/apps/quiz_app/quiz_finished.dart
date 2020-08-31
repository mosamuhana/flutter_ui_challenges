import 'package:flutter/material.dart';

import 'models.dart';
import 'check_answers.dart';

class QuizFinishedPage extends StatelessWidget {
  static final String path = "lib/src/pages/quiz_app/quiz_finished.dart";

  final List<Question> questions;
  final Map<int, dynamic> answers;

  QuizFinishedPage({
    Key key,
    @required this.questions,
    @required this.answers,
  }) : super(key: key);

  int get correctAnswers {
    int c = 0;
    this.answers.forEach((index, value) {
      if (this.questions[index].correctAnswer == value) c++;
    });
    return c;
  }

  @override
  Widget build(BuildContext context) {
    final trailingStyle = TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20);

    final total = questions.length;
    final correct = this.correctAnswers;
    final incorrect = total - correct;
    final percent = (correct / total * 100).toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Result'),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: _decorationDecoration,
        child: SingleChildScrollView(
          padding: _insets16,
          child: Column(
            children: [
              Card(
                shape: _roundedShape,
                child: ListTile(
                  contentPadding: _insets16,
                  title: Text("Total Questions", style: _black87W500S16Style),
                  trailing: Text("$total", style: trailingStyle),
                ),
              ),
              _hbox10,
              Card(
                shape: _roundedShape,
                child: ListTile(
                  contentPadding: _insets16,
                  title: Text("Score", style: _black87W500S16Style),
                  trailing: Text("$percent %", style: trailingStyle),
                ),
              ),
              _hbox10,
              Card(
                shape: _roundedShape,
                child: ListTile(
                  contentPadding: _insets16,
                  title: Text("Correct Answers", style: _black87W500S16Style),
                  trailing: Text("$correct/$total", style: trailingStyle),
                ),
              ),
              _hbox10,
              Card(
                shape: _roundedShape,
                child: ListTile(
                  contentPadding: _insets16,
                  title: Text("Incorrect Answers", style: _black87W500S16Style),
                  trailing: Text("$incorrect/$total", style: trailingStyle),
                ),
              ),
              _hbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    padding: _insetsH16V20,
                    shape: _roundedShape,
                    color: Colors.pink.withOpacity(0.8),
                    textColor: Colors.white,
                    child: Text("Goto Home"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  RaisedButton(
                    padding: _insetsH16V20,
                    shape: _roundedShape,
                    color: Colors.deepPurple.withOpacity(0.8),
                    textColor: Colors.white,
                    child: Text("Check Answers"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CheckAnswersPage(questions: questions, answers: answers),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);

  final _black87W500S16Style = TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16);

  final _insets16 = EdgeInsets.all(16);
  final _insetsH16V20 = EdgeInsets.symmetric(horizontal: 16, vertical: 20);

  final _decorationDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.deepPurple, Colors.pink],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  final _roundedShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
}
