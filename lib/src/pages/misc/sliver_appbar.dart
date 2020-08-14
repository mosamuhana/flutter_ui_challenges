import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class SliverAppbarPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/sliver_appbar.dart";

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
        background: PNetworkImage(_imageUrl, fit: BoxFit.cover),
      ),
      actions: [
        IconButton(
          icon: _favoriteBorderIcon,
          tooltip: 'Favorites',
          onPressed: () {/* ... */},
        ),
      ],
    );
  }

  Widget get _sliverTopBar {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.deepOrange,
        child: Padding(
          padding: _insetsAll8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Text('NEW ARRIVALS', style: _whiteBoldStyle),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text('SEE ALL', style: _whiteNormalStyle),
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
          (_, i) => _ShopItemCard(item: _shopItems[i]),
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
          padding: _insetsAll8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Text('FEATURED', style: _whiteBoldStyle),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text('SEE ALL', style: _whiteNormalStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _sliverImageSlider {
    return SliverToBoxAdapter(
      child: _ImageSlider(images: _images),
    );
  }

  Widget get _recommendedForYouBar {
    return SliverToBoxAdapter(
      child: Container(
        padding: _insetsAll20,
        color: Colors.pink,
        child: Text('RECOMMENDED FOR YOU', style: _whiteBoldStyle),
      ),
    );
  }

  Widget get _sliverShopList {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, i) => _ItemCard(item: _shopItems[i]),
        childCount: _shopItems.length,
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _FashionItemPage extends StatelessWidget {
  final _ShopItem item;

  const _FashionItemPage({Key key, this.item}) : super(key: key);

  String get tag => 'shopItem${item.id}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top quality fashion item'),
      ),
      body: Material(
        child: Container(
          // The blue background emphasizes that it's a new route.
          color: Colors.white,
          padding: _insetsAll16,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: tag,
                    child: PNetworkImage(item.image, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 10),
                Text(item.title, softWrap: true),
                SizedBox(height: 10),
                Text(item.price, style: _redBold18Style)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ShopItemCard extends StatelessWidget {
  final _ShopItem item;

  const _ShopItemCard({Key key, this.item}) : super(key: key);

  String get tag => 'shopItem${item.id}';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => _FashionItemPage(item: item)),
          );
        },
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: tag,
                child: PNetworkImage(item.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 10),
            Text(item.title, softWrap: true),
            SizedBox(height: 10),
            Text(item.price, style: _redBold18Style),
          ],
        ),
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final _ShopItem item;

  const _ItemCard({Key key, this.item}) : super(key: key);

  String get tag => 'shopItem${item.id}';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        child: Center(
          child: ListTile(
            leading: CircleAvatar(radius: 40, backgroundImage: NetworkImage(item.image)),
            title: Text(item.title, softWrap: true),
            subtitle: Text(item.price, style: _redBold18Style),
          ),
        ),
      ),
    );
  }
}

class _ImageSlider extends StatelessWidget {
  final List<String> images;

  const _ImageSlider({Key key, @required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insetsB20,
      height: 200,
      child: Container(
        child: Swiper(
          autoplay: true,
          itemBuilder: (context, index) => PNetworkImage(images[index], fit: BoxFit.cover),
          itemCount: images.length,
          pagination: SwiperPagination(),
        ),
      ),
    );
  }
}
// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final List<String> _images = [
  '$STORE_BASE_URL/img%2F1.jpg?alt=media',
  '$STORE_BASE_URL/img%2Fb1.jpg?alt=media',
  '$STORE_BASE_URL/img%2F2.jpg?alt=media',
  '$STORE_BASE_URL/img%2F3.jpg?alt=media',
  '$STORE_BASE_URL/img%2F4.jpg?alt=media',
  '$STORE_BASE_URL/img%2F5.jpg?alt=media',
  '$STORE_BASE_URL/img%2Fb2.jpg?alt=media',
  '$STORE_BASE_URL/img%2F6.jpg?alt=media',
];

final _shopItems = <_ShopItem>[
  _ShopItem(id: 1, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F1.jpg?alt=media'),
  _ShopItem(id: 2, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2Fb1.jpg?alt=media'),
  _ShopItem(id: 3, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F2.jpg?alt=media'),
  _ShopItem(id: 4, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F3.jpg?alt=media'),
  _ShopItem(id: 5, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F4.jpg?alt=media'),
  _ShopItem(id: 6, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F5.jpg?alt=media'),
  _ShopItem(id: 7, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2Fb2.jpg?alt=media'),
  _ShopItem(id: 8, title: 'Top Quality fashion item', price: 'Rs.1,254', image: '$STORE_BASE_URL/img%2F6.jpg?alt=media'),
];

class _ShopItem {
  final int id;
  final String title;
  final String price;
  final String image;
  _ShopItem({this.id, this.title, this.price, this.image});

  String get tag => 'shopItem$id';
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _imageUrl = '$STORE_BASE_URL/img%2F2.jpg?alt=media';

const _whiteBoldStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const _whiteNormalStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w400);
const _redBold18Style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red);

const _favoriteBorderIcon = Icon(Icons.favorite_border);

const _insetsL16R16 = EdgeInsets.only(left: 16, right: 16);
const _insetsT20 = EdgeInsets.only(top: 20);
const _insetsB20 = EdgeInsets.only(bottom: 20);
const _insetsAll8 = EdgeInsets.all(8);
const _insetsAll16 = EdgeInsets.all(16);
const _insetsAll20 = EdgeInsets.all(20);
