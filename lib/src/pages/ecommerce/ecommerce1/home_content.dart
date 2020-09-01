import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../../core/widgets.dart';
import 'models.dart';
import 'data.dart';

class HomeContentPage extends StatelessWidget {
  final List<String> categories = dummyData.categories;
  final List<String> images = dummyData.images;
  final List<PopularItem> popularItems = dummyData.popularItems;
  final List<TopItem> topItems = dummyData.topItems;
  final List<String> flashSaleImages = dummyData.flashSaleImages;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _imageListSlider,
        _categoriesList,
        _flashSales,
        _popularList,
        Center(child: Text('Just for You', style: _w700S20Style)),
        _buildTopItems(0),
        _buildTopItems(2),
        _buildTopItems(4),
        _buildTopItems(6),
        _buildTopItems(8),
      ],
    );
  }

  Widget get _imageListSlider {
    return Container(
      height: 120,
      child: Stack(
        children: [
          ClipPath(
            clipper: DiagonalPathClipperOne(),
            child: Container(
              height: 110,
              color: Colors.deepPurple,
            ),
          ),
          ImageListSlider(images: images, padding: _insetsH20),
        ],
      ),
    );
  }

  Widget get _categoriesList {
    Widget builderItem(int index) {
      var category = categories[index % categories.length];
      return GestureDetector(
        onTap: () => print(category),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              maxRadius: 30,
              child: _whiteHomeIcon,
            ),
            _hbox8,
            Text(category)
          ],
        ),
      );
    }

    return Container(
      height: 110,
      child: GridView.builder(
        padding: _insets10,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (_, i) => builderItem(i),
      ),
    );
  }

  Widget get _flashSales {
    Widget _item(String text) {
      return Container(
        color: Colors.black,
        padding: _insetsH5V2,
        child: Text(text, style: _whiteStyle),
      );
    }

    return Container(
      height: 200,
      padding: _insets10,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Flash Sales', style: _boldStyle),
                  _wbox10,
                  _item('02'),
                  _item('20'),
                  _item('30'),
                ],
              ),
              Text('SHOP MORE >>', style: _redStyle)
            ],
          ),
          _hbox10,
          Row(
            children: [
              _buildFlashSaleItem(0),
              _buildFlashSaleItem(1),
              _buildFlashSaleItem(2),
            ],
          )
        ],
      ),
    );
  }

  Widget get _popularList {
    return Container(
      height: 180,
      child: Column(
        children: [
          Container(
            padding: _insets10,
            child: Row(
              children: [
                _buildPopularItem(item: popularItems[0]),
                _wbox10,
                _buildPopularItem(item: popularItems[1]),
              ],
            ),
          ),
          Container(
            padding: _insets10,
            child: Row(
              children: [
                _buildPopularItem(item: popularItems[2]),
                _wbox10,
                _buildPopularItem(item: popularItems[3]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopItem(int index) {
    final item = topItems[index % topItems.length];
    return Expanded(
      child: Column(
        children: [
          CustomImage(item.image),
          _hbox10,
          Text(item.title, softWrap: true),
          _hbox10,
          Text(item.price, style: _redBoldS18Style)
        ],
      ),
    );
  }

  Widget _buildTopItems(int index) {
    return Container(
      padding: _insetsH10V5,
      child: Row(
        children: [
          _buildTopItem(index),
          _wbox10,
          _buildTopItem(index + 1),
        ],
      ),
    );
  }

  Widget _buildFlashSaleItem(int index) {
    return Expanded(
      child: Container(
        padding: _insets5,
        child: Column(
          children: [
            Container(
              height: 80,
              // color: Colors.blue,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(flashSaleImages[index]), fit: BoxFit.cover),
              ),
            ),
            _hbox5,
            Stack(
              children: [
                ClipPath(
                  clipper: _shapeClipper,
                  child: Container(height: 20, color: Colors.red.shade200),
                ),
                ClipPath(
                  clipper: _shapeClipper,
                  child: Container(
                    padding: _insetsL10,
                    height: 20,
                    width: 70,
                    color: Colors.red,
                    child: Text('12 Sold', style: _whiteStyle),
                  ),
                ),
              ],
            ),
            _hbox5,
            Text('Rs.275')
          ],
        ),
      ),
    );
  }

  Widget _buildPopularItem({PopularItem item}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border(
            left: BorderSide(color: Colors.red.shade200, style: BorderStyle.solid, width: 5),
          ),
        ),
        child: ListTile(
          onTap: () {},
          title: Text(item.title),
          subtitle: Text(item.subtitle),
          trailing: Container(
            width: 50,
            child: CustomImage(item.image, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox8 = SizedBox(height: 8);
  final _hbox10 = SizedBox(height: 10);
  final _wbox10 = SizedBox(width: 10);

  final _whiteHomeIcon = Icon(Icons.home, color: Colors.white);

  final _w700S20Style = TextStyle(fontWeight: FontWeight.w700, fontSize: 20);
  final _redBoldS18Style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red);
  final _boldStyle = TextStyle(fontWeight: FontWeight.bold);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _redStyle = TextStyle(color: Colors.red);

  final _insetsH10V5 = EdgeInsets.symmetric(horizontal: 10, vertical: 5);
  final _insetsH5V2 = EdgeInsets.symmetric(vertical: 2, horizontal: 5);
  final _insets10 = EdgeInsets.all(10);
  final _insets5 = EdgeInsets.all(5);
  final _insetsL10 = EdgeInsets.only(left: 10);
  final _insetsH20 = EdgeInsets.symmetric(horizontal: 20);

  final _shapeClipper = ShapeBorderClipper(
    shape: StadiumBorder(
      side: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.red),
    ),
  );
}

class ImageListSlider extends StatelessWidget {
  final List<String> images;
  final EdgeInsetsGeometry padding;

  const ImageListSlider({Key key, this.images, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Swiper(
        autoplay: true,
        itemBuilder: (_, i) => CustomImage(images[i], fit: BoxFit.cover),
        itemCount: images.length,
        pagination: SwiperPagination(),
      ),
    );
  }
}
