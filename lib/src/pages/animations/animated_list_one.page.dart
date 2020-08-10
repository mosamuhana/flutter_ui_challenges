import 'package:flutter/material.dart';

import '../bike/bike_details.dart';

List<String> places = ["Nuwakot", "Dhaulagiri", "Rara", "Muktinath", "Pashupatinath"];

class AnimatedListOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/animations/animated_list_one.page.dart";

  @override
  _AnimatedListOnePageState createState() => _AnimatedListOnePageState();
}

class _AnimatedListOnePageState extends State<AnimatedListOnePage> {
  List<String> items;
  final listKey = GlobalKey<AnimatedListState>();
  final tween = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero);

  AnimatedListState get listState => listKey.currentState;

  @override
  void initState() {
    items = ["Kathmandu", "Bhaktapur", "Pokhara", "Mount Everest"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated List One")),
      backgroundColor: Colors.grey.shade300,
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: _itemBuilder,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAddItem,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index, Animation<double> animation) {
    return SlideTransition(
      position: tween.animate(animation),
      child: BorderedContainer(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(0),
        child: ListTile(
          title: Text(items[index]),
          trailing: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              listState.removeItem(index, (context, animation) => _onItemRemoved(context, animation, index));
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  void _onAddItem() {
    places.shuffle();
    items.insert(items.length, places[0]);
    listState.insertItem(items.length - 1);
    setState(() {});
  }

  Widget _onItemRemoved(BuildContext context, Animation<double> animation, int index) {
    final removedItem = items.removeAt(index);
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: BorderedContainer(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(0),
        child: ListTile(title: Text(removedItem)),
      ),
    );
  }
}
