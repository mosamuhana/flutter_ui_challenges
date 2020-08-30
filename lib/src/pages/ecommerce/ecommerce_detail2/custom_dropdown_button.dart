import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownButton<T> extends StatelessWidget {
  final List<T> items;
  final T value;
  final ValueChanged<T> onChanged;
  final ValueChanged<T> onTap;

  List<DropdownMenuItem<T>> _menuItems;

  CustomDropdownButton({
    Key key,
    @required this.items,
    @required this.value,
    this.onChanged,
    this.onTap,
  }) : super(key: key) {
    _menuItems = List.generate(items?.length ?? 0, _buildItem);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      isExpanded: true,
      value: value,
      onChanged: (v) => onChanged?.call(v),
      items: _menuItems,
    );
  }

  DropdownMenuItem<T> _buildItem(int index) {
    var item = items[index];
    return DropdownMenuItem<T>(
      value: item,
      child: Text(item?.toString() ?? ''),
      onTap: () => onTap?.call(item),
    );
  }
}
