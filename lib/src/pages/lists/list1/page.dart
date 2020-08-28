import 'package:flutter/material.dart';

import 'data.dart';
import 'item_card.dart';

class List1Page extends StatelessWidget {
  static final String path = "lib/src/pages/lists/list1/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Places List"),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 2,
        actions: [
          Container(
            padding: _insets10,
            child: _filterListIcon,
          )
        ],
      ),
      body: ListView.builder(
        padding: _insets6,
        itemCount: dummyItemList.length,
        itemBuilder: (_, i) => ItemCard(item: dummyItemList[i]),
      ),
    );
  }

  final _insets10 = EdgeInsets.all(10);
  final _insets6 = EdgeInsets.all(6);
  final _filterListIcon = Icon(Icons.filter_list);
}
