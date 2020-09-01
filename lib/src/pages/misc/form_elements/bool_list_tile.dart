import 'package:flutter/material.dart';

class BoolListTile extends StatelessWidget {
  final bool value;
  final String title;
  final ValueChanged<bool> onChanged;
  final Color selectedColor;
  final Color color;

  BoolListTile({
    Key key,
    @required this.value,
    @required this.title,
    this.onChanged,
    this.selectedColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final _selectedColor = selectedColor == null ? primaryColor : selectedColor;
    final _color = color == null ? primaryColor : color;

    return ListTile(
      onTap: () => onChanged?.call(!value),
      title: Text(title),
      trailing: CircleAvatar(
        backgroundColor: value ? _selectedColor : _color,
        radius: 14,
        child: CircleAvatar(
          radius: 12,
          backgroundColor: value ? _selectedColor : Colors.white,
          child: value ? _checkIcon : Container(width: 0),
        ),
      ),
    );
  }

  final _checkIcon = Icon(Icons.check, size: 14);
}
