import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';
import 'image_slider.dart';
import 'item_card.dart';
import 'shop_item.dart';
import 'shop_item_card.dart';

class SliverAppBarPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/sliver_app_bar/page.dart";

  final imageUrl = _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _sliverAppBar,
          _sliverTopBar,
          _sliverShopGrid,
          _featuredBar,
          _sliverImageSlider,
          _recommendedForYouBar,
          _sliverShopList,
        ],
      ),
    );
  }

  Widget get _sliverAppBar {
    return SliverAppBar(
      expandedHeight: 150,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Welcome To Shop'),
        background: CustomImage(imageUrl, fit: BoxFit.cover),
      ),
      actions: [
        IconButton(
          icon: _favoriteBorderIcon,
          tooltip: 'Favorites',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget get _sliverTopBar {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.deepOrange,
        child: Padding(
          padding: _insets8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                child: Text('NEW ARRIVALS', style: _whiteBoldStyle),
                onPressed: () {},
              ),
              MaterialButton(
                child: Text('SEE ALL', style: _whiteW400Style),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _sliverShopGrid {
    return SliverPadding(
      padding: _insetsL16R16,
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (_, i) => ShopItemCard(item: _shopItems[i]),
          childCount: _shopItems.length,
        ),
      ),
    );
  }

  Widget get _featuredBar {
    return SliverToBoxAdapter(
      child: Container(
        margin: _insetsT20,
        color: Colors.pink,
        child: Padding(
          padding: _insets8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                child: Text('FEATURED', style: _whiteBoldStyle),
                onPressed: () {},
              ),
              MaterialButton(
                child: Text('SEE ALL', style: _whiteW400Style),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _sliverImageSlider {
    return SliverToBoxAdapter(
      child: ImageSlider(images: _shopItems.map((x) => x.image).toList()),
    );
  }

  Widget get _recommendedForYouBar {
    return SliverToBoxAdapter(
      child: Container(
        padding: _insets20,
        color: Colors.pink,
        child: Text('RECOMMENDED FOR YOU', style: _whiteBoldStyle),
      ),
    );
  }

  Widget get _sliverShopList {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, i) => ItemCard(item: _shopItems[i]),
        childCount: _shopItems.length,
      ),
    );
  }

  final _whiteBoldStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final _whiteW400Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w400);

  final _favoriteBorderIcon = Icon(Icons.favorite_border);

  final _insetsL16R16 = EdgeInsets.only(left: 16, right: 16);
  final _insetsT20 = EdgeInsets.only(top: 20);
  final _insets8 = EdgeInsets.all(8);
  final _insets20 = EdgeInsets.all(20);
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _shopItems = <ShopItem>[
  ShopItem(id: 1, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F1.jpg?alt=media'),
  ShopItem(id: 2, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2Fb1.jpg?alt=media'),
  ShopItem(id: 3, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F2.jpg?alt=media'),
  ShopItem(id: 4, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F3.jpg?alt=media'),
  ShopItem(id: 5, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F4.jpg?alt=media'),
  ShopItem(id: 6, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F5.jpg?alt=media'),
  ShopItem(id: 7, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2Fb2.jpg?alt=media'),
  ShopItem(id: 8, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F6.jpg?alt=media'),
];

const _imageUrl = '$STORE_BASE_URL/img%2F2.jpg?alt=media';
