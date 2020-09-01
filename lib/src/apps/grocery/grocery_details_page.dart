import 'package:flutter/material.dart';

import '../../../core/widgets.dart';
import 'widgets/grocery_list_item.dart';
import 'widgets/grocery_title.dart';
import 'widgets/grocery_subtitle.dart';
import 'models.dart';
import 'data.dart';

class GroceryDetailsPage extends StatelessWidget {
  static final String path = "lib/src/pages/grocery/gdetails.dart";

  final GroceryItem item;

  GroceryDetailsPage({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text("Details"),
      ),
      body: _buildPageContent(context),
    );
  }

  Widget _buildPageContent(context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Stack(
                children: [
                  Card(
                    margin: _insetsL20T20R20,
                    child: Container(
                      padding: _insets20,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: _favoriteBorderIcon,
                              )
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: CustomImage(item.image, height: 200),
                          ),
                          _hbox10,
                          GroceryTitle(text: item.title),
                          _hbox5,
                          GrocerySubtitle(text: item.package),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: _insets30,
                child: GrocerySubtitle(text: item.description),
              ),
              _relatedItemList,
            ],
          ),
        ),
        _addToCartButton,
      ],
    );
  }

  Widget get _addToCartButton {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.green,
            child: FlatButton(
              child: Text("Add to Cart"),
              color: Colors.green,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget get _relatedItemList {
    var items = getRelatedItem(item.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: _insetsL20B20,
          child: GroceryTitle(text: "Related Items"),
        ),
        ...List.generate(items.length, (i) => GroceryListItem(item: items[i])),
      ],
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _insetsL20T20R20 = EdgeInsets.only(top: 20, left: 20, right: 20);
  final _insetsL20B20 = EdgeInsets.only(left: 20, bottom: 10);
  final _insets20 = EdgeInsets.all(20);
  final _insets30 = EdgeInsets.all(30);
  final _favoriteBorderIcon = Icon(Icons.favorite_border);
}
