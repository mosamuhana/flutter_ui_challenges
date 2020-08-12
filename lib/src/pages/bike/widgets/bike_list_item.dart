import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

const String _bikeImage = "$STORE_BASE_URL/bike%2Fbike1.jpg?alt=media";

const _hbox5 = SizedBox(height: 5);
const _wbox10 = SizedBox(width: 10);

const _paddingAll16 = EdgeInsets.all(16);

final _yearStyle = TextStyle(color: Colors.grey.shade700);
const _titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

final _circularBorder4 = BorderRadius.circular(4);

final _circularBorderRight4 = BorderRadius.only(
  topRight: Radius.circular(4),
  bottomRight: Radius.circular(4),
);

final _circularBorderLeft4 = BorderRadius.only(
  topLeft: Radius.circular(4),
  bottomLeft: Radius.circular(4),
);

class BikeListItem extends StatelessWidget {
  final String thirdTitle;
  final bool imageRight;
  final double elevation;
  final void Function() onTap;

  const BikeListItem({
    Key key,
    this.thirdTitle,
    this.imageRight = false,
    this.elevation = 0.5,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: InkWell(
        borderRadius: _circularBorder4,
        onTap: onTap,
        child: Row(
          children: [
            _thumbnail,
            Expanded(
              child: Container(
                padding: _paddingAll16,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _title(context),
                    _hbox5,
                    _year,
                    _hbox5,
                    _condition,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'Bajaj Pulsar 220F',
            style: _titleStyle,
            softWrap: true,
          ),
        ),
        _buildTag(context)
      ],
    );
  }

  Widget get _year {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Year 2019"),
        ],
      ),
      style: _yearStyle,
    );
  }

  Widget get _condition {
    return Row(
      children: [
        Text("Condition"),
        _wbox10,
        Rating(value: 5),
      ],
    );
  }

  Widget get _thumbnail {
    BorderRadius borderRadius;
    if (imageRight) {
      borderRadius = _circularBorderRight4;
    } else {
      borderRadius = _circularBorderLeft4;
    }

    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(image: NetworkImage(_bikeImage), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTag(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
      child: Text(
        "Rs. 1,80,000",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
