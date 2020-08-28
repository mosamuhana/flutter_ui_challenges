import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'item.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          _image,
          _info,
        ],
      ),
    );
  }

  Widget get _image {
    return Stack(
      children: [
        Container(
          height: 125,
          width: 110,
          padding: _insetsL0T10R20B70,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(item.image), fit: BoxFit.cover),
          ),
        ),
        if (item.discount != null)
          Positioned(
            right: 2,
            bottom: 2,
            child: Container(
              padding: _insetsH8V2,
              decoration: _discountDecoration,
              child: Text(item.discount, style: _whiteStyle),
            ),
          ),
      ],
    );
  }

  Widget get _info {
    return Padding(
      padding: _insets8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: _deepOrangeW700S17Style),
          Text(item.catagory, style: _black87S14Style),
          Text(item.place, style: _black87S14Style),
          _hbox10,
          Rating(value: item.ratings),
          Row(
            children: [
              Text('${item.ratings}', style: _s13Style),
              _wbox5,
              Text("Ratings", style: _s13Style),
            ],
          ),
        ],
      ),
    );
  }

  final _wbox5 = SizedBox(width: 5);
  final _hbox10 = SizedBox(height: 10);

  final _deepOrangeW700S17Style = TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w700, fontSize: 17);
  final _black87S14Style = TextStyle(fontSize: 14, color: Colors.black87);
  final _s13Style = TextStyle(fontSize: 13);
  final _whiteStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.normal);

  final _insetsL0T10R20B70 = EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20);
  final _insets8 = EdgeInsets.all(8);
  final _insetsH8V2 = EdgeInsets.symmetric(horizontal: 8, vertical: 2);

  final _discountDecoration = BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepOrange);
}
