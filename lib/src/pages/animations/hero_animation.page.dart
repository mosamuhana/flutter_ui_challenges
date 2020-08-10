import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';
import 'hero_animation_details.page.dart';
import 'data/products.dart';

const _duration1 = Duration(seconds: 1);

final _headerText = Text.rich(
  TextSpan(
    children: [
      TextSpan(text: "Best items", style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: " from around"),
    ],
  ),
);

class HeroAnimationPage extends StatefulWidget {
  static final String path = "lib/src/pages/animations/hero_animation.page.dart";

  @override
  _HeroAnimationPageState createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  int prevIndex = 0;
  final SwiperController _swiperController = SwiperController();
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          hSizedBox20,
          Align(
            alignment: Alignment.topLeft,
            child: BackIconButton(),
          ),
          _headerText,
          Expanded(
            flex: 2,
            child: Swiper(
              physics: BouncingScrollPhysics(),
              viewportFraction: 0.8,
              itemCount: products.length,
              loop: false,
              controller: _swiperController,
              onIndexChanged: _onIndexChanged,
              itemBuilder: _itemBuilder,
            ),
          ),
          Stack(
            children: <Widget>[
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

    final imageHero = Hero(
      tag: "image_${product.id}",
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: PNetworkImage(product.imageUrl, fit: BoxFit.cover),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => _showDetails(product),
              child: imageHero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesc(int index) {
    final product = products[index];

    final size = MediaQuery.of(context).size;
    final titleStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
    final priceStyle = TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    );

    final titleHero = Hero(
      tag: "title_${product.id}",
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
      tag: "price_${product.id}",
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          width: size.width,
          child: Text(
            '\$${product.price}',
            textAlign: TextAlign.center,
            style: priceStyle,
          ),
        ),
      ),
    );

    return AnimatedOpacity(
      duration: _duration1,
      opacity: currentIndex == index ? 1 : 0,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            hSizedBox10,
            titleHero,
            hSizedBox10,
            priceHero,
            hSizedBox20,
          ],
        ),
      ),
    );
  }

  void _onIndexChanged(int index) {
    _controller.reverse();
    setState(() {
      prevIndex = currentIndex;
      currentIndex = index;
      _controller.forward();
    });
  }

  void _showDetails(Product product) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        pageBuilder: (context, _, __) => HeroAnimationDetailsPage(product: product),
      ),
    );
  }
}
