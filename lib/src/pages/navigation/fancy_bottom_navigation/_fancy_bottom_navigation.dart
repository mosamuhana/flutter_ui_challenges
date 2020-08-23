import 'package:flutter/material.dart';

import '_nav_item.dart';

class FancyBottomNavigation extends StatefulWidget {
  final int currentIndex;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final List<NavItem> items;
  final ValueChanged<int> onItemSelected;

  FancyBottomNavigation({
    Key key,
    this.currentIndex = 0,
    this.iconSize = 24,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    @required this.items,
    @required this.onItemSelected,
  }) {
    assert(items != null);
    assert(onItemSelected != null);
  }

  @override
  _FancyBottomNavigationState createState() => _FancyBottomNavigationState();
}

class _FancyBottomNavigationState extends State<FancyBottomNavigation> {
  Color _backgroundColor;
  Color _activeColor;
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  Color get activeColor =>
      _activeColor ??= (widget.activeColor == null) ? Theme.of(context).accentColor : widget.activeColor;
  Color get backgroundColor =>
      _backgroundColor ??= (widget.backgroundColor == null) ? Theme.of(context).bottomAppBarColor : widget.backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56,
      padding: _insetsL8R8T6B6,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [_shadow1],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.items.length, (index) => _createItem(index)).toList(),
      ),
    );
  }

  Widget _createItem(int index) {
    final isSelected = index == _selectedIndex;
    final item = widget.items[index];

    return GestureDetector(
      onTap: () {
        widget.onItemSelected(index);
        setState(() => _selectedIndex = index);
      },
      child: AnimatedContainer(
        width: isSelected ? 124 : 50,
        height: double.maxFinite,
        duration: Duration(milliseconds: 250),
        padding: _insetsH12V8,
        decoration: !isSelected ? null : BoxDecoration(color: activeColor, borderRadius: _circularBorder50),
        child: ListView(
          shrinkWrap: true,
          padding: _insets0,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: _insetsR8,
                  child: Icon(
                    item.icon,
                    size: widget.iconSize,
                    color: isSelected ? backgroundColor : widget.inactiveColor,
                  ),
                ),
                !isSelected ? SizedBox.shrink() : Text(item.title, style: TextStyle(color: backgroundColor)),
              ],
            )
          ],
        ),
      ),
    );
  }

  final _insetsL8R8T6B6 = EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6);
  final _insetsH12V8 = EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  final _insets0 = EdgeInsets.all(0);
  final _insetsR8 = EdgeInsets.only(right: 8);

  final _circularBorder50 = BorderRadius.circular(50);

  final _shadow1 = BoxShadow(color: Colors.black12, blurRadius: 2);
}
