import 'package:flutter/material.dart';

import '../../../core/widgets.dart';
import 'models.dart';

class BikeListItem extends StatelessWidget {
  final Bike item;
  final VoidCallback onTap;

  BikeListItem({
    Key key,
    this.onTap,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: InkWell(
        borderRadius: _circularBorder4,
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: _circularLeftBorder4,
                image: DecorationImage(image: NetworkImage(item.image), fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: _buildDetails(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Container(
      padding: _insets10,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text('${item.name}', style: _boldS14Style, softWrap: true),
              ),
              Container(
                padding: _insetsH8V5,
                decoration: BoxDecoration(borderRadius: _circularBorder20, color: Theme.of(context).primaryColor),
                child: Text('${item.price}', style: _whiteBoldStyle),
              ),
            ],
          ),
          _hbox5,
          Text.rich(TextSpan(children: [TextSpan(text: "Year ${item.year}")]), style: _greyStyle),
          _hbox5,
          Row(
            children: [
              Text("Condition"),
              _wbox10,
              Rating(value: 5),
            ],
          ),
        ],
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _wbox10 = SizedBox(width: 10);

  final _insets10 = EdgeInsets.all(10);
  final _insetsH8V5 = EdgeInsets.symmetric(vertical: 5, horizontal: 8);

  final _greyStyle = TextStyle(color: Colors.grey.shade700);
  final _boldS14Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
  final _whiteBoldStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  final _circularBorder4 = BorderRadius.circular(4);
  final _circularBorder20 = BorderRadius.circular(20);

  final _circularLeftBorder4 = BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4));
}
