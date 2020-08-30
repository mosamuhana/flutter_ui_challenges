import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'product.dart';
import 'custom_dropdown_button.dart';

final _productColors = ['Black', 'Blue', 'Red'];
final _productSizes = ['S', 'M', 'XL', 'XXL'];

class ProductItem extends StatelessWidget {
  final Product item;
  final ValueChanged<String> onSizeChanged;
  final ValueChanged<String> onColorChanged;

  ProductItem({
    Key key,
    @required this.item,
    this.onSizeChanged,
    this.onColorChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PNetworkImage(item.image),
        Padding(
          padding: _insetsH10V5,
          child: Row(
            children: [
              Expanded(
                child: CustomDropdownButton<String>(
                  items: _productColors,
                  value: item.color,
                  onChanged: (v) => onColorChanged?.call(v),
                ),
              ),
              Expanded(
                child: CustomDropdownButton<String>(
                  items: _productSizes,
                  value: item.size,
                  onChanged: (v) => onSizeChanged?.call(v),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: _insetsH20V10,
          child: Text('${item.title}', style: _w500S22Style),
        ),
        Padding(
          padding: _insetsH20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Rating(value: item.rating),
                    _wbox5,
                    Text("${item.rating} stars", style: _greyS14Style),
                  ],
                ),
              ),
              Text("\$${item.price}", style: _redS30Style),
            ],
          ),
        ),
        Padding(
          padding: _insetsH20V10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Description", style: _w400S20Style),
              Padding(
                padding: _insetsV10,
                child: Text(
                  item.description,
                  textAlign: TextAlign.justify,
                  style: _greyStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  final _wbox5 = SizedBox(width: 5);

  final _greyS14Style = TextStyle(color: Colors.grey, fontSize: 14);
  final _redS30Style = TextStyle(color: Colors.red, fontSize: 30);
  final _w500S22Style = TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
  final _w400S20Style = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  final _greyStyle = TextStyle(color: Colors.grey.shade600);

  final _insetsH10V5 = EdgeInsets.symmetric(horizontal: 10, vertical: 5);
  final _insetsH20V10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  final _insetsV10 = EdgeInsets.symmetric(vertical: 10);
  final _insetsH20 = EdgeInsets.symmetric(horizontal: 20);
}
