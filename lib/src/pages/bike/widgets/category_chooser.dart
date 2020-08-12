import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

const String _bikeImage = "$STORE_BASE_URL/bike%2Fbike1.jpg?alt=media";

const _hbox5 = SizedBox(height: 5);
const _wbox10 = SizedBox(width: 10);

const _typeStyle = TextStyle(fontWeight: FontWeight.w500);

const _padding_v8_h16 = EdgeInsets.symmetric(vertical: 8, horizontal: 16);

class CategoryChooser extends StatelessWidget {
  final Function(String) onTap;

  const CategoryChooser({
    Key key,
    this.onTap,
  }) : super(key: key);

  final List<String> types = const ["Standard", "Cruiser", "Sports", "Dirt", "Scooter", "Electric"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        padding: _padding_v8_h16,
        scrollDirection: Axis.horizontal,
        itemCount: types.length,
        itemBuilder: (context, index) {
          String type = types[index];
          return GestureDetector(
            onTap: onTap != null ? () => onTap(type) : null,
            child: Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(_bikeImage), fit: BoxFit.cover),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                _hbox5,
                Text(type, style: _typeStyle),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => _wbox10,
      ),
    );
  }
}
