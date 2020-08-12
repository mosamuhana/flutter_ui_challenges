import 'package:flutter/material.dart';

import '../../../core/widgets.dart';

const _hbox10 = SizedBox(height: 10);
const _wbox5 = SizedBox(width: 5);

const _titleStyle = TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w700, fontSize: 17);
const _catagoryStyle = TextStyle(fontSize: 14, color: Colors.black87);
const _placeStyle = TextStyle(fontSize: 14, color: Colors.black87);
const _style13 = TextStyle(fontSize: 13);
const _whiteStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.normal);

const _paddingItem = EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20);
const _paddingAll10 = EdgeInsets.all(10);
const _paddingAll8 = EdgeInsets.all(8);
const _paddingAll6 = EdgeInsets.all(6);

const _filterListIcon = Icon(Icons.filter_list);

final List<_Item> _data = [
  _Item(
    title: 'Gardens By the Bay',
    catagory: "Gardens",
    place: "Singapore",
    ratings: 5,
    discount: "10 %",
    image: "https://images.pexels.com/photos/672142/pexels-photo-672142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ),
  _Item(
    title: 'Singapore Zoo',
    catagory: "Parks",
    place: "Singapore",
    ratings: 4,
    discount: null,
    image:
        "https://images.pexels.com/photos/1736222/pexels-photo-1736222.jpeg?cs=srgb&dl=adult-adventure-backpacker-1736222.jpg&fm=jpg",
  ),
  _Item(
    title: 'National Orchid Garden',
    catagory: "Parks",
    place: "Singapore",
    ratings: 4,
    discount: "12 %",
    image: "https://images.pexels.com/photos/62403/pexels-photo-62403.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ),
  _Item(
    title: 'Godabari',
    catagory: "Parks",
    place: "Singapore",
    ratings: 3,
    discount: "15 %",
    image: "https://images.pexels.com/photos/189296/pexels-photo-189296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ),
  _Item(
    title: 'Rara National Park',
    catagory: "Parks",
    place: "Singapore",
    ratings: 4,
    discount: "12 %",
    image: "https://images.pexels.com/photos/1319515/pexels-photo-1319515.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ),
];

class PlaceList1 extends StatelessWidget {
  static final String path = "lib/src/pages/lists/list1.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place List 1"),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 2,
        actions: [
          Container(
            padding: _paddingAll10,
            child: _filterListIcon,
          )
        ],
      ),
      body: ListView.builder(
        padding: _paddingAll6,
        itemCount: _data.length,
        itemBuilder: (_, i) => _ItemCard(item: _data[i]),
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final _Item item;

  const _ItemCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          _image,
          _info,
        ],
      ),
    );
  }

  Widget get _image {
    return Stack(
      children: [
        Container(
          height: 125,
          width: 110,
          padding: _paddingItem,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(item.image), fit: BoxFit.cover),
          ),
        ),
        if (item.discount != null)
          Positioned(
            right: 2,
            bottom: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrange,
              ),
              child: Text(item.discount, style: _whiteStyle),
            ),
          ),
      ],
    );
  }

  Widget get _info {
    return Padding(
      padding: _paddingAll8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: _titleStyle),
          Text(item.catagory, style: _catagoryStyle),
          Text(item.place, style: _placeStyle),
          _hbox10,
          Rating(value: item.ratings),
          Row(
            children: [
              Text('${item.ratings}', style: _style13),
              _wbox5,
              Text("Ratings", style: _style13),
            ],
          ),
        ],
      ),
    );
  }
}

class _Item {
  final String title;
  final String catagory;
  final String place;
  final int ratings;
  final String discount;
  final String image;

  _Item({
    this.title,
    this.catagory,
    this.place,
    this.ratings,
    this.discount,
    this.image,
  });
}
