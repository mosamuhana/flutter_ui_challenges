import 'package:flutter/material.dart';

import '../data.dart';
import '../grocery_details_page.dart';
import '../models.dart';
import '../widgets/grocery_category.dart';
import '../widgets/grocery_list_item.dart';
import '../widgets/grocery_new_arrival_item.dart';

class GroceryHomeTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildCategories(),
        _hbox10,
        _buildNewArrivals(context),
        _hbox10,
        _buildDailyNeeds(context),
      ],
    );
  }

  Widget _buildDailyNeeds(BuildContext context) {
    var items = getDailyNeedsItems();

    return Column(
      children: [
        _buildListHeader(title: "DAILY NEEDS", onTap: () => print('SEE ALL DAILY NEEDS')),
        _hbox10,
        ...List.generate(items.length, (i) {
          final item = items[i];
          return GroceryListItem(
            item: item,
            onTap: () => _openDetailPage(context, item),
          );
        }),
      ],
    );
  }

  Widget _buildNewArrivals(BuildContext context) {
    var items = getNewArrivalItems();

    return Column(
      children: [
        _buildListHeader(title: "NEW ARRIVALS", onTap: () => print('SEE ALL NEW ARRIVALS')),
        Container(
          padding: _insets10,
          height: 290,
          child: Row(
            children: List.generate(items.length, (i) {
              var item = items[i];
              return Expanded(
                child: GroceryNewArrivalItem(
                  item: item,
                  onAddtoCart: () => print('Add to Cart ${item.title}'),
                  onTap: () => _openDetailPage(context, item),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildListHeader({String title, VoidCallback onTap}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: _insetsL10,
            padding: _insetsH10V5,
            color: Colors.red,
            child: Text(title, style: _whiteStyle),
          ),
          Container(
            margin: _insetsR10,
            padding: _insetsH10V5,
            child: InkWell(
              onTap: onTap,
              child: Text('SEE ALL', style: _redStyle),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    var items = getCategories();
    return Container(
      height: 100,
      child: Row(
        children: [
          for (var item in items) ...[
            _wbox10,
            GroceryCategory(item: item),
          ],
        ],
      ),
    );
  }

  void _openDetailPage(BuildContext context, GroceryItem item) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GroceryDetailsPage(item: item)));
  }

  final _hbox10 = SizedBox(height: 10);
  final _wbox10 = SizedBox(width: 10);

  final _insets10 = EdgeInsets.all(10);
  final _insetsL10 = EdgeInsets.only(left: 10);
  final _insetsR10 = EdgeInsets.only(right: 10);
  final _insetsH10V5 = EdgeInsets.symmetric(horizontal: 10, vertical: 5);

  final _whiteStyle = TextStyle(color: Colors.white);
  final _redStyle = TextStyle(color: Colors.red);
}
