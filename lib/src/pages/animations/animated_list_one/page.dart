import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';

class AnimatedListOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/animations/animated_list_one/page.dart";

  @override
  _AnimatedListOnePageState createState() => _AnimatedListOnePageState();
}

class _AnimatedListOnePageState extends State<AnimatedListOnePage> {
  final listKey = GlobalKey<AnimatedListState>();
  final tween = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero);

  final List<String> items = <String>["Kathmandu", "Bhaktapur", "Pokhara", "Mount Everest"];

  AnimatedListState get listState => listKey.currentState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated List One")),
      backgroundColor: Colors.grey.shade300,
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: _listItemBuilder,
      ),
      floatingActionButton: FloatingActionButton(
        child: _addIcon,
        onPressed: () {
          items.add(_places[_random.nextInt(_places.length)]);
          listState.insertItem(items.length - 1);
          setState(() {});
        },
      ),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index, Animation<double> animation) {
    return SlideTransition(
      position: tween.animate(animation),
      child: BorderedContainer(
        margin: _insetsH8V4,
        padding: _insets0,
        child: ListTile(
          title: Text(items[index]),
          trailing: IconButton(
            icon: _clearIcon,
            onPressed: () {
              listState.removeItem(index, (context, animation) {
                final removedItem = items.removeAt(index);
                return SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.vertical,
                  child: BorderedContainer(
                    margin: _insetsH8V4,
                    padding: _insets0,
                    child: ListTile(title: Text(removedItem)),
                  ),
                );
              });

              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  final _addIcon = Icon(Icons.add);
  final _clearIcon = Icon(Icons.clear);

  final _insets0 = EdgeInsets.all(0);
  final _insetsH8V4 = EdgeInsets.symmetric(vertical: 4, horizontal: 8);

  final _random = Random();
}

const _places = <String>["Nuwakot", "Dhaulagiri", "Rara", "Muktinath", "Pashupatinath"];
