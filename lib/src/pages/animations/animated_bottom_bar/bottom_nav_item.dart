import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final String title;

  BottomNavItem({
    Key key,
    this.isActive = false,
    this.icon,
    this.activeColor,
    this.inactiveColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 200),
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    if (!isActive) {
      return Icon(icon, color: inactiveColor ?? Colors.grey);
    }

    final color = activeColor ?? Theme.of(context).primaryColor;

    return Container(
      color: Colors.white,
      padding: _insets8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
          _hbox5,
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        ],
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);

  final _insets8 = EdgeInsets.all(8);
}
