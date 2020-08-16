import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class DashboardThreePage extends StatefulWidget {
  static final String path = "lib/src/pages/dashboard/dash3.dart";

  @override
  _DashboardThreePageState createState() => _DashboardThreePageState();
}

class _DashboardThreePageState extends State<DashboardThreePage> {
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
              leading: _BarChart(
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
              leading: _BarChart(
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
              child: _TileContainer(
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
              child: _TileContainer(
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
              child: _TileContainer(
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
              child: _TileContainer(
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
              child: _TileContainer(
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

class _BarChart extends StatelessWidget {
  final double barWidth;
  final List<double> values;
  final int activeIndex;
  final Color activeColor;
  final Color inactiveColor;

  const _BarChart({
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

class _TileContainer extends StatelessWidget {
  final double height;
  final String title;
  final IconData icon;
  final String data;
  final Color color;
  final Color backgroundColor;

  const _TileContainer({
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

const _hbox5 = SizedBox(height: 5);
const _hbox10 = SizedBox(height: 10);
const _hbox16 = SizedBox(height: 16);
const _hbox20 = SizedBox(height: 20);
const _wbox4 = SizedBox(width: 4);
const _wbox16 = SizedBox(width: 16);

const _whiteStyle = TextStyle(color: Colors.white);
const _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
const _whiteBoldS20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
const _whiteW500S18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);

const _insets8 = EdgeInsets.all(8);
const _insets16 = EdgeInsets.all(16);
const _insetsL16 = EdgeInsets.only(left: 16);
const _insetsH16 = EdgeInsets.symmetric(horizontal: 16);
const _insetsL0T50R0B32 = EdgeInsets.fromLTRB(0, 50, 0, 32);

const _verticalDivider = VerticalDivider();

const _circularRadius20 = Radius.circular(20);
const _circularRadius4 = Radius.circular(4);

const _circularBorder4 = BorderRadius.all(_circularRadius4);
const _circularBottomBorder20 = BorderRadius.only(bottomLeft: _circularRadius20, bottomRight: _circularRadius20);
