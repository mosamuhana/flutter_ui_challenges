import 'package:flutter/material.dart';

class ItemCounter extends StatefulWidget {
  final int value;
  final ValueChanged<int> onChange;

  ItemCounter({
    Key key,
    this.value = 0,
    this.onChange,
  }) : super(key: key);

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int count = 0;

  @override
  void initState() {
    count = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(
          icon: Icons.remove,
          onTap: count <= 1 ? null : _decrement,
        ),
        _wbox4,
        Card(
          child: Padding(
            padding: _insets8,
            child: Text('$count'),
          ),
        ),
        _wbox4,
        _buildButton(
          icon: Icons.add,
          onTap: count >= 100 ? null : _increment,
        ),
      ],
    );
  }

  void _increment() {
    count++;
    widget.onChange?.call(count);
    setState(() {});
  }

  void _decrement() {
    count--;
    widget.onChange?.call(count);
    setState(() {});
  }

  Widget _buildButton({@required IconData icon, @required Color iconColor, VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.redAccent.shade200,
      child: Container(
        decoration: _circularDecoration50,
        alignment: Alignment.center,
        child: Padding(
          padding: _insets6,
          child: Icon(
            icon,
            color: onTap == null ? Colors.grey : iconColor,
            size: 20,
          ),
        ),
      ),
    );
  }

  final _insets6 = EdgeInsets.all(6);
  final _insets8 = EdgeInsets.all(8);
  final _wbox4 = SizedBox(width: 4);

  final _circularDecoration50 = BoxDecoration(borderRadius: BorderRadius.circular(50));
}
