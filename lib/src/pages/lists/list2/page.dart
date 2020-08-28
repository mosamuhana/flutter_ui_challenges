import 'package:flutter/material.dart';

import 'data.dart';
import 'school_item.dart';

class List2Page extends StatefulWidget {
  static final String path = "lib/src/pages/lists/list2/page.dart";

  _List2PageState createState() => _List2PageState();
}

class _List2PageState extends State<List2Page> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              _list,
              _header,
              _search,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _list {
    return Container(
      padding: _insetsT145,
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: ListView.builder(
        itemCount: dummyItemList.length,
        itemBuilder: (_, i) => SchoolItem(item: dummyItemList[i]),
      ),
    );
  }

  Widget get _header {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _primaryColor,
        borderRadius: _circularBottomBorder30,
      ),
      child: Padding(
        padding: _insetsH30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: _menuIcon,
            ),
            Text("Institutes", style: _whiteS24Style),
            IconButton(
              onPressed: () {},
              icon: _filterListIcon,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _search {
    return Container(
      child: Column(
        children: [
          _hbox110,
          Padding(
            padding: _insetsH20,
            child: Material(
              elevation: 5,
              borderRadius: _circularBorder30,
              child: TextField(
                // controller: TextEditingController(text: locations[0]),
                cursorColor: Theme.of(context).primaryColor,
                style: _blackS18Style,
                decoration: InputDecoration(
                  hintText: "Search School",
                  hintStyle: _black38S16Style,
                  prefixIcon: Material(
                    elevation: 0,
                    borderRadius: _circularBorder30,
                    child: _searchIcon,
                  ),
                  border: InputBorder.none,
                  contentPadding: _insetsH25V13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final _primaryColor = Color(0xff696b9e);

  final _hbox110 = SizedBox(height: 110);

  final _blackS18Style = TextStyle(color: Colors.black, fontSize: 18);
  final _whiteS24Style = TextStyle(color: Colors.white, fontSize: 24);
  final _black38S16Style = TextStyle(color: Colors.black38, fontSize: 16);

  final _menuIcon = Icon(Icons.menu, color: Colors.white);
  final _filterListIcon = Icon(Icons.filter_list, color: Colors.white);
  final _searchIcon = Icon(Icons.search);

  final _circularBottomBorder30 = BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30));

  final _circularBorder30 = BorderRadius.circular(30);

  final _insetsH30 = EdgeInsets.symmetric(horizontal: 30);
  final _insetsH20 = EdgeInsets.symmetric(horizontal: 20);
  final _insetsH25V13 = EdgeInsets.symmetric(horizontal: 25, vertical: 13);
  final _insetsT145 = EdgeInsets.only(top: 145);
}
