import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models.dart';
import 'data.dart';

class AvocadoPage extends StatefulWidget {
  static final String path = "lib/src/pages/food/avocado/page.dart";

  @override
  _AvocadoPageState createState() => _AvocadoPageState();
}

class _AvocadoPageState extends State<AvocadoPage> {
  Product product;

  @override
  void initState() {
    product = getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: _moreVertIcon,
                onPressed: () => print('More'),
              )
            ],
          ),
          _details,
          _favoriteAvatar,
        ],
      ),
    );
  }

  Widget get _favoriteAvatar {
    return Positioned(
      top: _detailsHeight - 15, //365,
      right: 40,
      child: InkWell(
        child: CircleAvatar(
          radius: 20,
          foregroundColor: Colors.grey,
          backgroundColor: Colors.grey.shade200,
          child: product.favorited ? _favoritedIcon : _favoriteBorderIcon,
        ),
        onTap: () => setState(() => product.favorited = !product.favorited),
      ),
    );
  }

  Widget get _details {
    return Positioned(
      top: _detailsHeight,
      left: 0,
      right: 0,
      child: Container(
        padding: _insets30,
        width: double.infinity,
        decoration: _circularTopDecoration60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${product.name}', style: _boldS24Style),
            _hbox10,
            Text("\$${product.price.toStringAsPrecision(3)} / Kg", style: _s16Style),
            Row(
              children: [
                Text('${product.description}', style: _greyStyle),
                _spacer,
                _fireIcon,
                Text('${product.calories}'),
              ],
            ),
            _hbox10,
            Slider(
              onChanged: (value) => setState(() => product.weight = value),
              min: 1,
              max: 5,
              value: product.weight,
            ),
            Row(
              children: [
                Text("${product.weight.toStringAsPrecision(2)} kg (${product.hint})", style: _greyStyle),
                _spacer,
                Text("\$ ${product.totalPrice.toStringAsPrecision(2)}", style: _s16Style),
              ],
            ),
            _hbox10,
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                shape: _addToCartShape,
                color: Colors.pink.shade200,
                textColor: Colors.white,
                child: Text("Add to Cart"),
                onPressed: () => print('Add to Cart'),
              ),
            ),
            _hbox10,
            Center(
              child: TextButton(
                child: Column(
                  children: [
                    _keyboardArrowUpIcon,
                    Text('Know More'),
                  ],
                ),
                onPressed: () => print('Know More'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _detailsHeight = 380.0;

  final _boldS24Style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  final _s16Style = TextStyle(fontSize: 16);
  final _greyStyle = TextStyle(color: Colors.grey.shade700);

  final _insets30 = EdgeInsets.all(30);

  final _moreVertIcon = Icon(Icons.more_vert);
  final _keyboardArrowUpIcon = Icon(Icons.keyboard_arrow_up);
  final _fireIcon = Icon(FontAwesomeIcons.fire, size: 14, color: Colors.pink.shade300);
  final _favoritedIcon = Icon(Icons.favorite, color: Colors.red);
  final _favoriteBorderIcon = Icon(Icons.favorite_border, color: Colors.grey);

  final _hbox10 = SizedBox(height: 10);

  final _addToCartShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));

  final _circularTopDecoration60 = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
  );

  final _spacer = Spacer();
}
