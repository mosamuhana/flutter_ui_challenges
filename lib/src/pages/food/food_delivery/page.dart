import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../../core/widgets.dart';
import 'models.dart';
import 'data.dart';

class FoodDeliveryPage extends StatefulWidget {
  static final String path = "lib/src/pages/food/food_delivery/page.dart";

  @override
  _FoodDeliveryPageState createState() => _FoodDeliveryPageState();
}

class _FoodDeliveryPageState extends State<FoodDeliveryPage> {
  final List<Recipe> sliderItems = getSliderItems();
  final List<RestaurantSpecialOffer> restaurantSpecialOffers = getRestaurantSpecialOffers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _appBar,
          _slider,
          _sectionHeader("Popular restaurants in Kathmandu"),
          _popularRestaurants,
          _sectionHeader("Food recommendations for you"),
          _recommendedList,
        ],
      ),
    );
  }

  Widget get _appBar {
    return SliverAppBar(
      textTheme: TextTheme(
        headline6: Theme.of(context).textTheme.headline6.merge(_blackStyle),
      ),
      iconTheme: IconThemeData(color: Colors.lightGreen),
      automaticallyImplyLeading: Platform.isWindows,
      backgroundColor: Colors.white,
      expandedHeight: 130,
      floating: true,
      flexibleSpace: Container(
        height: 160,
        padding: _insetsL20R20T20,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("Deliver to")),
                  IconButton(
                    icon: _shoppingCartIcon,
                    onPressed: () {},
                  )
                ],
              ),
              _hbox5,
              TextField(
                decoration: InputDecoration(
                  border: _outlineInputBorder,
                  hintText: "Search for restaurant or dishes",
                  suffixIcon: _searchIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _slider {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            height: 200,
            child: Swiper(
              itemCount: sliderItems.length,
              autoplay: true,
              curve: Curves.easeIn,
              itemBuilder: (_, i) => CustomImage(sliderItems[i].image, fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 200,
            color: Colors.black.withOpacity(0.5),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text("Heavy discount on meals today only.", style: _whiteStyle),
          )
        ],
      ),
    );
  }

  Widget get _popularRestaurants {
    final t = Theme.of(context).textTheme;
    final nameStyle = t.headline6.copyWith(fontSize: 14);
    final specialsStyle = t.subtitle1.copyWith(fontSize: 12);

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          final specialOffer = restaurantSpecialOffers[index];
          return Container(
            padding: _insetsH20V10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  child: CustomImage(specialOffer.image, fit: BoxFit.cover),
                ),
                _hbox10,
                Text(specialOffer.name, style: nameStyle),
                _hbox5,
                Text(specialOffer.specials, style: specialsStyle)
              ],
            ),
          );
        },
        childCount: restaurantSpecialOffers.length,
      ),
    );
  }

  Widget get _recommendedList {
    final t = Theme.of(context).textTheme;
    final titleStyle = t.headline6.merge(_s14Style);
    final subtitleStyle = t.subtitle1.merge(_s12Style);
    final priceStyle = t.headline6.merge(_redS16Style);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final item = sliderItems[index];

          final title = 'Nepali breakfast';
          final subtitle = 'Vegetarian, Nepali';
          final price = 180.0;

          return Container(
            padding: _insetsH20V10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  child: CustomImage(item.image, fit: BoxFit.cover),
                ),
                _hbox10,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: titleStyle),
                          _hbox5,
                          Text(subtitle, style: subtitleStyle),
                          _hbox5,
                        ],
                      ),
                    ),
                    Text("Rs. $price", style: priceStyle),
                    IconButton(
                      icon: _favoriteBorderIcon,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: _addShoppingCartIcon,
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          );
        },
        childCount: sliderItems.length,
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Container(
        padding: _insetsL20T20,
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);

  final _whiteStyle = TextStyle(color: Colors.white);
  final _blackStyle = TextStyle(color: Colors.black);
  final _s12Style = TextStyle(fontSize: 12);
  final _s14Style = TextStyle(fontSize: 14);
  final _redS16Style = TextStyle(fontSize: 16, color: Colors.red);

  final _shoppingCartIcon = Icon(Icons.shopping_cart);
  final _searchIcon = Icon(Icons.search);
  final _favoriteBorderIcon = Icon(Icons.favorite_border);
  final _addShoppingCartIcon = Icon(Icons.add_shopping_cart);

  final _insetsL20T20 = EdgeInsets.only(left: 20, top: 20);
  final _insetsL20R20T20 = EdgeInsets.only(left: 20, right: 20, top: 30);
  final _insetsH20V10 = EdgeInsets.symmetric(vertical: 10, horizontal: 20);

  final _outlineInputBorder = OutlineInputBorder(borderRadius: BorderRadius.circular(5));
}
