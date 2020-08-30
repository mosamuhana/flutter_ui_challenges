import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class Dashboard3Page extends StatefulWidget {
  static final String path = "lib/src/pages/dashboard/dashboard3/page.dart";

  @override
  _Dashboard3PageState createState() => _Dashboard3PageState();
}

class _Dashboard3PageState extends State<Dashboard3Page> {
  int currentNavIndex = 0;

  final avatarImage = '$STORE_BASE_URL/img%2F1.jpg?alt=media';
  final profileTitle = 'Dashboard';
  final profileName = 'Dr. John Doe';
  final profileDescription = 'Md, (General Medium), DM\n(Cardiology)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _bottomNavigationBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header,
            _hbox20,
            Padding(
              padding: _insetsL16,
              child: Text("Appointments", style: _boldS18Style),
            ),
            _chartsCard,
            ..._tilesGrid,
            _hbox20,
          ],
        ),
      ),
    );
  }

  Widget get _bottomNavigationBar {
    BottomNavigationBarItem _createNavItem(String title, IconData icon) =>
        BottomNavigationBarItem(icon: Icon(icon), title: Text(title));

    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: currentNavIndex,
      onTap: (i) => setState(() => currentNavIndex = i),
      items: [
        _createNavItem('Home', Icons.home),
        _createNavItem('Refer', Icons.person_add),
        _createNavItem('History', Icons.history),
        _createNavItem('Profile', Icons.person_outline),
      ],
    );
  }

  Widget get _header {
    return Container(
      padding: _insetsL0T50R0B32,
      decoration: BoxDecoration(
        borderRadius: _circularBottomBorder20,
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(profileTitle, style: _whiteBoldS20Style),
            trailing: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(avatarImage),
            ),
          ),
          _hbox10,
          Padding(
            padding: _insetsL16,
            child: Text(profileName, style: _whiteW500S18Style),
          ),
          _hbox5,
          Padding(
            padding: _insetsL16,
            child: Text(profileDescription, style: _whiteStyle),
          ),
        ],
      ),
    );
  }

  Widget get _chartsCard {
    return Card(
      elevation: 4,
      color: Colors.white,
      margin: _insets16,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: BarChart(
                barWidth: 8,
                activeColor: Colors.blue,
                inactiveColor: Colors.grey.shade300,
                activeIndex: 2,
                values: [20, 25, 40, 30],
              ),
              title: Text("Today"),
              subtitle: Text("18 patients"),
            ),
          ),
          _verticalDivider,
          Expanded(
            child: ListTile(
              leading: BarChart(
                barWidth: 8,
                activeColor: Colors.red,
                inactiveColor: Colors.grey.shade300,
                activeIndex: 2,
                values: [20, 25, 40, 30],
              ),
              title: Text("Canceled"),
              subtitle: Text("7 patients"),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get _tilesGrid {
    return [
      Padding(
        padding: _insetsH16,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TileContainer(
                icon: Icons.portrait,
                title: 'Number of Patient',
                data: '1200',
                color: Colors.white,
                backgroundColor: Colors.pink,
                height: 150,
              ),
            ),
            _wbox16,
            Expanded(
              child: TileContainer(
                icon: Icons.portrait,
                title: 'Admitted',
                data: '857',
                color: Colors.white,
                backgroundColor: Colors.green,
                height: 150,
              ),
            ),
          ],
        ),
      ),
      _hbox16,
      Padding(
        padding: _insetsH16,
        child: Row(
          children: [
            Expanded(
              child: TileContainer(
                icon: Icons.favorite,
                title: 'Discharged',
                data: '864',
                color: Colors.white,
                backgroundColor: Colors.blue,
                height: 150,
              ),
            ),
            _wbox16,
            Expanded(
              child: TileContainer(
                icon: Icons.portrait,
                title: 'Dropped',
                data: '857',
                color: Colors.white,
                backgroundColor: Colors.pink,
                height: 150,
              ),
            ),
            _wbox16,
            Expanded(
              child: TileContainer(
                icon: Icons.favorite,
                title: 'Arrived',
                data: '698',
                color: Colors.white,
                backgroundColor: Colors.blue,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    ];
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ----------------------------------------------------------
// ----------------------------------------------------------------------------------

class BarChart extends StatelessWidget {
  final double barWidth;
  final List<double> values;
  final int activeIndex;
  final Color activeColor;
  final Color inactiveColor;

  BarChart({
    Key key,
    this.barWidth = 8,
    this.inactiveColor,
    this.activeColor,
    @required this.values,
    @required this.activeIndex,
  })  : assert(values != null && values.length > 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = values.length * barWidth + (values.length - 1) * 4;
    print('Bar Width: $width');

    return Container(
      alignment: Alignment.bottomCenter,
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _bars,
      ),
    );
  }

  List<Widget> get _bars {
    final _inactiveColor = inactiveColor ?? Colors.grey.shade300;
    final _activeColor = activeColor ?? Colors.blue;
    final list = <Widget>[];

    values.asMap().forEach((index, value) {
      final color = activeIndex == index ? _activeColor : _inactiveColor;
      if (index > 0) list.add(_wbox4);
      list.add(Container(width: barWidth, height: value, color: color));
    });

    return list;
  }
}

class TileContainer extends StatelessWidget {
  final double height;
  final String title;
  final IconData icon;
  final String data;
  final Color color;
  final Color backgroundColor;

  TileContainer({
    Key key,
    @required this.height,
    @required this.title,
    @required this.icon,
    @required this.data,
    @required this.backgroundColor,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(color: color, fontWeight: FontWeight.bold);

    return Container(
      padding: _insets8,
      height: height,
      decoration: BoxDecoration(borderRadius: _circularBorder4, color: backgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: color),
          Text(title, style: titleStyle),
          Text(data, style: titleStyle.copyWith(fontSize: 20)),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

final _hbox5 = SizedBox(height: 5);
final _hbox10 = SizedBox(height: 10);
final _hbox16 = SizedBox(height: 16);
final _hbox20 = SizedBox(height: 20);
final _wbox4 = SizedBox(width: 4);
final _wbox16 = SizedBox(width: 16);

final _whiteStyle = TextStyle(color: Colors.white);
final _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
final _whiteBoldS20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
final _whiteW500S18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);

final _insets8 = EdgeInsets.all(8);
final _insets16 = EdgeInsets.all(16);
final _insetsL16 = EdgeInsets.only(left: 16);
final _insetsH16 = EdgeInsets.symmetric(horizontal: 16);
final _insetsL0T50R0B32 = EdgeInsets.fromLTRB(0, 50, 0, 32);

final _verticalDivider = VerticalDivider();

final _circularRadius20 = Radius.circular(20);
final _circularRadius4 = Radius.circular(4);

final _circularBorder4 = BorderRadius.all(_circularRadius4);
final _circularBottomBorder20 = BorderRadius.only(bottomLeft: _circularRadius20, bottomRight: _circularRadius20);
