import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'article.dart';

class ArticleCard extends StatelessWidget {
  final Article item;

  ArticleCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: 90,
            height: 90,
            color: _bgColor,
          ),
          Container(
            color: Colors.white,
            padding: _insets16,
            margin: _insets16,
            child: Row(
              children: [
                Container(
                  height: 100,
                  color: Colors.blue,
                  width: 80,
                  child: CustomImage(item.image, fit: BoxFit.cover),
                ),
                _wbox20,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.title,
                        textAlign: TextAlign.justify,
                        style: _boldS14Style,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: CircleAvatar(radius: 15, backgroundColor: _primaryColor),
                            ),
                            WidgetSpan(child: _wbox5),
                            TextSpan(text: item.author, style: _s16Style),
                            WidgetSpan(child: _wbox20),
                            WidgetSpan(child: _wbox5),
                            TextSpan(text: item.time),
                          ],
                        ),
                        style: _h2Style,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final _wbox5 = SizedBox(width: 5);
  final _wbox20 = SizedBox(width: 20);

  final _boldS14Style = TextStyle(color: _secondaryColor, fontWeight: FontWeight.bold, fontSize: 14);
  final _s16Style = TextStyle(fontSize: 16);
  final _h2Style = TextStyle(height: 2);

  final _insets16 = EdgeInsets.all(16);
}

final _primaryColor = Color(0xffFD6592);
final _secondaryColor = Color(0xff324558);
final _bgColor = Color(0xffF9E0E3);
