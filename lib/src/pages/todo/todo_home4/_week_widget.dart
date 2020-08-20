import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekWidget extends StatefulWidget {
  final DateTime date;
  final void Function(DateTime) onDaySelect;

  WeekWidget({
    Key key,
    @required this.date,
    this.onDaySelect,
  }) : super(key: key);

  @override
  _WeekWidgetState createState() => _WeekWidgetState();
}

class _WeekWidgetState extends State<WeekWidget> {
  final List<String> _weekDayNames = ['SUN', 'MON', 'TUE', 'WED', 'THR', 'FRI', 'SAT'];
  final List<DateTime> _weekDates = [null, null, null, null, null, null, null];

  int selectedIndex = 0;
  int week;
  String get month => DateFormat('MMMM').format(_weekDates[selectedIndex]);
  int get year => _weekDates[selectedIndex].year;

  @override
  void initState() {
    selectedIndex = widget.date.weekday;
    week = weekNumber(widget.date);
    for (var i = 0; i < 7; i++) {
      _weekDates[i] = widget.date.add(Duration(days: i - selectedIndex));
      //print('$i - ${d.toString()}');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insets16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(month + ' $year' + ' (week: $week)', style: _greyBoldS16Style),
          _hbox10,
          Row(
            children: List.generate(7, _createDay).toList(),
          ),
          _hbox10,
        ],
      ),
    );
  }

  Widget _createDay(int index) {
    final dayName = _weekDayNames[index];
    final dayNum = _weekDates[index].day;
    final isSelected = index == selectedIndex;
    final style = isSelected ? _deepOrangeBoldStyle : _greyBoldStyle;

    return GestureDetector(
      onTap: () {
        selectedIndex = index;
        setState(() {});
        widget.onDaySelect?.call(_weekDates[selectedIndex]);
      },
      child: Container(
        margin: _insetsR5,
        padding: _insets10,
        decoration: isSelected ? _selectedDecoration : _unselectedDecoration,
        child: Column(
          children: [
            Text('$dayName', style: style),
            _hbox10,
            Text('$dayNum', style: style),
          ],
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _deepOrangeBoldStyle = TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold);

  final _greyBoldStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800);

  final _greyBoldS16Style =
      TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 2);

  final _insetsR5 = EdgeInsets.only(right: 5);

  final _insets10 = EdgeInsets.all(10);

  final _insets16 = EdgeInsets.all(16);

  final _selectedDecoration = BoxDecoration(
    color: Colors.orange.shade100,
    borderRadius: BorderRadius.circular(30),
  );

  final _unselectedDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(30),
  );
}

int weekNumber(DateTime date) {
  int dayOfYear = int.parse(DateFormat("D").format(date));
  return ((dayOfYear - date.weekday + 10) / 7).floor();
}
