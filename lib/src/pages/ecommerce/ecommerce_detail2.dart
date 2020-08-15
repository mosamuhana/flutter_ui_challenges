import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class EcommerceDetailTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce_detail2.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView(
            children: [
              PNetworkImage(_image),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Expanded(child: buildDropdownButton(['Black', 'Blue', 'Red'], 'Black')),
                    Expanded(child: buildDropdownButton(['S', 'M', 'XL', 'XXL'], 'XXL')),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text(
                  "Kapka Valour",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _wbox20,
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        _wbox5,
                        Text("5.0 stars", style: TextStyle(color: Colors.grey, fontSize: 14))
                      ],
                    ),
                  ),
                  Text(
                    "\$5500",
                    style: TextStyle(color: Colors.red, fontSize: 30),
                  ),
                  _wbox20,
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                brightness: Brightness.light,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  "Back to Shopping",
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Colors.deepOrange,
                      elevation: 0,
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Buy",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      color: Colors.black54,
                      elevation: 0,
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Add a bag",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDropdownButton(List<String> items, String selectedValue) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedValue,
      onChanged: (_) {},
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

const _image = '$STORE_BASE_URL/img%2F5.jpg?alt=media';

const _wbox5 = SizedBox(width: 5);
const _wbox20 = SizedBox(width: 20);
