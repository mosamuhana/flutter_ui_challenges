import 'package:flutter/material.dart';

import 'models.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  ItemTile({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title, style: _black87BoldS20Style),
      subtitle: Text("${item.date} | ${item.subtitle}"),
      trailing: Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: _circularBorder10,
          image: DecorationImage(
            image: NetworkImage(item.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  final _black87BoldS20Style = TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold);

  final _circularBorder10 = BorderRadius.circular(10);
}
