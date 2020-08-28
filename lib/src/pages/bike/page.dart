import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'bike_list_item.dart';
import 'details.dart';
import 'data.dart';

class BikeHomePage extends StatelessWidget {
  static final String path = "lib/src/pages/bike/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bikes')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: _insetsL16T16,
              child: Text("Categories", style: Theme.of(context).textTheme.subtitle1),
            ),
            _buildCategories(context),
            _hbox10,
            Padding(
              padding: _insetsH16,
              child: Card(
                child: Container(
                  height: 150,
                  decoration: _cardDecoration,
                  child: Swiper(
                    itemCount: dummyData.swiperItems.length,
                    itemBuilder: (_, i) => _buildSwiperItem(i),
                  ),
                ),
              ),
            ),
            _hbox16,
            _buildPosts(context),
            _hbox20,
          ],
        ),
      ),
    );
  }

  Widget _buildPosts(BuildContext context) {
    List<Widget> children = dummyData.bikes.map((item) {
      return BikeListItem(
        item: item,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsPage(item: item))),
      );
    }).toList();

    return Column(
      children: [
        Padding(
          padding: _insetsH16,
          child: Row(
            children: [
              Text(
                "Recent Posts",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Spacer(),
              FlatButton(
                child: Text("View all"),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: _insetsH16,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildSwiperItem(int index) {
    var item = dummyData.swiperItems[index];
    return Row(
      children: [
        _wbox20,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.title, style: _whiteBold20Style),
              Text(item.subtitle, style: _whiteW500S18Style),
            ],
          ),
        ),
        _wbox10,
        CircleAvatar(
          backgroundColor: Colors.indigo.shade800,
          radius: 50,
          child: Icon(item.icon, size: 30),
        ),
        _wbox20,
      ],
    );
  }

  Widget _buildCategories(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        padding: _insetsH16V8,
        scrollDirection: Axis.horizontal,
        itemCount: dummyData.categories.length,
        itemBuilder: (_, index) {
          var item = dummyData.categories[index];
          return GestureDetector(
            onTap: () {
              print('Select Category: ${item.name}');
              //Navigator.pushNamed(context, 'category_bikes', arguments: category);
            },
            child: Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(item.image), fit: BoxFit.cover),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                _hbox5,
                Text(item.name, style: _w500Style),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => _wbox10,
      ),
    );
  }

  final _hbox16 = SizedBox(height: 16);
  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _wbox10 = SizedBox(width: 10);
  final _wbox20 = SizedBox(width: 20);
  final _hbox5 = SizedBox(height: 5);

  final _insetsL16T16 = EdgeInsets.only(left: 16, top: 16);
  final _insetsH16 = EdgeInsets.symmetric(horizontal: 16);
  final _insetsH16V8 = EdgeInsets.symmetric(vertical: 8, horizontal: 16);

  final _whiteBold20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
  final _whiteW500S18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);
  final _w500Style = TextStyle(fontWeight: FontWeight.w500);

  final _cardDecoration = BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.indigo);
}
