import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';

class AvocadoPage extends StatefulWidget {
  static final String path = "lib/src/pages/food/avocado/page.dart";

  @override
  _AvocadoPageState createState() => _AvocadoPageState();
}

class _AvocadoPageState extends State<AvocadoPage> {
  final _product = _Product(
    name: 'Avocado',
    price: 1.8,
    image: '$STORE_BASE_URL/food%2Favocado-f.jpg?alt=media',
    hint: '12-14 pieces approx.',
    description: '100 gms for 1-2 pieces',
    calories: 160,
    weight: 1.5,
    favorited: false,
  );
  /*
  final image = '$STORE_BASE_URL/food%2Favocado-f.jpg?alt=media';
  final price = 1.8;
  final hint = '12-14 pieces approx.';
  final description = '100 gms for 1-2 pieces';
  final name = 'Avocado';
  final calories = 160;
  double weight = 1.5;
  double get totalPrice => weight * price;
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _image,
          _appBar,
          _details,
          _favoriteAvatar,
        ],
      ),
    );
  }

  Widget get _appBar {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          icon: _moreVertIcon,
          onPressed: () => print('More'),
        )
      ],
    );
  }

  Widget get _image {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_product.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget get _favoriteAvatar {
    final color = _product.favorited ? Colors.red : Colors.grey;
    final icon = _product.favorited ? Icons.favorite : Icons.favorite_border;
    return Positioned(
      top: 365,
      right: 40,
      child: InkWell(
        child: CircleAvatar(
          radius: 20,
          foregroundColor: Colors.grey,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: color),
        ),
        onTap: () => setState(() => _product.favorited = !_product.favorited),
      ),
    );
  }

  Widget get _details {
    return Positioned(
      top: 380,
      left: 0,
      right: 0,
      child: Container(
        padding: _insets30,
        width: double.infinity,
        decoration: _circularTopDecoration60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${_product.name}', style: _boldS24Style),
            _hbox10,
            Text("\$${_product.price.toStringAsPrecision(3)} / Kg", style: _s16Style),
            Row(
              children: [
                Text('${_product.description}', style: _greyStyle),
                _spacer,
                _fireIcon,
                Text('${_product.calories}'),
              ],
            ),
            _hbox10,
            _priceSlider,
            Row(
              children: [
                Text("${_product.weight.toStringAsPrecision(2)} kg (${_product.hint})", style: _greyStyle),
                _spacer,
                Text("\$ ${_product.totalPrice.toStringAsPrecision(2)}", style: _s16Style),
              ],
            ),
            _hbox10,
            _addToCartButton,
            _hbox10,
            _knowMoreButton,
          ],
        ),
      ),
    );
  }

  Widget get _priceSlider {
    return Slider(
      onChanged: (value) => setState(() => _product.weight = value),
      min: 1,
      max: 5,
      value: _product.weight,
    );
  }

  Widget get _addToCartButton {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        shape: _addToCartShape,
        color: Colors.pink.shade200,
        textColor: Colors.white,
        child: Text("Add to Cart"),
        onPressed: () => print('Add to Cart'),
      ),
    );
  }

  Widget get _knowMoreButton {
    return Center(
      child: TextButton(
        child: Column(
          children: [
            _keyboardArrowUpIcon,
            Text('Know More'),
          ],
        ),
        onPressed: () => print('Know More'),
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _Product {
  double weight;
  final String name;
  final double price;
  final String image;
  final String hint;
  final String description;
  final int calories;
  bool favorited;

  double get totalPrice => weight * price;

  _Product({
    this.weight,
    this.name,
    this.price,
    this.image,
    this.hint,
    this.description,
    this.calories,
    this.favorited = false,
  });
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _boldS24Style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
const _s16Style = TextStyle(fontSize: 16);
final _greyStyle = TextStyle(color: Colors.grey.shade700);

const _insets30 = EdgeInsets.all(30);

const _moreVertIcon = Icon(Icons.more_vert);
final _fireIcon = Icon(FontAwesomeIcons.fire, size: 14, color: Colors.pink.shade300);
const _keyboardArrowUpIcon = Icon(Icons.keyboard_arrow_up);

const _hbox10 = SizedBox(height: 10);
//const _hbox20 = SizedBox(height: 20);

const _circularRadius5 = Radius.circular(5);
const _circularRadius60 = Radius.circular(60);

const _circularTopBorder60 = BorderRadius.only(topLeft: _circularRadius60, topRight: _circularRadius60);
const _circularBorder5 = BorderRadius.all(_circularRadius5);

final _addToCartShape = RoundedRectangleBorder(borderRadius: _circularBorder5);

const _circularTopDecoration60 = BoxDecoration(
  color: Colors.white,
  borderRadius: _circularTopBorder60,
);

const _spacer = Spacer();
