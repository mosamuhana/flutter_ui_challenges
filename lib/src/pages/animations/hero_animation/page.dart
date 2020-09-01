import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../../core/widgets.dart';
import 'back_icon_button.dart';
import 'hero_animation_details.dart';
import 'product.dart';
import 'data.dart' show products;

class HeroAnimationPage extends StatefulWidget {
  static final String path = "lib/src/pages/animations/hero_animation/page.dart";

  @override
  _HeroAnimationPageState createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> with SingleTickerProviderStateMixin {
  final _swiperController = SwiperController();
  AnimationController _controller;
  int currentIndex = 0;
  int prevIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _duration1, vsync: this)..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _hbox20,
          Align(
            alignment: Alignment.topLeft,
            child: _backIconButton,
          ),
          _headerText,
          Expanded(
            flex: 2,
            child: Swiper(
              physics: _bouncingScrollPhysics,
              viewportFraction: 0.8,
              itemCount: products.length,
              loop: false,
              controller: _swiperController,
              onIndexChanged: _onIndexChanged,
              itemBuilder: _itemBuilder,
            ),
          ),
          Stack(
            children: [
              _buildDesc(0),
              _buildDesc(1),
              _buildDesc(2),
            ],
          )
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final product = products[index];

    return Container(
      padding: _insets16,
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _showDetails(product),
              child: Hero(
                tag: product.imageTag,
                child: ClipRRect(
                  borderRadius: _circularBorder20,
                  child: CustomImage(product.image, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesc(int index) {
    final product = products[index];
    final double opacity = currentIndex == index ? 1 : 0;
    final size = MediaQuery.of(context).size;

    final titleStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    final titleHero = Hero(
      tag: product.nameTag,
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          width: size.width,
          child: Text(
            product.name,
            textAlign: TextAlign.center,
            style: titleStyle,
          ),
        ),
      ),
    );

    final priceHero = Hero(
      tag: product.priceTag,
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          width: size.width,
          child: Text(
            '\$${product.price}',
            textAlign: TextAlign.center,
            style: _s30BoldStyle,
          ),
        ),
      ),
    );

    return AnimatedOpacity(
      duration: _duration1,
      opacity: opacity,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _hbox10,
            titleHero,
            _hbox10,
            priceHero,
            _hbox20,
          ],
        ),
      ),
    );
  }

  void _onIndexChanged(int index) {
    _controller.reverse();
    prevIndex = currentIndex;
    currentIndex = index;
    _controller.forward();
    setState(() {});
  }

  void _showDetails(Product product) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: _duration1,
        pageBuilder: (context, _, __) => HeroAnimationDetails(product: product),
      ),
    );
  }

  final _headerText = Text.rich(
    TextSpan(
      children: [
        TextSpan(text: "Best items", style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: " from around"),
      ],
    ),
  );

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);

  final _insets16 = EdgeInsets.all(16);

  final _duration1 = Duration(seconds: 1);

  final _s30BoldStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final _bouncingScrollPhysics = BouncingScrollPhysics();

  final _circularBorder20 = BorderRadius.circular(20);

  final _backIconButton = BackIconButton();
}
