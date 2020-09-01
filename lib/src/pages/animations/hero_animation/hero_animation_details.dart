import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'back_icon_button.dart';
import 'product.dart';

class HeroAnimationDetails extends StatelessWidget {
  final Product product;

  HeroAnimationDetails({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _imageHero,
          Container(
            padding: _insets16,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _hbox10,
                _backIconButton,
                _spacer,
                _nameHero,
                _hbox20,
                _priceHero,
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get _imageHero {
    return Hero(
      tag: product.imageTag,
      child: CustomImage(product.image, fit: BoxFit.cover),
    );
  }

  Widget get _nameHero {
    return Hero(
      tag: product.nameTag,
      child: Material(
        type: MaterialType.transparency,
        child: Text(product.name, style: _whiteBoldS18Style),
      ),
    );
  }

  Widget get _priceHero {
    return Hero(
      tag: product.priceTag,
      child: Material(
        type: MaterialType.transparency,
        child: Text(
          '\$${product.price}',
          textAlign: TextAlign.start,
          style: _whiteBoldS30Style,
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);

  final _backIconButton = BackIconButton(color: Colors.white);

  final _spacer = Spacer();

  final _insets16 = EdgeInsets.all(16);

  final _whiteBoldS18Style = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
  final _whiteBoldS30Style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
}
