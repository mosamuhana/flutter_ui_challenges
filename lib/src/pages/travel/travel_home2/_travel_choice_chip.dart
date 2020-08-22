import 'package:flutter/material.dart';

class TravelChoiceChip extends StatefulWidget {
  final Widget avatar;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  TravelChoiceChip({
    @required this.avatar,
    @required this.label,
    this.selected = false,
    this.onTap,
  });

  @override
  _TravelChoiceChipState createState() => _TravelChoiceChipState();
}

class _TravelChoiceChipState extends State<TravelChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap?.call(),
      child: Container(
        padding: _insetsH15V10,
        decoration: widget.selected ? _selectedDecoration : null,
        child: Row(
          children: [
            widget.avatar,
            _wbox8,
            Text(widget.label, style: _whiteS14Style),
          ],
        ),
      ),
    );
  }

  final _wbox8 = SizedBox(width: 8);

  final _insetsH15V10 = EdgeInsets.symmetric(horizontal: 15, vertical: 10);

  final _whiteS14Style = TextStyle(color: Colors.white, fontSize: 14);

  final _selectedDecoration = BoxDecoration(
    color: Colors.white.withOpacity(.15),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
}
