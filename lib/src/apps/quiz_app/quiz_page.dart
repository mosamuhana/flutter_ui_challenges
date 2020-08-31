import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'models.dart';
import 'quiz_finished.dart';

class QuizPage extends StatefulWidget {
  static final String path = "lib/src/pages/quiz_app/quiz_page.dart";

  final List<Question> questions;
  final Category category;

  const QuizPage({Key key, @required this.questions, this.category}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _answers = <int, dynamic>{};
  final _key = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  List<Question> get questions => widget.questions;

  Question get currentQuestion => questions[_currentIndex];

  bool get completed => _currentIndex >= (questions.length - 1);

  @override
  Widget build(BuildContext context) {
    final options = [...currentQuestion.incorrectAnswers];

    if (!options.contains(currentQuestion.correctAnswer)) {
      options.add(currentQuestion.correctAnswer);
    }

    final choices = options.map((option) {
      return RadioListTile(
        title: Text("$option"),
        groupValue: _answers[_currentIndex],
        value: option,
        onChanged: (value) => setState(() => _answers[_currentIndex] = option),
      );
    }).toList();

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(widget.category.name),
          elevation: 0,
        ),
        body: Stack(
          children: [
            _backgroundWave,
            Padding(
              padding: _insets16,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Text("${_currentIndex + 1}"),
                      ),
                      _wbox16,
                      Expanded(
                        child: Text(
                          currentQuestion.question,
                          softWrap: true,
                          style: _whiteW500S18Style,
                        ),
                      ),
                    ],
                  ),
                  _hbox20,
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: choices,
                    ),
                  ),
                  _submitNextButton,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _submitNextButton {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: RaisedButton(
          shape: _submitNextButtonShape,
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: Text(_currentIndex == (questions.length - 1) ? "Submit" : "Next"),
          onPressed: _nextSubmit,
        ),
      ),
    );
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      _key.currentState.showSnackBar(SnackBar(content: Text("You must select an answer to continue.")));
      return;
    }

    if (!completed) {
      setState(() => _currentIndex++);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => QuizFinishedPage(questions: questions, answers: _answers)),
      );
    }
  }

  Future<bool> _onWillPop() async {
    if (completed) return true;

    return await showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Text("Are you sure you want to quit the quiz? All your progress will be lost."),
          title: Text("Warning!"),
          actions: [
            FlatButton(
              child: Text("Yes"),
              onPressed: () => Navigator.pop(context, true),
            ),
            FlatButton(
              child: Text("No"),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        );
      },
    );
  }

  final _whiteW500S18Style = TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white);

  final _hbox20 = SizedBox(height: 20);
  final _wbox16 = SizedBox(width: 16);

  final _insets16 = EdgeInsets.all(16);

  final _submitNextButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  final _backgroundWave = ClipPath(
    clipper: WaveClipperTwo(),
    child: Container(
      decoration: BoxDecoration(color: Colors.deepPurple),
      height: 200,
    ),
  );
}
