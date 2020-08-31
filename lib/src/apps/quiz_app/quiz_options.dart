import 'package:flutter/material.dart';

import 'data.dart';
import 'models.dart';
import 'quiz_page.dart';

class QuizOptionsDialog extends StatefulWidget {
  static final String path = "lib/src/pages/quiz_app/quiz_options.dart";

  final Category category;

  const QuizOptionsDialog({Key key, this.category}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  final _questionCounts = [10, 20, 30, 40, 50];

  QuestionDifficulty _difficulty;
  int _noOfQuestion;
  bool _processing;

  bool get processing => _processing;
  set processing(bool v) => setState(() => _processing = v);

  @override
  void initState() {
    super.initState();
    _processing = false;
    _noOfQuestion = 10;
    _difficulty = QuestionDifficulty.easy;
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
          _questionCountsList,
          _hbox20,
          _difficultyList,
          _hbox20,
          _processing ? CircularProgressIndicator() : _startQuizButton,
          _hbox20,
        ],
      ),
    );
  }

  Widget get _questionCountsList {
    return Column(
      children: [
        Text("Select Total Number of Questions"),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: _questionCounts.map((count) {
              return _buildChip<int>(
                label: '$count',
                value: count,
                isActive: (value) => _noOfQuestion == value,
                onChange: (value) {
                  _noOfQuestion = value;
                  print('_noOfQuestion: $_noOfQuestion');
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget get _difficultyList {
    return Column(
      children: [
        Text("Select Difficulty"),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            runSpacing: 16,
            spacing: 16,
            children: QuestionDifficulty.values.map((difficulty) {
              return _buildChip<QuestionDifficulty>(
                label: difficulty.asString,
                value: difficulty,
                isActive: (value) => _difficulty == value,
                onChange: (value) {
                  _difficulty = value;
                  print('_difficulty2: $_difficulty');
                },
              );
            }).toList(),
          ),
        ),
      ],
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
        try {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => QuizPage(questions: demoQuestions, category: widget.category)));
        } catch (e) {} finally {
          processing = false;
        }
      },
    );
  }

  Widget _buildChip<T>({String label, T value, ValueChanged<T> onChange, bool Function(T) isActive}) {
    return ActionChip(
      label: Text(label),
      labelStyle: _whiteStyle,
      backgroundColor: isActive(value) ? Colors.indigo : Colors.grey.shade600,
      onPressed: () {
        if (!isActive(value)) {
          setState(() => onChange(value));
        }
      },
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);

  final _whiteStyle = TextStyle(color: Colors.white);

  final _insets16 = EdgeInsets.all(16);
}
