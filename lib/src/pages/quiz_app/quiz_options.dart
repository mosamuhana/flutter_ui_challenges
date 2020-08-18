import 'package:flutter/material.dart';

import 'models/category.dart';
import 'models/demo_values.dart';
import 'models/question.dart';
import 'quiz_page.dart';

class QuizOptionsDialog extends StatefulWidget {
  static final String path = "lib/src/pages/quiz_app/quiz_options.dart";

  final Category category;

  const QuizOptionsDialog({Key key, this.category}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  int _noOfQuestions;
  String _difficulty;
  bool _processing;

  bool get processing => _processing;
  set processing(bool v) => setState(() => _processing = v);

  @override
  void initState() {
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "easy";
    _processing = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: _insets16,
            color: Colors.grey.shade200,
            child: Text(widget.category.name, style: Theme.of(context).textTheme.headline6),
          ),
          _hbox10,
          Text("Select Total Number of Questions"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                _wbox0,
                ..._numberOfQuestions.map((value) {
                  return ActionChip(
                    label: Text('$value'),
                    labelStyle: _whiteStyle,
                    backgroundColor: _noOfQuestions == value ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => setState(() => _noOfQuestions = value),
                  );
                }).toList(),
              ],
            ),
          ),
          _hbox20,
          Text("Select Difficulty"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 16,
              spacing: 16,
              children: [
                _wbox0,
                ..._difficultyList.map((label) {
                  final value = label == 'Any' ? null : label.toLowerCase();
                  return ActionChip(
                    label: Text(label),
                    labelStyle: _whiteStyle,
                    backgroundColor: _difficulty == value ? Colors.indigo : Colors.grey.shade600,
                    onPressed: () => setState(() => _difficulty = value),
                  );
                }).toList(),
              ],
            ),
          ),
          _hbox20,
          _processing ? CircularProgressIndicator() : _startQuizButton,
          _hbox20,
        ],
      ),
    );
  }

  Widget get _startQuizButton {
    return RaisedButton(
      child: Text("Start Quiz"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: () async {
        processing = true;
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => QuizPage(questions: demoQuestions, category: widget.category)));
        processing = false;
      },
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Static Data --------------------------------------------------------------
// ----------------------------------------------------------------------------------

const _numberOfQuestions = [10, 20, 30, 40, 50];
const _difficultyList = ['Any', 'Easy', 'Medium', 'Hard'];

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _wbox0 = SizedBox(width: 0);

const _whiteStyle = TextStyle(color: Colors.white);

const _insets16 = EdgeInsets.all(16);
