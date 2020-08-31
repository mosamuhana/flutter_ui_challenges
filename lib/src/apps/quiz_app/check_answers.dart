import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'page.dart';
import 'models.dart';

class CheckAnswersPage extends StatelessWidget {
  static final String path = "lib/src/pages/quiz_app/check_answers.dart";

  final List<Question> questions;
  final Map<int, dynamic> answers;

  CheckAnswersPage({Key key, @required this.questions, @required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Check Answers'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          _backgroundWave,
          ListView.builder(
            padding: _insets16,
            itemCount: questions.length + 1,
            itemBuilder: _buildItem,
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == questions.length) {
      return RaisedButton(
        child: Text("Done"),
        shape: _doneButtonShape,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => QuizHomePage())),
      );
    }

    Question question = questions[index];
    bool correct = question.correctAnswer == answers[index];

    return Card(
      child: Padding(
        padding: _insets16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.question, style: _blackW500S16Style),
            _hbox5,
            Text("${answers[index]}", style: correct ? _greenBoldS18Style : _redBoldS18Style),
            _hbox5,
            correct
                ? Container()
                : Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Answer: "),
                        TextSpan(text: question.correctAnswer, style: _w500Style),
                      ],
                    ),
                    style: _s16Style,
                  )
          ],
        ),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);

  final _s16Style = TextStyle(fontSize: 16);
  final _blackW500S16Style = TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16);
  final _greenBoldS18Style = TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18);
  final _redBoldS18Style = TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18);
  final _w500Style = TextStyle(fontWeight: FontWeight.w500);

  final _insets16 = EdgeInsets.all(16);

  final _doneButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  final _backgroundWave = ClipPath(
    clipper: WaveClipperTwo(),
    child: Container(
      decoration: BoxDecoration(color: Colors.deepPurple),
      height: 200,
    ),
  );
}
