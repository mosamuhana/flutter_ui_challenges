import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class SliverAppbarPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/sliver_appbar.dart";

  final List<String> images = [
    '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    '$STORE_BASE_URL/img%2Fb1.jpg?alt=media',
    '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    '$STORE_BASE_URL/img%2F3.jpg?alt=media',
    '$STORE_BASE_URL/img%2F4.jpg?alt=media',
    '$STORE_BASE_URL/img%2F5.jpg?alt=media',
    '$STORE_BASE_URL/img%2Fb2.jpg?alt=media',
    '$STORE_BASE_URL/img%2F6.jpg?alt=media',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
          ),
          SliverToBoxAdapter(
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
          ),
          SliverPadding(
            padding: _insetsL16R16,
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, i) => _buildItems(i, context),
                childCount: images.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
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
          ),
          SliverToBoxAdapter(
            child: _imageListSlider,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: _insetsAll20,
              color: Colors.pink,
              child: Text('RECOMMENDED FOR YOU', style: _whiteBoldStyle),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildListItem(index),
              childCount: images.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _imageListSlider {
    return Container(
      padding: _insetsB20,
      height: 200,
      child: Container(
        child: Swiper(
          autoplay: true,
          itemBuilder: (context, index) => PNetworkImage(images[index], fit: BoxFit.cover),
          itemCount: 4,
          pagination: SwiperPagination(),
        ),
      ),
    );
  }

  Widget _buildItems(int index, BuildContext context) {
    final imageUrl = images[index % images.length];
    final tag = "item$index";
    return Container(
      height: 200,
      child: GestureDetector(
        onTap: () => _navigateToItem(context, tag, imageUrl),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: tag,
                child: PNetworkImage(imageUrl, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 10),
            Text('Top Quality fashion item', softWrap: true),
            SizedBox(height: 10),
            Text('Rs.1,254', style: _redBold18Style),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Container(
      height: 100,
      child: Card(
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(images[index % images.length]),
            ),
            title: Text('Top Quality fashion item', softWrap: true),
            subtitle: Text('Rs.1,254', style: _redBold18Style),
          ),
        ),
      ),
    );
  }

  void _navigateToItem(BuildContext context, String tag, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _FashionItemPage(
          tag: tag,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Privates ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _FashionItemPage extends StatelessWidget {
  final String tag;
  final String imageUrl;

  const _FashionItemPage({Key key, this.tag, this.imageUrl}) : super(key: key);

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
                    child: PNetworkImage(imageUrl, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 10),
                Text('Top Quality fashion item', softWrap: true),
                SizedBox(height: 10),
                Text(
                  'Rs.1,254',
                  style: _redBold18Style,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
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
